# Phase 3 Key Developments
Here you will find a concise summary of progress made during Phase 3.

## xDD: Document acquisition, storage, processing, and search infrastructure
1. Document Ingestion
    - 17 September: 13M document milestone crossed
    - 17 September: Agreement with Springer-Nature pending.

2. Computing Infrastructure
    - 28 August: Hardware purchase request made
    - 9 September: Purchase order received by vendor
    - 18 September: Hardware shipped; hardware arrived 27 September

3. [API](https://xdd.wisc.edu/api)
    - geodeepive.org domain host shifted, deprecated; xdd.wisc.edu domain made active and deployed on CHTC Infrastructure

## COSMOS: AI-powered technical assistant over text, tables, figures, equations
1. Pipeline
    - 14 September: New version feature-complete. PR opened
    - 22 September: Ian still working on PR review

2. API
    - API service migrated into CHTC Infrastructure
      - 21 September: deployed into production (e.g. https://xdd.wisc.edu/sets/covid/api/v1/search?query=death%20rates&type=Table&postprocessing_confidence=0.9&base_confidence=0.9)
    - New earch logic features (support of AND/OR, document-level filtering)
      - 22 September: Document-level filter terms deployed to dev. (ex:https://xdddev.chtc.io/sets/covid/api/v1/search?query=covid&ignore_bytes=true&document_filter_terms=chloroquine,remdesivir applies a requirement that both "chloroquine" and "remdesivir" appear at the document level)


# License and Acknowledgements
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
