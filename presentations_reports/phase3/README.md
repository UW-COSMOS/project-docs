# Phase 3 Key Developments
Here you will find a concise summary of progress made during Phase 3.

## xDD: Document acquisition, storage, processing, and search infrastructure
1. Document Ingestion
    - 17 September: 13M document milestone crossed
    - 17 September: Agreement with Springer-Nature pending; 9 October draft document

2. Computing Infrastructure
    - 28 August: Hardware purchase request made
    - 9 September: Purchase order received by vendor
    - 18 September: Hardware shipped; hardware arrived 27 September
    - 7 October: Hardware inventoried, racked 

3. [API](https://xdd.wisc.edu/api)
    - geodeepive.org domain host shifted, deprecated; xdd.wisc.edu domain made active and deployed on CHTC Infrastructure
    - 8 October: Development complete on augmenting xDD responses with known dictionary terms (`/snippets` and `/articles`, currently being tested within development setup: https://xdddev.chtc.io/api/snippets?term=Baraboo%20Quartzite&known_terms=true)
    - 5 October: Initial deployment of dataset filtering on `/articles` and `snippets` routes (e.g. https://xdd.wisc.edu/api/articles?term=ACE&dataset=xdd-covid-19&full_results=true)
    - 5 October: Basic visual search interface over API for document sets: https://xdd.wisc.edu/explore.html
    - 15 October: (in active development) Integration of MITRE drug entities within `snippets` and `articles` response (https://xdddev.chtc.io/api/snippets?term=remdesivir&known_entities=drugs)
 
4. Custom Code Execution
    - 6 October: Initial container template for deploying collaborator code against xDD (https://github.com/UW-xDD/xdd-docker-recipe)

## COSMOS: AI-powered technical assistant over text, tables, figures, equations
1. Pipeline
    - 14 September: New version feature-complete. PR opened
    - 22 September: Ian still working on PR review
    - 28 September: New version merged into master. Major usability improvements in core pipeline.
    - 14 October: Dockerized ingestion postprocess model training
    - Ongoing: Entity discovery module
        - Automatically discover entities from documents
        - Link entities across documents
        - Link discovered entities to external knowledge bases
        - Enhanced semantic retrieval for tables

2. API
    - API service migrated into CHTC Infrastructure
      - 21 September: deployed into production (e.g. https://xdd.wisc.edu/sets/covid/api/search?query=death%20rates&type=Table&postprocessing_confidence=0.9&base_confidence=0.9)
    - New search logic features (support of AND/OR, document-level filtering)
      - 22 September: Document-level filter terms deployed to dev. (ex:https://xdddev.chtc.io/sets/covid/api/search?query=covid&ignore_bytes=true&document_filter_terms=chloroquine,remdesivir applies a requirement that both "chloroquine" and "remdesivir" appear at the document level)
    - 16 October: 72K xdd-covid-19 set documents processed via COSMOS, with updated data products:
        - 1
        - 2

3. Visualizer and Other Apps
    - 8 October: Updates to web browser COSMOS search interface to accommodate improvements to COSMOS pipeline

4. Publications
    - Unsupervised relation extraction paper accepted to Findings of EMNLP 2020: https://arxiv.org/abs/2010.06804

### License and Acknowledgements
All development work supported by DAPRA ASKE HR00111990013 and UW-Madison.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this repo except in compliance with the License.
You may obtain a copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
