# Phase 3 Key Developments
Here you will find a concise summary of progress made during Phase 3.

![xDD-COSMOS API overview](https://github.com/UW-COSMOS/project-docs/blob/master/presentations_reports/images/xdd_overview.jpg?raw=true)
1. **xDD API**: Text-based search of over 13.3M full-texts from multiple publishers spanning all disciplines
    - https://xdd.wisc.edu/api: Statistics and search across entire xDD corpus (equivalent to deprecated https://geodeepdive.org/api)
        - Full-text search and retrieval of text snippets: https://xdd.wisc.edu/api/snippets; automatic surfacing of mentioned drugs and grounded EMMAA statements available with option &known_entities=drugs,emmaa
    - https://xdd.wisc.edu/sets/: xDD document sets defined by full text searches and journal titles. Different transformations to documents within sets are available within sub-pages of the set. For example, documents within a set may be used to train a word embedding model, or the COSMOS extraction pipeline may be deployed to extract figures, tables, and equations for documents within a set
        - https://xdd.wisc.edu/sets/xdd-covid-19/: Lists information about the `xdd-covid-19` set of documents, and lists available products (transformations) derived from the set.
2. **COSMOS API**: Figure, table, equation retreival by [COSMOS document processing pipeline](https://github.com/UW-COSMOS/Cosmos) deployed over xDD set. Note that use of these routes to retrieve table and figure objects requires an API key.
    - Get started by reading the [COSMOS documentation](https://uw-cosmos.github.io/Cosmos/index.html) and understanding the back-end.
    - https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/: Base documentation for COSMOS search interface, available for the `xdd-covid-19` set.
    - https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/search: Documentation for searching the COSMOS extractions.
    - https://xdd.wisc.edu/set_visualizer/sets/xdd-covid-19: COSMOS search and discovery interface deployed over `xdd-covid-19` set.
3. **word2vec API**: Word embedding models (unigram, bigram, trigram) trained on xDD document set. 
    - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/: Documentation for the API to explore the word embedding model.
        - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/most_similar - Documentation for the "most_similar" function
        - https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/most_similar?word=covid&n=50&model=trigram&lowered=true&cleaned=true - Example query: uni- bi- and tri-grams most similar to "covid" in the case-insensitive, ligature-cleaned model.
4. **doc2vec API**: Document embedding model trained on xDD document set.
    - https://xdd.wisc.edu/sets/xdd-covid-19/doc2vec/api/similar: documentation to be added, but example ?doi=10.1002/pbc.28600
5. **ASKE-ID API**: Generate unique IDs and lookup metadata and linking information for data and documents used in ASKE infrastructure.
    - https://xdd.wisc.edu/aske-id/id/: base URL for API route, used for lookup.
    - Registering a new ASKE-ID and submitting metadata requires an API key
6. **thing2vec API** (experimental): For a given table, use the COSMOS object ID to discover tables "nearby" in a embedding model.  
    - https://xdddev.chtc.io/sets/xdd-covid-19/thing2vec/api/: Documentation for the API to explore the table embedding model.


## xDD: Document acquisition, storage, processing, and search infrastructure
1. Document Ingestion
    - 17 September: 13M document milestone crossed
    - 17 September: Agreement with Springer-Nature pending; 9 October draft document
    - 11 August: 14M document milestone crossed, Springer-Nature agreement finalized, pending acquisition pipeline deployment

2. Computing Infrastructure
    - 28 August: Hardware purchase request made
    - 9 September: Purchase order received by vendor
    - 18 September: Hardware shipped; hardware arrived 27 September
    - 7 October: Hardware inventoried, racked
    - 28 October: Online and available within CHTC kubernetes cluster.
    - 30 November: mongo upgraded to 4.0

3. [API](https://xdd.wisc.edu/api)
    - geodeepive.org domain host shifted, deprecated; xdd.wisc.edu domain made active and deployed on CHTC Infrastructure
    - 8 October: Development complete on augmenting xDD responses with known dictionary terms (`/snippets` and `/articles`)
    - 5 October: Initial deployment of dataset filtering on `/articles` and `snippets` routes (e.g. https://xdd.wisc.edu/api/articles?term=ACE&dataset=xdd-covid-19&full_results=true)
    - 5 October: Basic visual search interface over API for document sets: https://xdd.wisc.edu/explore.html
    - 15 October: (in active development) Integration of MITRE drug entities within `snippets` and `articles` response (https://xdd.wisc.edu/api/snippets?term=remdesivir&known_entities=drugs)
    - 23 October: `known_entities`, `known_terms` deployed to production
    - 17 November: Added `document_filter_terms` to `/snippets` route
    - 8 February: Added `EMMAA` annotations to `known_entities`: https://xdd.wisc.edu/api/articles?docid=5e7dc0df998e17af8269af5d&known_entities=drugs,emmaa
    - 8 February: Added `pubname` parameter to `/snippets`/: https://xdd.wisc.edu/api/snippets?term=Baraboo%20Quartzite&pubname=Marine%20Geology
    - 23 March: Added searchable Pubmed abstracts; added `corpus` parameter to select between corpuses. (e.g. https://xdd.wisc.edu/api/articles?term=remdesivir&corpus=fulltext&max=10 vs https://xdd.wisc.edu/api/articles?term=remdesivir&corpus=pubmed_abstracts&max=10)
      - Pubmed abstracts include `known_entity` matching
    - 26 July: Added `aske_id` parameter for ingested ASKE-registered documents: https://xdd.wisc.edu/api/articles?aske_id=8467496e-3dfb-4efd-9061-433fef1b92de
 
4. Custom Code Execution
    - 6 October: Initial container template for deploying collaborator code against xDD (https://github.com/UW-xDD/xdd-docker-recipe)
    
5. Sets
    - Ongoing development to add _sets_ of documents as an entity within the xDD infrastructure. A _set_ is a collection of documents, defined by queries, keywords, or manual curation, which can be operated upon within xDD.
    - 23 October: Initial rollout of "sets" API (https://xdd.wisc.edu/sets/) to communicate what sets are defined within xDD, along with which transformations and products are available for them.
    - 3 November: Production rollout of kubernetes resources defining set resources (COSMOS API, word2vec API). General capability for on-demand high quality research set generation. Testing of set infrstructure and generalizability of COSMOS pipeline realized in following examples:
        - 5 November: Add IODP set (with COSMOS output availability) https://xdd.wisc.edu/sets/iodp
        - 9 November: Add geothermal set (with COSMOS, word2vec output availability) https://xdd.wisc.edu/sets/geothermal
        - 11 November: Add centralized COSMOS output visualizer for all sets (https://xdd.wisc.edu/set_visualizer/)
        - 16 November: Add Mars Jezero Crater/Perseverance rover set (with COSMOS output availability) https://xdd.wisc.edu/sets/mars
        - 16 November: COSMOS output visualizer now supports permalinks to COSMOS extractions stored in xDD (e.g. https://xdddev.chtc.io/set_visualizer/sets/mars/object/5abb12574e45fe1e202cb4952a6ae673b498d6f2)
    - 20 February: Retooling of set definition for `xdd-covid-19` and regeneration of set.
    - 6 August: Update of `xdd-covid-19` set to include newly published documents; 155K now available, models updated and rerun
    
6. ASKE-ID
    - 18 December: Prototype of ASKE-ID interface set up in dev namespace.
    ```
        # Reserve ASKE-IDs, to be used later. Number of ids set with _n_ parameter (default: 10)
        curl -X POST https://xdddev.chtc.io/aske-id/reserve\?n\=3\&api_key\=995d5601-896b-4309-b21f-1684d4a6421
        # Register above IDs to a location by passing in an array of [<ASKE-ID>, <location>] objects
        curl -X POST -H 'Content-Type: application/json' -d '[["3e79f1fc-f7cc-4fc2-87ea-a6daa899c0f0","http://some_url"]]' https://xdddev.chtc.io/aske-id/register\?api_key\=995d5601-896b-4309-b21f-1684d4a6421f
        # Look up the location of an ASKE-ID
        curl -X GET https://xdddev.chtc.io/aske-id/id/3e79f1fc-f7cc-4fc2-87ea-a6daa899c0f0
        # Directly register locations, without first reserving blocks
        curl -X POST -H 'Content-Type: application/json' -d '["http://some_url", "https://some_other_url"]' https://xdddev.chtc.io/aske-id/create\?api_key\=995d5601-896b-4309-b21f-1684d4a6421f
    ```
    - 18 May: Updates and production deployment
       - Added ?all parameter to show complete list of registers ASKE-IDs (https://xdd.wisc.edu/aske-id/id?all)

## COSMOS: AI-powered technical assistant over text, tables, figures, equations
1. Pipeline
    - 14 September: New version feature-complete. Major [PR opened](https://github.com/UW-COSMOS/Cosmos/pull/122).
    - 22 September: Ian still working on PR review
    - 28 September: New version merged into master. Major usability improvements in core pipeline.
    - 14 October: Dockerized ingestion postprocess model training
    - 3 December: Entity discovery module merged into master
        - Automatically discover entities from documents
        - Link entities across documents
        - Link discovered entities to external knowledge bases
    - 2 December (review in progress): Initial development complete for enhanced semantic retrieval for tables 
    - 4 December - v0.3.0 [release candidate](https://github.com/UW-COSMOS/Cosmos) - Includes new pipeline architecture, entity discovery, and semantic context for tables.
      - A few more tests + documentation needed before final release
    - 16 February 2021 - v0.4.0 - Includes retrieval API updates, new model weights.
        - Deployment of updated `xdd-covid-19` run through v0.4.0 release candidate 
            - "In-place" deployment, so no set names or route changes. 
            - Object IDs retreivable from previous runs, but API only serves up latest results.
    - 20 February - retraining of COSMOS visual model with additional annotations from documents in redefined xdd-covid-19 set.
    - 3 March 2021 - API updates deployed
        - API key requirement is enforceable via environment variable (on in our deployment)
        - Bring back extracted object bytes on `/document`
        - Add object type filter on `/document`
        - Bugfix: treatment of boolean parameters (`ignore_bytes`, `inclusive`) is consistent and meaningful.
        - Docstrings added for `/document`, `/object`
     - 23 March 2021: Deployed `image_type` parameter on all routes (options: [`original`, `thumbnail`, and `jpg`] to return smaller and/or compressed versions of extracted images.
     - 26 July: Added `aske_id` parameter to `/document`, `/search`, and `/count` endpoints for ASKE-registered (and COSMOS-processed) document recall.

2. API
    - API service migrated into CHTC Infrastructure
      - 21 September: deployed into production (e.g. https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/v2_beta/search?query=death%20rates&type=Table&postprocessing_confidence=0.9&base_confidence=0.9)
    - New search logic features (support of AND/OR, document-level filtering)
      - 22 September: Document-level filter terms deployed to dev. (ex: https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/v2_beta/search?query=covid&ignore_bytes=true&document_filter_terms=chloroquine,remdesivir applies a requirement that both "chloroquine" and "remdesivir" appear at the document level)
    - 16 October: 72K xdd-covid-19 set documents processed via COSMOS, with updated data products:
        - Cleaned + case-insensitive word2vec https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/most_similar?word=lung&model=trigram_lowered_cleaned
        - xDD API articles, snippets queries restricted to only this set: (https://xdd.wisc.edu/api/articles?term=ACE2&dataset=xdd-covid-19&full_results=true or https://xdd.wisc.edu/api/snippets?term=remdesivir&dataset=xdd-covid-19&full_results=true )
        - COSMOS API (beta version) available: https://xdd.wisc.edu/sets/xdd-covid-19/cosmos/api/search?query=remdesivir&type=Figure .
   - 14 January: initial doc2vec implementation over xdd-covid-19 set.
   - 31 March: Initial experimental thing2vec implementation over xdd-covid-19 set (table embedding).
   - 5 May: Add `vector` parameter to `word2vec`, `thing2vec` APIs to return embedded vectors.
   - 25 May: Added `enriched` parameter to thing2vec model to leverage content-enriched table context.


3. Visualizer and Other Apps
    - 8 October: Updates to web browser COSMOS search interface to accommodate improvements to COSMOS pipeline
    - 20 November: COSMOS table/figure search interface with integrated manual data extraction and database web App targeted for data-wg needs: http://teststrata.geology.wisc.edu/xdd/extract.php
    - 20 December: [COSMOS document annotator](https://github.com/UW-COSMOS/cosmos-visualizer) updated for new COSMOS back-end and new COVID19 set generated for annotation and retraining.
   - 1 February: custom doc2vec and word2vec vector extractions for ASKE Uncharted endpoints (to be assigned ASKE-IDs as datasets).
   - 25 February: updates to accommodate backend changes to COSMOS pipeline

4. Publications
    - Unsupervised relation extraction paper accepted to Findings of EMNLP 2020: https://arxiv.org/abs/2010.06804
    - VLDB 2021 Demo Project accepted; Demo of Marius: Graph Embeddings with a Single Machine

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
