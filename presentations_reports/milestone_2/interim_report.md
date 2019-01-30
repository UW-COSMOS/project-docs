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
A key component of the infrastructure we are developing is an extension of the [GeoDeepDive](https://geodeepdive.org) document acquisition, storage, and processing system. This digital library and computing infrastructure is capable of supporting a wide range of activities that require information to be located and extracted from published documents. Our extended version of GeoDeepDie, **xDD**, currently contains over 8.7 million documents, principally from journals and other serials, that have been published by a variety of open-access and commercial sources. The number of documents in xDD continues to grow by some 8K daily, making it the single largest source of published scientific information that can be leveraged by multiple, collaborating teams.

<img src="images/growth.png" alt="xdd_growth" width="800"/>

Document access and computing capacity are foundational to any system that seeks to leverage published scientific information. xDD's strength in this regard has well-positioned our ASKE team to contribute to other ASKE team activities. We are currently collaborating with TA2 project XXXXXXX by deploying elements of their current pipeline on our larger corpus and document acquisition system.

*IAN add basic xDD system description, throughput of documents/scalability and information here; be sure to include new project machine stats*



#### Collection of Training Data and Annotations
DAVEN annotation engine:

#### Table, Figure, and Equation Extraction
ANKUR and JOSH: the abstract of what you are doing, maybe one or two *key* visuals

#### Model Extraction
Prompt:PAUL Fonduer model: the abstract of what you are doing, maybe one or two *key* visuals

In this stage, we aim to organize and store the table, figure and equation segmentations obtained from the previous stage into a unified data model whose schema is shown below. This unified data model will serve as a critical cornerstone for future downstream machine learning application such as knowledge base construction and co-reference resolution. 

The major effort in this section is the development of a parser that takes the image segmentations of different document component as an input, utilizes tools of optical character recognition, and preserves the extracted components in persistent storage while maintaining the semantics of the document structure using the schema mentioned.

<Figure>
<img src="images/data_model.png" width="400">
<figcaption>Figure 1. The schema of data model</figcaption>
</Figure>


## Technical Overview
*FOLLOWING THE GENERAL OUTLINE ABOVE, THIS IS WHERE WE NEED DETAILS OF ALGORITHMS AND PIPELINE WITH QUANTITATIVE/QUALITATIVE RESULTS*

#### Table, Figure, and Equation Extraction
ANKUR and JOSH
##### Evaluation and Performance
*ideally this includes qualitative examples (images) and estimates of **recall and precision**. NB: Shanan and Daven can help generate these estimates once we have output in annotation system.*

#### Model Extraction
Prompt:PAUL Fonduer model

##### The parsing pipeline, the bridge between Cosmos and Fonduer

As the first step of bringing segmentations into a unified data format that preserves the semantic structure of a document, we utilized the pixels coordinates of each segmentations and reconstruct the extracted components into an HTML file as shown below.
```html
<!DOCTYPE html>
<html>
  <head>
    <title>10.1080_00103620600561071.pdf-0004</title>
  </head>
  <body>
    <div class="Body Text" id="Body Text0">
      <img src="img/10.1080_00103620600561071.pdf-0004/Body Text0.png">
      <div class="hocr" data-coordinates="216 308 1138 1251"></div>
    </div>
    <div class="Equation" id="Equation1">
      <img src="img/10.1080_00103620600561071.pdf-0004/Equation1.png">
      <div class="hocr" data-coordinates="592 1347 814 1429"></div>
    </div>
    <div class="Equation" id="Equation2">
      <img src="img/10.1080_00103620600561071.pdf-0004/Equation2.png">
      <div class="hocr" data-coordinates="597 1183 832 1236">
    </div>
    <div class="Equation label" id="Equation label3">
      <img src="img/10.1080_00103620600561071.pdf-0004/Equation label3.png">
      <div class="hocr" data-coordinates="1005 1181 1104 1232"></div>
    </div>
</html>
```

Next, we extend the existing document parser from the [Fonduer](https://github.com/HazyResearch/fonduer) framework so that it can properly parse the HTML document generated by our system. Several extensions include (1) The ability to parse equations and extract variable tokens. (2) The ability to record classifications of each sentence appeared in the documents. For example, a sentence in a document can either be classified by the previous stage as document header, body text, image caption, and etc. It is important to store the additional information into our unified data model (Figure 1) since this will enable our downstream machine learning application to consider the relationship between different components in a document.

After recovering the document structure from segmentations, we utilize existing OCR framework to convert the image of body text and equations to machine-readable format. The image of body text is converted to plain text via [Tesseract](https://opensource.google.com/projects/tesseract) and the image of an equation is converted to latex code via a [neural encoder-decoder model](https://arxiv.org/pdf/1609.04938v1.pdf).

Lastly, our parser will take the HTML file and the plain text output from OCR as input and populate a Postgres database according to the schema as shown in Figure 1.


##### Resource
* [Link](https://github.com/UW-COSMOS/COSMOS-Parser) The code of parser that organizes and inserts the segmentations into a relational database.
* [Link](https://github.com/guillaumegenthial/im2latex) The implementation we used for converting image of equation to latex code. 
* [Link](https://github.com/UW-COSMOS/latex-parser/blob/master/Equation%20Extraction%20Workflow.ipynb) An example of the equation extraction workflow.

##### Evaluation and Performance
IAN xDD throughput and estimated throughput capacity of segmentation/model software components

### Conclusions and Next Steps

### References
