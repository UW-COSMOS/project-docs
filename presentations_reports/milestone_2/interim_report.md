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

Our primary objective is to automatically recognize and visually extract these components from heterogeneous scientific publications while at the same time preserving explicit association with text-based information. For example, Equation 33, above, contains the variable *I<sub>av</sub>*, which is described in plain language in the underlying body text element. Similarly, the lowest body text block contains call-outs to specific equations [(8)-(10) and (15)-(17)] which identify them as *radical producing and consumption reactions.* This text-derived semantic description of equations is required to understand the phenomena and contexts to which they apply. Table and figure elements have analogous properties. Fully understanding the content of tables and figures usually requires incorporation of information from associated text captions, which then relate those tables/figures to more complete semantic descriptions in body text.

### Software Components

### Initial Assessment

### Performance and Scalability

### Conclusions and Next Steps

### References
