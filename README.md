# Goals and Approaches for TA1 Phases and Tasks

## Phase 1
### Task 1: Extraction of Models from Publications
Design and implement methods to extract models and semantically meaningful components of models that are reported in the literature in the form of equations. Incorporate weakly supervised KBC systems for such models into the ASKE pipeline.

### Task 2: Table and Figure Extraction
Develop methods that extend GDD with a scalable table and figure extraction engine that leverages state-of-the-art methods (i.e., the data model in Fonduer).

* _image-tagger_: web-based annotation engine for marking up images (PDFs) (https://github.com/UW-COSMOS/image-tagger)
* _image-tagger-api_: database and API upon which image-tagger receives/sends data (https://github.com/UW-COSMOS/image-tagger-api)
* repo: descrip

## Phase 2
### Task 1: Extraction of Model Metadata
Develop data extraction and integration methods to collect model metadata (from text) that corresponds to boundary conditions, sensitivity analyses, and results.

* _cGENIE_: widely used community Earth systems model, oriented around carbon (https://github.com/UW-COSMOS/cgenie.muffin)

### Task 2: Data Extraction from Tables and Figures
Design and implement methods for 1) automatic extraction of  model parameterizations from tables, and 2) extraction of data from tables and figures. Implementation of methods that link data back to model code and the knowledge base developed during Task 1 will enable human-in-the-loop automated refinements of models
