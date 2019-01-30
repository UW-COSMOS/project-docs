# Design and implementation of model equation and table/figure extraction methods
## Introduction
Here we provide an interim report on the design and implementation of our prototype system for automatically locating and extracting from the published literature data and information pertinent to scientific models. Two primary tasks constituted the focus of this project milestone:

1. Model equation extraction from PDFs
2. Table/figure extraction from PDFs

Both of these tasks require the development and deployment of methods to automatically visually segment, classify, and represent heterogeneous elements (i.e., equations, tables, figures, captions, body text blocks) within PDF documents from multiple publishers in a way that maintains contextual relationships to text-based information. Extracted equation, table, and figure elements and text must then be represented in a way that can be used in inference steps (i.e., automated knowledge base construction). We focus functionality on PDF input because the majority of published data and information in many domains of science, particularly those with field-based observational data, are available primariy or exclusively in PDF formats.

Below, we first describe the general nature of the problem and our multimodal approach. Next, we document the software tools that we are developing and/or modifying to address the problem. We then provide initial quantitative results describing the recall and precision of equation, table, and figure element extraction from full-text PDFs from multiple different commercial and open-access sources. The performance of our code and workflow and our ability to scale to multiple millions of documents in xDD infrastructure are also preliminarily assessed.

### Objectives and Challenges
The following visual excerpt from a PDF, manually annotated using our in-house image tagging [application](https://github.com/UW-COSMOS/image-tagger), contains body text blocks, equations, equation labels, a figure, and a figure caption:  

<img src="images/annotated_doc.png" alt="annotated_doc" width="700"/>

Our primary objective is to automatically recognize and visually extract all of these components from heterogeneous scientific publications while at the same time preserving explicit association with text-based information. For example, Equation 33, above, contains the variable *I<sub>av</sub>*, which is described in plain language in the underlying body text element. Similarly, the lowest body text block contains call-outs to specific equations [(8)-(10) and (15)-(17)] which identify them as *radical producing and consumption reactions.* This text-derived semantic description of equations is required to understand the phenomena and contexts to which they apply. Table and figure elements have analogous properties, and fully understanding their contents usually requires incorporation of information from associated captions. Labels for figures and tables (e.g., Fig. 7, Table 1) also relate the content to more complete semantic descriptions in body text.

Ultimately, text, tables, figures, and equations must be parsed, read and explicitly related to one another in order to create a knowledge base that can used to inform scientific models. An example of equation and text-entity recognition and tuple extraction suitable for representation in a simple knowledge base follows:   

<img src="images/eq_kb.png" alt="kb_task" width="400"/>

## Executive Summary: Infrastructure and Software Components
There are three main computing infrastructure and software components in the DARPA TA1 COSMOS project:

1. Document fetching, storage, and pre-processing systems
2. Document annotation and training data acquisition
2. Document segmentation and segment classification
3. Fonduer-based model extraction

The combination of these three components provides a cross-disciplinary platform for accelerating the reproducibility and scalability of key elements of scientific research and provides an infrastructure for scientific model curation and construction (Phase II COSMOS project objective). Below we describe the design and implementation of our prototype COSMOS system:

<img src="images/cosmos_pipeline.png" alt="pipeline overview", with="400" />

#### Document Fetching, Storage and Processing System
The COSMOS document acquisition, storage, and the processing systems are integrated into the xDD (formerly GeoDeepDive) system. This infrastructure is built to:

1. Acquire and store PDF documents from partnered publishers, along with high-quality bibliographical metadata
2. Extract and store the text layer from the PDF documents, allowing real-time discovery of relevant literature.
3. Process the stored documents, either via UW-Madison's Center for High Throughput Computing (CHTC) cluster or on machines purchased specifically for the COSMOS project

Metadata (including tracking how documents have been processed) is stored in a mongoDB instance, with a shadowed Elasticsearch instance running alongside to enable robust and scalable searching of the documents' metadata (including text contents when available).

##### Document fetching and storage
Through agreements with publishers, negotiated by University of Wisconsin Libraries, XDD is allowed to acquire and store PDF versions of an enormous corpus of academic literature. Each agreement is negotiated to permit key functionality, notably the ability to securely store copies of published documents (PDFs) and bibliographic metadata for internal processing. However, XDD does not permit any access to the stored documents themselves. Instead, XDD provides bibliographic citations and DOI links which point to the content on the publisher’s own platforms. The ability to access the original text on publisher platforms depends on a user’s subscription or institutional access. As per our license agreements, data products sourced from the original PDFs, described below, are provided to users, and form the basis of user-directed research projects.

Data enters the XDD Infrastructure via the fetching process on a secure storage machine. This is a two-step process. First, the bibliographical metadata (including URLs to the PDF document) from publishers is downloaded, either through publisher-provided means (files, API) or via a third party system (such as CrossRef (CITE)). Second, a PDF document fetcher read this data back out using a separate process, downloading the documents from the stored URL, and stores the PDF (along with a JSON dump of the metadata) to the local file system, backed up nightly.

Once a document is fetched and its pdf is stored, its metadata is pushed into a central mongodb repository. At this point, the text layer is extracted from the text via poppler's pdftotext (CITE) tool. This text layer, like the PDF document itself, is never provided to XDD users fullstop. Instead, it is made searchable via Elasticsearch and is used as an initial starting point for some text-based processing pipelines within XDD (such as application of Stanford's CoreNLP or Google's word2vec (CITE)).

Although exact document acquisition allowances and interfaces vary between publishers, several criteria and objectives are shared between them. The software components of XDD's fetching system are designed to leave as little as possible being specialized for each publisher. Shared implementation includes:

  - Mechanisms for rate management. Desired weekly document download rates are set, and the acquisition mechanism speeds or slows the current rates appropriately to stay as close to the weekly target rates as possible without crossing any defined hard limits.
  - Metadata acquisition via CrossRef. 
  - Document download, storage, and data integrity components
  - Database interfacing
  - Prioritization

The primary xDD corpus began with Elsevier in January of 2015 and has continued to grow steadily over time. Additional partnered publishers now include Wiley, Taylor and Francis, and a number of earth science-centered society publications (GSA, SEPM, USGS, Canadian Science Publishing). In addition, xDD houses open-access documents, including works from the Public Library of Science. The total number of documents within the xDD primary corpus, categorized by source, is shown below:

<img src="images/xdd_growth.png" alt="xDD Growth over time", width="800"/>

The xDD infrastructure also supports secondary corpuses, which are stored alongside the primary corpus but are accessible only to specific researchers. Use cases for these auxillary corpuses include researchers who have their own data they wish to be processed using the xDD processing pipelines ("bring-your-own-data" model) or corpuses with fundamentally different document structures (e.g the complete set of PubMed abstracts).


##### Document processing
The computational backbone of XDD is UW-Madison's Center for High-Throughput Computing (CHTC) (CITE), utilizing the HTCondor scheduling software (CITE). CHTC provides a large number of shared computing resources to researchers, with thousands of computing nodes serving up millions of hours of CPU time each year to hundreds of different projects. The high-throughput computing model is one in which the primary goal is maximizing overall throughput of a collection of tasks, each of which is computationally independent. The document processing requirements of XDD perfectly fits the model: applying a set of processing tools (Stanford's CoreNLP, a segmentation model, OCR) to a huge collection of documents results in millions of decoupled independent computing tasks. The integration between XDD and CHTC strives to:

1. Support rapid deployment of new tools against the corpus
2. Convert the PDF documents into data usable for a variety of text/datamining (TDM) analyses.
3. Provide a standardized set of useful TDM products.

The primary goal of supporting rapid deployment of new tools against the corpus is accomplished by creating a configuration-based system that:

1. Defines the computational task in a language that CHTC understands (creating _submit files_ and defining _jobs_ in HTCondor's vocabulary)
2. Defines a subset of documents/data products to operate on.
3. Gathering the requisite components and submitting the jobs to the CHTC system.
4. Updates the central metadata database with information about the documents' processing

The implementation is designed to be flexible, allowing a wide variety of tasks to be defined and run (examples: running custom font-recognition scripts on all documents that have already been OCRed within the system, or applying a segmentation model to a relevant subset of earth science PDFs). CHTC and the HTCondor software allow a wide variety of critical job configurations, including Docker/singularity support, enforcing the directories be encrypted (so that the PDFs are never outside of the job while running on CHTC), and workflow automation.



##### Hardware + uses

The COSMOS/xDD infrastructure is comprised of 9 machines, broken down into the general roles of:

1. Data acquisition, storage, and backup
2. Job submission interface into CHTC
3. One machine for dedicated storage of processing output
4. Two machines for database hosts.
5. Three machines for COSMOS computations. 

###### deepdivesubmit2000
**Purpose:** Submit jobs to HTCondor, store HTCondor output
**Software:**
+ HTCondor

**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| -- | 4  | - | 16GB  | - | - |
| (`gdd-datastorage`, network mounted)  |   |  |   | 44TB  | 18TB |

###### gdd-datastorage
**Purpose:** Storage for processed documents. 
**Hardware:** 44TB (7TB used)

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| Intel Xeon E5-2603 v4  |  6 | 1.70GHz | 4GB  | 44TB  | 18TB |


###### deepdive2000:
**Purpose:** Secondary Elastic instance, gateway
**Software:**
+ nginx
+ Elasticsearch, mongodb

**Notes:** Primarily a secondary Elasticsearch node + gateway for services
**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| AMD Opteron(tm) Processor 4180  | 12  | 2.6GHz | 32GB  | 37TB  | 2.9TB |


###### elsevier-1
**Purpose**: Fetch and store original PDFs
**Software:**
+ Postgres - keeps track of what is fetched and unfetched
+ Borg - automated backup to Elsevier-backup

**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| Intel Xeon E5-2603 v2  | 8  | 1.80GHz | 128GB  | 14TB  | 11TB |

###### elsevier-backup
**Purpose:** Backup of fetched PDFs
**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| Intel Xeon E5-2603 v4  | 6  | 1.70GHz | 4GB  | 23TB  | 11TB |

###### gdd-store
**Purpose:** xDD primary ElasticSearch data node, running xDD users' apps
**Software:**
+ ElasticSearch
+ User applications (R, etc)

**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| Intel Xeon E5-2630 v3  | 32  | 2.40GHz | 128GB  | 15TB  | 5.5TB |

###### cosmos0000
**Purpose:** Research machine for hosting lightweight tasks, data, and services
**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| VM  | 8  | 2.30GHz | 64GB  | 1TB  | 100GB |


###### cosmos0001 and cosmos0002
**Purpose:**  Dedicated GPU machines for model training and research experiments
**Hardware:**

| CPU  | Cores  | Speed  | RAM  | Disk  | Disk (used)  |
|---|---|---|---|---|---|
| Intel(R) Xeon(R) Gold 6148 CPU | 160  | 2.40GHz | 512GB  | 1.5TB SSD, 1.5TB HDD  | - |


##### Throughput/scalability
Scalability in xDD is accomplished by both scaling the primary data storage components (mongodb, Elasticsearch) horizontally and by relying on the immense resources of CHTC for computing power. With roughly 10,000 computing nodes available within CHTC, over a quarter million CPU hours are available to campus researchers each day. 

#### Collection of Training Data and Annotations
DAVEN annotation engine: 

#### Table, Figure, and Equation Extraction
ANKUR and JOSH: the abstract of what you are doing, maybe one or two *key* visuals

#### Model Extraction
PAUL Fonduer model: the abstract of what you are doing, maybe one or two *key* visuals

## Technical Overview
*FOLLOWING THE GENERAL OUTLINE ABOVE, THIS IS WHERE WE NEED DETAILS OF ALGORITHMS AND PIPELINE WITH QUANTITATIVE/QUALITATIVE RESULTS*

#### Table, Figure, and Equation Extraction
ANKUR and JOSH
##### Evaluation and Performance
*ideally this includes qualitative examples (images) and estimates of **recall and precision**. NB: Shanan and Daven can help generate these estimates once we have output in annotation system.*

#### Model Extraction
PAUL Fonduer model
#### Evaluation and Performance
The current xDD pipelines regularly utilize on the order of 5,000 CPU hours per day on CHTC. This utilization represents the 'steady-state' CPU requirement of xDD, including only the running of the daily fetched documents through the standard (OCR, coreNLP) pipelines.  Past sprints have pushed xDD CHTC usage over 50,000 CPU hours utilized in a day, and it is not uncommon for CHTC to provide upwards of 100,000 hours of CPU to a user in a day. 

Early experiments with a prior segmentation model are positive, with the infrastructure easily supporting simultaneous application of the model to thousands of documents in un-optimized CPU-only trial runs. Initial tests suggest that this version of the segmentation process requires on the order of one CPU minute per page processed. With a an average of around 12 pages per document, this corresponds to an overall throughput of 5 documents per CPU-hour. Because CHTC is a shared resource, it is difficult to predict daily availability and usage, but historical results indicate that a daily document throughputs of 25,000-100,000 documents should be expected. Both internal (code-level) and external (CHTC resource request) optimization is expected to improve overall throughput.


### Conclusions and Next Steps

### References
