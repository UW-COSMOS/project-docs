# UW-COSMOS ASKE-E Final Report

## Task 1: Scale and Enhance xDD Infrastructure and APIs

  #### Task 1.A. Expand Corpus
  The xDD corpus has grown to over 14.2M full-text publications. Springer-Nature was added as a new publisher partner in late 2021 and fetching of documents for this source began in October. In addition, PubMed abstracts and document metadata have been added to xDD infrastructure as an integrated but separate source. This enables more comprehensive document metadata retrieval and makes abstracts available for various xDD transformation and extraction pipelines (e.g., NLP, word embeddings).

![xdd_growth copy](https://user-images.githubusercontent.com/6107153/140966945-e2a4a097-308f-4493-9662-ce354995f3c6.jpg)

  #### Task 1.B. Developer Container Template for Collaboroator Code
  We developed and released a Docker container template (https://github.com/UW-xDD/xdd-docker-recipe) to enable xDD collaborators to write code that that can be executed over xDD full-text content. The primary user of this template has been HMS, who has used it to deploy the INDRA reading system for the EMMAA model over COVID-19 and other related documents in xDD. The output of the HMS container consists of grounded INDRA statements, which are dumped into Amazon S3 storage units for return back to HMS and the EMMAA model.
  
  #### Task 1.C. Augment xDD Corpus with Container Outputs
  xDD's API exposes article metadata and snippets around targetted search terms. We incorporated key elements of the output of HMS's INDRA reading system and Mitre's curated drug list into the document-level annotations in xDD and developed infrastructure to make such additions when other sources of knowledge become available. Users have the ability to opitionally request that these additional knowledge annotations be automatically appended to documents that are retrieved in any arbitrary search using the xDD API. This allows for rapid assessment of related knowledge linked at the document level when conducting a search that is not directly informed by this knowledge. For example, searching the xDD snippets route for the terms COVID-19 and intubation and specifying known_entities=drugs (https://xdd.wisc.edu/api/snippets?term=COVID-19,intubation&known_entities=drugs&clean) surfaces documents that are annotated with co-occurring drug mentions, making it possible to quickly assemble lists of candidate drugs that might be relevant to a given topic based on co-occurrence.
  
  #### Taks 1.D. Improve and Scale xDD API
  Numerous improvements to physical and software infrastructure were made to the xDD system. These improvements include migration to Kubernetes, the introduction of document sets, numerous software upgrades and updates, and many API updates and improvements, most made in direct response to ASKE-E collaborators. Below we briefly describe each of these and the other improvements made to the system.
  
  1. Kubernetes
  2. Software Upgrades and Updates
  3. Sets
  4. API updates and improvements

## Task 2: Scle and Enhance COSMOS Retrieval and API
  
  #### Task 2.A. Improve Visual Segmentation
  #### Task 2.B. Incorporate Body-Text Content into Object Retrieval
  #### Task 2.C. Automatic Knowledge Base Construction
  #### Task 2.D. Release Public COSMOS API Over COVID-19 Set
