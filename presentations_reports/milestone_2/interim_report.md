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

#### Document Fetching, Storage and Processing System
IAN add basic xDD system description, throughput of documents/scalability and information here; be sure to include new project machine stats

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
##### Evaluation and Performance
IAN xDD throughput and estimated throughput capacity of segmentation/model software components

### Conclusions and Next Steps

### References
