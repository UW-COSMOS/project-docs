## Design and implementation of model equation and table/figure extraction methods
### Introduction
Here we provide an interim report on the design and implementation of our prototype system for automatically locating and extracting from the published literature data and information pertinent to scientific models. Two primary tasks constituted the focus of this project milestone:

1. Model equation extraction from PDFs
2. Table/figure extraction from PDFs

Both of these tasks required the development of methods to automatically visually segment, classify, and represent heterogeneous elements (i.e., equations, tables, figures, captions, body text blocks) within PDF documents in a way that maintains contextual relationships to text-based information. These extracted equation, table, and figure elements and text must then be represented in a way that can be used in inference steps (i.e., automated knowledge base construction).

Below, we first describe the general nature of the problem and our multimodal approach. Next, we document the software tools that were developed and/or modified to address the problem. We then provide initial quantitative results describing the recall and precision of equation, table, and figure element extraction from PDFs from multiple different commercial and open-access publications. The performance of our code and workflow and our ability to scale to multiple millions of documents in xDD infrastructure are also assessed.

### Objectives and Challenges
The following visual excerpt from a PDF, manually annotated using our in-house image tagging [application](https://github.com/UW-COSMOS/image-tagger-api), contains body text blocks, equations, equation labels, a figure, and a figure caption:  

<img src="images/annotated_doc.png" alt="annotated_doc" width="700"/>

Our primary objective is to automatically recognize and visually extract these components from heterogeneous scientific publications while at the same time preserving explicit association with text-based information. For example, Equation 33, above, contains the variable *I<sub>av</sub>*, which is described in plain language in the underlying body text element. Similarly, the lowest body text block contains call-outs to specific equations [(8)-(10) and (15)-(17)] which identify them as *radical producing and consumption reactions.* This text-derived semantic description of equations is required to understand the phenomena and contexts to which they apply. Table and figure elements have analogous properties, and fully understanding their contents usually requires incorporation of information from associated captions. Labels for figures and tables (e.g., Fig. 7, Table 1) also relate the content to more complete semantic descriptions in body text.

Ultimately, text, tables, figures, and equations must be parsed, read and explicitly related to one another in order to create a knowledge base that can used to inform scientific models. An example of equation and text-entity recognition and tuple extraction suitable for representation in a simple knowledge base follows:   

<img src="images/eq_kb.png" alt="kb_task" width="400"/>

### Infrastructure and Software Components
There are three main computing infrastructure and software components in the DARPA TA1 COSMOS project:

1. Document fetching, storage, and pre-processing systems
2. Document segmentation and segment classification
3. Fonduer-based model extraction

The combination of these three components provides a cross-disciplinary platform for accelerating the reproducibility and scalability of key elements of scientific research and provides an infrastructure for scientific model curation and construction (Phase II COSMOS project objective). Below we describe the design and implementation of our prototype COSMOS system:

#### Document Fetching, Storage and Processing System
IAN add basic xDD system description, stats and information here; be sure to include new project machine stats

#### Table, Figure, and Equation Extraction
ANKUR and JOSH

#### Model Extraction
JOHN Fonduer model

### Initial Assessment of Prototype System
SEP/DAVEN annotation engine
ANKUR/JOSH segmentation quality
JOHN Fonduer

### Performance and Scalability
IAN xDD throughput and estimated throughput capacity of segmentation/model software components

### Conclusions and Next Steps

### References
