# UW-COSMOS ASKE-E Final Report

## Task 1: Scale and Enhance xDD Infrastructure and APIs

  #### Task 1.A. Expand Corpus
  The xDD corpus has grown to over 14.2M full-text publications. Springer-Nature was added as a new publisher partner in late 2021 and fetching of documents for this source began in October. In addition, PubMed abstracts and document metadata have been added to xDD infrastructure as an integrated but separate source. This enables more comprehensive document metadata retrieval and makes abstracts available for various xDD transformation and extraction pipelines (e.g., NLP, word embeddings).

![xdd_growth copy](https://user-images.githubusercontent.com/6107153/140966945-e2a4a097-308f-4493-9662-ce354995f3c6.jpg)

  #### Task 1.B. Developer Container Template for Collaborator Code
  We developed and released a Docker container template (https://github.com/UW-xDD/xdd-docker-recipe) to enable xDD collaborators to write code that that can be executed over xDD full-text content. The primary user of this template has been HMS, who has used it to deploy the INDRA reading system for the EMMAA model over COVID-19 and other related documents in xDD. The output of the HMS container consists of grounded INDRA statements, which are dumped into Amazon S3 storage units for return back to HMS and the EMMAA model.
  
  #### Task 1.C. Augment xDD Corpus with Container Outputs
  xDD's API exposes article metadata and snippets around targeted search terms. We incorporated key elements of the output of HMS's INDRA reading system and Mitre's curated drug list into the document-level annotations in xDD and developed infrastructure to make such additions when other sources of knowledge become available. Users have the ability to optionally request that these additional knowledge annotations be automatically appended to documents that are retrieved in any arbitrary search using the xDD API. This allows for rapid assessment of related knowledge linked at the document level when conducting a search that is not directly informed by this knowledge. For example, searching the xDD snippets route for the terms COVID-19 and intubation and specifying known_entities=drugs (https://xdd.wisc.edu/api/snippets?term=COVID-19,intubation&known_entities=drugs&clean) surfaces documents that are annotated with co-occurring drug mentions, making it possible to quickly assemble lists of candidate drugs that might be relevant to a given topic based on co-occurrence.
  
  #### Taks 1.D. Improve and Scale xDD API
  Numerous improvements to physical and software infrastructure were made to the xDD system. These improvements include migration to Kubernetes, the introduction of document sets, numerous software upgrades and updates, and many API updates and improvements, most made in direct response to ASKE-E collaborators. Below we briefly describe each of these and the other improvements made to the system.
  
  1. **Kubernetes**
    Many of the xDD software and service components have been migrated into a kubernetes cluster UW-Madison's Center for High Throughput Computing (CHTC). This transition includes updates to a centralized configuration and build/deploy model. The primary reasons for these architecture changes are:
      - Stability and redundancy. The kubernetes management layer ensures that all running instances of a software component are using the prescribed versions, eliminated the risk of version skew across scaled services. Additionally, the kubernetes model allows easy migration of services in the event of an individual node outage.
      - Flexibility. Modifying and scaling services becomes trivial, enabling seamless deployment of updates and upgrades and changes to services and environments. Resources, once defined, can be modified and re-used to spin up additional services (for example, deploying data services across a wide array of document datasets).
      - Security. Regular updates for software dependencies, network segmentation, and role- and namespace-based restrictions increase the security of the services and their hosts.
      - Centralized configuration. Resource and service definitions are stored in version controlled software repositories (git). Centralizing and version-controlling theses configuration eases understanding and sharing of the update and deployment process while providing readily usable histories for rollbacks if needed.
  
  Although the kubernetes cluster is a shared CHTC resource, it includes new xDD-specific hardware to host the most critical and data-heavy xDD services and databases.

  2. **Sets**
    In this reporting period, we formalized the definition of "sets" in xDD. Document sets can be defined using any number of criteria, including full-text content searches, journal/publisher titles, a list of DOIs, or combinations of these methods. Once defined, a set provides a high-quality input set for a user to explore via by enabling dataset-specific filtration on relevant xDD API routes. Additionally, definition of a set enables easy transformations and processing of the underlying documents within the xDD ecosystem. Once processed, the kubernetes-backed ecosystem allows easy deployment of consumable endpoints and products based on the prescribed set of documents. The ability to generate on-demand sets of documents and have many such sets exist in parallel, with all data services operating over those sets, is a critical component of functionality in xDD that allows rapid pivoting into specific domains/subdomains of research over 14.2M documents in xDD. 

  3. **Software Upgrades and Updates**
    Several maintenance software upgrades and updates were deployed to ensure continued health and security of the xDD system. These include major version upgrades for the Mongodb and Postgresql backends, finalizing porting of the python software to python3, and upgrading hosts from Scientific Linux 6 to RHEL7.
   
  4. **API updates and improvements**
    We continue to refine and enhance the xDD in many ways, from better documentation to new capabilities. These changes get pushed and made live as they go through our internal development and assessment cycles. Highlights in this reporting period includes API capabilities restricted to sets (described above), better ability to restrict text search responses based on document content, and appending known entities to the API response (e.g., a search for a given term can receive a response that is accompanied by co-occurring drugs in the Mitre drug list). 

## Task 2: Scale and Enhance COSMOS Retrieval and API
  
  #### Task 2.A. Improve Visual Segmentation
  #### Task 2.B. Incorporate Body-Text Content into Object Retrieval
  #### Task 2.C. Automatic Knowledge Base Construction
  #### Task 2.D. Release Public COSMOS API Over COVID-19 Set
