# Goals and Approaches for TA1 Phases and Tasks

## Phase 1
### Task 1: Extraction of Models from Publications
Design and implement methods to extract models and semantically meaningful components of models that are reported in the literature in the form of equations. Incorporate weakly supervised KBC systems for such models into the ASKE pipeline.

### Task 2: Table and Figure Extraction
Develop methods that extend GDD with a scalable table and figure extraction engine that leverages state-of-the-art methods (i.e., the data model in Fonduer).

* _image-tagger_: web-based annotation engine for marking up images (PDFs) (https://github.com/UW-COSMOS/image-tagger)
* _image-tagger-api_: database and API upon which image-tagger receives/sends data (https://github.com/UW-COSMOS/image-tagger-api)
* _Mask-RCNN-exp_: Mask RCNN interface for doing document segmentation. Includes code to run experimental evaluation. (https://github.com/UW-COSMOS/Mask-RCNN-exp/)
* _cosmos-datasets_: A git-lfs repository for storing datasets and weights used in cosmos experiments (https://github.com/UW-COSMOS/cosmos-datasets)
* _deeplab\_v3_: An alternative model we tested against Mask-RCNN (https://github.com/UW-COSMOS/deeplab_v3)
* _mmmask-rcnn_: A custom implementation of Mask RCNN with a multi modal architecture (https://github.com/UW-COSMOS/mmmask-rcnn)

## Phase 2
### Task 1: Extraction of Model Metadata
Develop data extraction and integration methods to collect model metadata (from text) that corresponds to boundary conditions, sensitivity analyses, and results.

* _cGENIE_: widely used community Earth systems model, oriented around carbon (https://github.com/UW-COSMOS/cgenie.muffin)

### Task 2: Data Extraction from Tables and Figures
Design and implement methods for 1) automatic extraction of  model parameterizations from tables, and 2) extraction of data from tables and figures. Implementation of methods that link data back to model code and the knowledge base developed during Task 1 will enable human-in-the-loop automated refinements of models

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/DARPA_Logo.jpg/640px-DARPA_Logo.jpg" width=200>
