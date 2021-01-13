# Milestone 4 Report

UW-Madison xDD and COSMOS capabilities have been improved and extended to accommodate emerging needs of ASKE demo projects. Our focus remains on providing dependable, scalable services oriented around  text, tables, figures and equations in publications, but recent needs and requirements from the data-wg working group, Arizona, and Uncharted have resulted in the addition of several new capabilities during the reporting period. Below we briefly summarize these new capabilities and other advances since Milestone 1 report (October). For additional summary of deliverables and timelines see our [Phase 3 Summary](https://github.com/UW-COSMOS/project-docs/tree/master/presentations_reports/phase3).

## Demos
Our core deliverables are live data services that provide broad access to the content of publications. There are two components: xDD and COSMOS. The former is focused on text and document metadata and the latter delivers visual elements (tables, figures, equations) along with context (e.g., captions) in response to specific queries. Retrieval in both xDD and COSMOS is currently based on term/phrase matching, but we provide a variety of services to help users expand the scope of simple queries by using text embedding models trained over the target corpus. Ongoing work is focusing on entity-based retrieval and simple relation extraction.

Live, production versions of these sytems can be accessed via REST-ful services, which constitute our principal demos for this Milestone.
  - xdd: https://xdd.wisc.edu/api
  - COSMOS data product: https://xdd.wisc.edu/sets/covid/api/search 

Note that COSMOS is a [standalone software stack](https://github.com/UW-COSMOS/Cosmos) capable of deployment locally over PDFs by users and it constitutes our primary code deliverable. Runs of COSMOS over xDD document sets produce data products that we then expose via REST-ful services on xDD infrastructure (second link above).

## Improvements to xDD and COSMOS in Reporting Period

**xDD infrastructure.** A number of improvements have been implemented to xDD, including new hardware deployments, updates to core software components (e.g., MongoDB), porting of some components in Python 2 to Python 3, and streamlined system scalability via UW-Madison CHTC kubernetes cluster. Most of these improvements, though critical to providing reliable data services, are not readily apparent to end users.

**xDD documents.** Our automated mechanism for downloading documents and metadata from partner publishers and preprint servers continued 24/7 for the reporting period. Approximately 300,000 new document full-texts spanning all disciplines have been acquired since September. All documents are processed and exposed within xDD APIs within several hours of download. 

**Sets.** In this reporting period, we formalized the definition of "sets" in xDD. Document sets can be defined using any number of criteria, including full-text content searches and journal/publisher titles. The ability to generate on-demand sets of documents and have many such sets exist in parallel, with all data services operating over those sets, is a critical component of functionality in xDD that allows rapid pivoting into specific domains/subdomains of research over 13.3M documents in xDD. 

**AKE-ID**. In response to needs expressed by Arizona and others, we created the ability to generate and reserve ASKE project-specific IDs, populate metadata records for those ids (most importantly location of document), and return that data to xDD. Once ASKE-IDs have metadata, the data are exposed via REST-ful services. The goal of this capability is to allow objects that do not have DOIs (e.g., code documentation) to be tracked through ASKE components. The system we have established is basic at the present time but can be extended readily as needed by ASKE performers.

**xDD API.** We continue to refine and enhance the xDD in many ways, from better documentation to new capabilities. These changes get pushed and made live as they go through our internal development and assessment cycles. Highlights in this reporting period includes API capabilities restricted to sets (described above), better ability to restrict text search responses based on document content and appending known entities to the API response (e.g., a search for a given term can receive a response that is accompanied by co-occurring drugs in the Mitre drug list).

**COSMOS.** We continue to improve the core [COSMOS pipeline](https://github.com/UW-COSMOS/Cosmos), with major improvements coming with our 0.2.0 release (our primary deliverable of November code release). The [COSMOS visualizer](https://github.com/UW-COSMOS/cosmos-visualizer) has also been updated to accommodate these changes and improve functinality and performance. We continue to gather new training data for the COSMOS visual classification step and, eventually, the segmentation step (the initial segmentation of document pages into parts incorporates few learned components and performance will be greatly improved when we can use our training data for this purpose). Our push in this reporting period has been for annotations over the COVID19 set. This set is processed via COSMOS episodically as improvements to pipleine are delivered and as new documents for COVID19 are acquired.

**COSMOS API.** Our version of the COSMOS API is now hosted on xDD infrastructure. We continue to add features to the COSMOS API to allow for the retrieval of tables and figures in ways that satifsy the needs of ASKE performers. 

**Text embedding models.** We generate a large number of text embedding models that are trained over individual sets. These models are exposed via [REST-ful services](https://xdd.wisc.edu/sets/xdd-covid-19/word2vec/api/) in xDD.