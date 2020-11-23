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
    - 28 October: Online and available within CHTC kubernetes cluster.

3. [API](https://xdd.wisc.edu/api)
    - geodeepive.org domain host shifted, deprecated; xdd.wisc.edu domain made active and deployed on CHTC Infrastructure
    - 8 October: Development complete on augmenting xDD responses with known dictionary terms (`/snippets` and `/articles`, currently being tested within development setup: https://xdddev.chtc.io/api/snippets?term=Baraboo%20Quartzite&known_terms=true)
    - 5 October: Initial deployment of dataset filtering on `/articles` and `snippets` routes (e.g. https://xdd.wisc.edu/api/articles?term=ACE&dataset=xdd-covid-19&full_results=true)
    - 5 October: Basic visual search interface over API for document sets: https://xdd.wisc.edu/explore.html
    - 15 October: (in active development) Integration of MITRE drug entities within `snippets` and `articles` response (https://xdddev.chtc.io/api/snippets?term=remdesivir&known_entities=drugs)
    - 23 October: `known_entities`, `known_terms` deployed to production
    - 17 November: Added `document_filter_terms` to `/snippets` route
 
4. Custom Code Execution
    - 6 October: Initial container template for deploying collaborator code against xDD (https://github.com/UW-xDD/xdd-docker-recipe)
    
5. Sets
    - Ongoing development to add _sets_ of documents as an entity within the xDD infrastructure. A _set_ is a collection of documents, defined by queries, keywords, or manual curation, which can be operated upon within xDD.
    - 23 October: Initial rollout of "sets" API (https://xdd.wisc.edu/sets/) to communicate what sets are defined within xDD, along with which transformations and products are available for them.
    - 3 November: Production rollout of kubernetes resources defining set resources (COSMOS API, word2vec API)
    - 5 November: Add IODP set (with COSMOS output availability) https://xdd.wisc.edu/sets/iodp
    - 9 November: Add geothermal set (with COSMOS, word2vec output availability) https://xdd.wisc.edu/sets/geothermal
    - 11 November: Add centralized COSMOS output visualizer for all sets (https://xdd.wisc.edu/set_visualizer/)
    - 16 November: Add Mars Jezero Crater/Perseverance rover set (with COSMOS output availability) https://xdd.wisc.edu/sets/mars
    - 16 November: COSMOS output visualizer now supports permalinks to COSMOS extractions stored in xDD (e.g. https://xdddev.chtc.io/set_visualizer/sets/mars/object/5abb12574e45fe1e202cb4952a6ae673b498d6f2)

## COSMOS: AI-powered technical assistant over text, tables, figures, equations
1. Pipeline
    - 14 September: New version feature-complete. Major [PR opened](https://github.com/UW-COSMOS/Cosmos/pull/122).
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
      - 22 September: Document-level filter terms deployed to dev. (ex:https://xdd.wisc.edu/sets/covid/api/search?query=covid&ignore_bytes=true&document_filter_terms=chloroquine,remdesivir applies a requirement that both "chloroquine" and "remdesivir" appear at the document level)
    - 16 October: 72K xdd-covid-19 set documents processed via COSMOS, with updated data products:
        - Cleaned + case-insensitive word2vec https://cosmos.wisc.edu/sets/covid/word2vec-api/word2vec?word=lung&model=trigram_lowered_cleaned
        - xDD API articles, snippets queries restricted to only this set: (https://xdd.wisc.edu/api/articles?term=ACE2&dataset=xdd-covid-19&full_results=true or https://xdd.wisc.edu/api/snippets?term=remdesivir&dataset=xdd-covid-19&full_results=true )
        - COSMOS API (beta version) available: https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/search?query=remdesivir&type=Figure .

3. Visualizer and Other Apps
    - 8 October: Updates to web browser COSMOS search interface to accommodate improvements to COSMOS pipeline

4. Publications
    - Unsupervised relation extraction paper accepted to Findings of EMNLP 2020: https://arxiv.org/abs/2010.06804

## xDD and COSMOS API route overview
1. xDD: 13.1M full-texts from multiple publishers spanning all disciplines
    - https://xdd.wisc.edu/api: Statistics and search across entire xDD corpus (equivalent to deprecated https://geodeepdive.org/api)
        - Full-text search and retrieval of text snippets: https://xdd.wisc.edu/api/snippets
    - https://xdd.wisc.edu/sets/: xDD document sets defined by full text searches and journal titles. Different transformations to documents within sets are available within sub-pages of the set. For example, documents within a set may be used to train a word embedding model, or the COSMOS extraction pipeline may be deployed to extract figures, tables, and equations for documents within a set
        - https://xdd.wisc.edu/sets/xdd-covid-19/: Lists information about the `xdd-covid-19` set of documents, and lists available products (transformations) derived from the set.
2. COSMOS: End-point of [COSMOS document processing pipeline](https://github.com/UW-COSMOS/Cosmos) deployed over select documents from xDD
    - https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/: Base documentation for COSMOS search interface, available for the `xdd-covid-19` set.
    - https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/search: Documentation for searching the COSMOS extractions.
3. word2vec: End-point of word embedding models trained on document set. 
    - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/: Documentation for the API to explore the word embedding model.
        - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/most_similar - Documentation for the "most_similar" function
        - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/most_similar?word=covid&n=50&model=trigram&lowered=true&cleaned=true - Example query: uni- bi- and tri-grams most similar to "covid" in the case-insensitive, ligature-cleaned model.

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
