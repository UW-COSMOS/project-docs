# Goals and Approaches for TA1 Phases and Tasks (reverse chronological order)

## Phase 3 (beginning August 2020)
Phase 3 activities will focus on refining and extending xDD and COSMOS APIs that expose data and information in the published scientific literature. Our overarching objective is to develop and deploy an end-to-end platform and AI-powered technical assistant capable of advanced data and information retrieval and question answering over the scientific literature in near real-time, as it is published.

<p align ="center"><img src="presentations_reports/images/overview2.png" alt="UW-COSMOS" width="750"/></p>


## Phase 2 (ending July 2020)
An overview of our Phase 1 activities, position relative to TA1 and TA2 ASKE objectives, and initial linking of key elements of model code to elements of our model-created KBC in Phase 2 (and beyond the scope of this project) is provided in our [Phase 2 Workshop summary report](https://github.com/UW-COSMOS/project-docs/blob/master/presentations_reports/ASKE_Ph2_position_COSMOS.pdf).

A timeline with links to project milestone deliverables is found on our project [Wiki](https://github.com/UW-COSMOS/project-docs/wiki/Project-Milestones).

### Task 1: Extraction of Model Metadata
Develop data extraction and integration methods to collect data and model metadata (from text). Extracted information will correspond to specified scientific model boundary conditions and parameterizations and will be used to validate and assess model output.

* _cGENIE_: widely used community Earth systems model, oriented around carbon (https://github.com/UW-COSMOS/cgenie.muffin)

### Task 2: Data Extraction from Tables and Figures
Design and implement methods for 1) automatic extraction of  model parameterizations from tables, and 2) extraction of data from tables and figures. Implementation of methods that link data back to model code and the knowledge base developed during Task 1 will enable human-in-the-loop automated refinement ad assessment of scientific models.

### Phase 2 DARPA Demo Day Poster and Other Prodcuts
A high-level overview of our Phase 2 activities and status is summarized in our [DARPA Demo Day Poster](https://github.com/UW-COSMOS/project-docs/tree/master/presentations_reports/ASKE_demo_poster.pdf). Please see this [recorded video of our live demo](https://drive.google.com/file/d/1V09nLcijn2SqHAPf1dSHIXdi8ys5-B1O/view?usp=sharing) (the video was recoreded at UW-Madison prior to the September 12, 2019 Demo Day). 

A requested follow up webinar and live demo for our DARPA Demo Day presentation was delivered to the [NIH IMAG](https://www.imagwiki.nibib.nih.gov/webinars/2019-ml-msm-pre-meeting-webinar-darpa-aske-cosmos-platform) group on 3 Oct. 2019 ([PDF of the slides](https://github.com/UW-COSMOS/project-docs/blob/master/presentations_reports/NIH_2019.pdf)). Video of the webinar is broken into three components: [xDD](https://www.youtube.com/watch?v=2caVjq4Jxog), [COSMOS](https://www.youtube.com/watch?v=2XP_fxSWhMs&t=10s), and a [live demo](https://www.youtube.com/watch?v=-oEFualmi-I&t=13s).

An overview of project motivations, our Demo Day components, and our anticipated next steps was delievered on October 18th to ASKE leadership ([PDF of presentation](https://github.com/UW-COSMOS/project-docs/blob/master/presentations_reports/ASKE_TA1_Demo_FINAL.key.pdf)).

Our preliminary project general website is [cosmos.wisc.edu](http://cosmos.wisc.edu).

## Phase 1 (ending 2019)
See our [Milestone 3 Report](https://github.com/UW-COSMOS/project-docs/tree/master/presentations_reports/milestone_3) for an overview of Phase 1 outcomes and links to relevant repos. A manuscript describing our method for visual object detection with region embeddings is available as a [preprint](https://arxiv.org/abs/1910.12462).

### Task 1: Extraction of Models from Publications
Design and implement methods to extract models and semantically meaningful components of models that are reported in the literature in the form of equations. Incorporate weakly supervised KBC systems for such models into the ASKE pipeline.

### Task 2: Table and Figure Extraction
Develop methods that extend xDD with a scalable table, figure, and equation extraction engine that leverages state-of-the-art methods.

Our end-to-end pipeline for Phase 1 is documented and available as docker image here in our [cosmos-demo repo](https://github.com/UW-COSMOS/cosmos-demo). See linked repos for individual code components.

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/DARPA_Logo.jpg/640px-DARPA_Logo.jpg" width=200>

