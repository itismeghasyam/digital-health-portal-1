########################################################################
# Digital Health Portal
# Purpose: To track publications in Digital Health Projects
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/1UAR0cD7TbDV_tmYnPjRUHUQFnW5q39swOIRcc2cmqJE/edit as list of publications
# Using https://sagebionetworks.jira.com/wiki/spaces/PS/pages/801538114/Publications+Schema as publication Schema Skeleton
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
# Use vancouver style format for authors - last name and initials
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to the Digital Health Portal Backend (syn21574434)
#  Publications live in folder syn22014192

##############
# Required libraries
##############
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# Global parameters
##############
pid <- 'syn22014192'

##############
# List of projects and related publications
##############

# Project Synapse ID vs publications
publications.list <- list(
  
  #### mPower 1.0
  # 1
  "Bot_NatSciData_2016" = list(
    Author = c('Bot BM', 'Suver C', 'Neto EC',
               'Kellen M', 'Klein A', 'Bare C', 'Doerr M',
               'Pratap A', 'Wilbanks J', 'Dorsey ER', 'Friend SH',
               'Trister AD'),
    Title = 'The mPower study, Parkinson disease mobile data collected using ResearchKit',
    Journal = 'Scientific Data',
    PMID = '26938265',
    ISSN = '2052-4463',
    Year = 2016,
    doi = '10.1038/sdata.2016.11',
    url = 'https://doi.org/10.1038/sdata.2016.11',
    Abstract = 'Current measures of health and disease are often insensitive, episodic, and subjective. Further, these measures generally are not designed to provide meaningful feedback to individuals. The impact of high-resolution activity data collected from mobile phones is only beginning to be explored. Here we present data from mPower, a clinical observational study about Parkinson disease conducted purely through an iPhone app interface. The study interrogated aspects of this movement disorder through surveys and frequent sensor-based recordings from participants with and without Parkinson disease. Benefitting from large enrollment and repeated measurements on many individuals, these data may help establish baseline variability of real-world activity measurement collected via mobile phones, and ultimately may lead to quantification of the ebbs-and-flows of Parkinson symptoms. App source code for these data collection modules are available through an open source license for use in studies of other conditions. We hope that releasing data contributed by engaged research participants will seed a new community of analysts working collaboratively on understanding mobile health data to advance human health.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 2
  "Neto_npjDigiMed_2019" = list(
    Author = c('Neto EC', 'Pratap A', 'Perumal TM',
               'Tummalacherla M', 'Snyder P', 'Bot BM',
               'Trister AD', 'Friend SH', 'Mangravite L',
               'Omberg L'),
    Title = 'Detecting the impact of subject characteristics on machine learning-based diagnostic applications',
    Journal = 'npj Digital Medicine',
    PMID = '31633058',
    ISSN = '2398-6352',
    Year = 2019,
    doi = '10.1038/s41746-019-0178-x',
    url = 'https://doi.org/10.1038/s41746-019-0178-x',
    Abstract = 'Collection of high-dimensional, longitudinal digital health data has the potential to support a wide-variety of research and clinical applications including diagnostics and longitudinal health tracking. Algorithms that process these data and inform digital diagnostics are typically developed using training and test sets generated from multiple repeated measures collected across a set of individuals. However, the inclusion of repeated measurements is not always appropriately taken into account in the analytical evaluations of predictive performance. The assignment of repeated measurements from each individual to both the training and the test sets ("record-wise" data split) is a common practice and can lead to massive underestimation of the prediction error due to the presence of "identity confounding." In essence, these models learn to identify subjects, in addition to diagnostic signal. Here, we present a method that can be used to effectively calculate the amount of identity confounding learned by classifiers developed using a record-wise data split. By applying this method to several real datasets, we demonstrate that identity confounding is a serious issue in digital health studies and that record-wise data splits for machine learning- based applications need to be avoided.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 3
  "Neto_arXiv_2019" = list(
    Author = c('Neto EC','Tummalacherla M',
               'Mangravite L', 'Omberg L'),
    Title = 'Causality-based tests to detect the influence of confounders on mobile health diagnostic applications: a comparison with restricted permutations',
    Journal = 'arXiv',
    PMID = '-',
    ISSN = '-',
    Year = 2019,
    doi = '-',
    url = 'https://arxiv.org/abs/1911.05139',
    Abstract = 'Machine learning practice is often impacted by confounders. Confounding can be particularly severe in remote digital health studies where the participants self-select to enter the study. While many different confounding adjustment approaches have been proposed in the literature, most of these methods rely on modeling assumptions, and it is unclear how robust they are to violations of these assumptions. This realization has recently motivated the development of restricted permutation methods to quantify the influence of observed confounders on the predictive performance of a machine learning models and evaluate if confounding adjustment methods are working as expected. In this paper we show, nonetheless, that restricted permutations can generate biased estimates of the contribution of the confounders to the predictive performance of a learner, and we propose an alternative approach to tackle this problem. By viewing a classification task from a causality perspective, we are able to leverage conditional independence tests between predictions and test set labels and confounders in order to detect confounding on the predictive performance of a classifier. We illustrate the application of our causality-based approach to data collected from mHealth study in Parkinson\'s disease.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 4
  "Perumal_Ubicomp_2018" = list(
    Author = c('Perumal TM', 'Tummalacherla M',
               'Snyder P','Neto EC', 'Dorsey ER',
               'Mangravite L','Omberg L'),
    Title = 'Remote Assessment, in Real-World Setting, of Tremor Severity in Parkinson\'s Disease Patients Using Smartphone Inertial Sensors',
    Journal = 'UbiComp \'18: The 2018 ACM International Joint Conference on Pervasive and Ubiquitous Computing',
    PMID = '-',
    ISBN = '978-1-4503-5966-5',
    Year = 2018,
    doi = '10.1145/3267305.3267612',
    url = 'https://doi.org/10.1145/3267305.3267612',
    Abstract = 'Current clinimetrics assessment of Parkinson\'s disease (PD) is insensitive, episodic, subjective, and provider-centered. Ubiquitous technologies such as smartphones promise to fundamentally change PD assessments. To enable frequent remote assessment of PD tremor severity, here we present a 39-month smartphone research study in a real-world setting without supervision. More than 15,000 consented participants used the smartphone application, mPower, to perform self-administered active tasks. In the scope of this abstract, we developed an objective smartphone measure of PD tremor severity called mPower Tremor Scores (mPTS) using machine learning. Efficacy, and reliability of mPTS was further tested and validated in a separate cohort in the real world and in-clinic setting. This study demonstrates the utility of using structured activities with built-in smartphone sensors to measure PD tremor severity remotely and objectively in a real-world setting using more than 1100 participants.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 5
  "Doerr_JMIRmHealth_2017" = list(
    Author = c('Doerr M', 'Truong AM','Bot BM',
               'Wilbanks J', 'Suver C','Mangravite LM'),
    Title = 'Formative Evaluation of Participant Experience With Mobile eConsent in the App-Mediated Parkinson mPower Study: A Mixed Methods Study',
    Journal = 'JMIR mHealth and uHealth',
    PMID = '28209557',
    ISSN = '2291-5222',
    Year = 2017,
    doi = '10.2196/mhealth.6521',
    url = 'http://doi.org/10.2196/mhealth.6521',
    Abstract = 'Background: To fully capitalize on the promise of mobile technology to enable scalable, participant-centered research, we must develop companion self-administered electronic informed consent (eConsent) processes. As we do so, we have an ethical obligation to ensure that core tenants of informed consent—informedness, comprehension, and voluntariness—are upheld. Furthermore, we should be wary of recapitulating the pitfalls of “traditional” informed consent processes.\n Objective: Our objective was to describe the essential qualities of participant experience, including delineation of common and novel themes relating to informed consent, with a self-administered, smartphone-based eConsent process. We sought to identify participant responses related to informedness, comprehension, and voluntariness as well as to capture any emergent themes relating to the informed consent process in an app-mediated research study.\n Methods: We performed qualitative thematic analysis of participant responses to a daily general prompt collected over a 6-month period within the Parkinson mPower app. We employed a combination of a priori and emergent codes for our analysis. A priori codes focused on the core concepts of informed consent; emergent codes were derived to capture additional themes relating to self-administered consent processes. We used self-reported demographic information from the study’s baseline survey to characterize study participants and respondents.\n Results: During the study period, 9846 people completed the eConsent process and enrolled in the Parkinson mPower study. In total, 2758 participants submitted 7483 comments; initial categorization identified a subset of 3875 germane responses submitted by 1678 distinct participants. Respondents were more likely to self-report a Parkinson disease diagnosis (30.21% vs 11.10%), be female (28.26% vs 20.18%), be older (42.89 years vs 34.47 years), and have completed more formal education (66.23% with a 4-year college degree or more education vs 55.77%) than all the mPower participants (P<.001 for all values). Within our qualitative analysis, 3 conceptual domains emerged. First, consistent with fully facilitated in-person informed consent settings, we observed a broad spectrum of comprehension of core research concepts following eConsent. Second, we identified new consent themes born out of the remote mobile research setting, for example the impact of the study design on the engagement of controls and the misconstruction of the open response field as a method for responsive communication with researchers, that bear consideration for inclusion within self-administered eConsent. Finally, our findings highlighted participants’ desire to be empowered as partners.\n Conclusions: Our study serves as a formative evaluation of participant experience with a self-administered informed consent process via a mobile app. Areas for future investigation include direct comparison of the efficacy of self-administered eConsent with facilitated informed consent processes, exploring the potential benefits and pitfalls of smartphone user behavioral habits on participant engagement in research, and developing best practices to increase informedness, comprehension, and voluntariness via participant coengagement in the research endeavor.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'),
  
  # 6
  "Wilbanks_NatBioTech_2016" = list(
    Author = c('Wilbanks J', 'Friend SH'),
    Title = 'First, design for data sharing',
    Journal = 'Nature Biotechnology',
    PMID = '26939011',
    ISSN = '1546-1696',
    Year = 2016,
    doi = '10.1038/nbt.3516',
    url = 'https://doi.org/10.1038/nbt.3516',
    Abstract = ' ',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 7
  "Trister_npjParkinsons_2016" = list(
    Author = c('Trister AD', 'Dorsey ER', 'Friend SH'),
    Title = 'Smartphones as new tools in the management and understanding of Parkinson’s disease',
    Journal = 'npj Parkinson\'s Disease',
    PMID = '28725694',
    ISSN = '2373-8057',
    Year = 2016,
    doi = '10.1038/npjparkd.2016.6',
    url = 'https://doi.org/10.1038/npjparkd.2016.6',
    Abstract = ' ',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 8
  "Neto_arXiv_2017_Jun" = list(
    Author = c('Neto EC', 'Perumal TM',
               'Pratap A', 'Bot BM', 'Mangravite L', 'Omberg L'),
    Title = 'On the analysis of personalized medication response and classification of case vs control patients in mobile health studies: the mPower case study',
    Journal = 'arXiv',
    PMID = '-',
    ISSN = '-',
    Year = 2017,
    doi = '-',
    url = 'https://arxiv.org/abs/1706.09574',
    Abstract = 'In this work we provide a couple of contributions to the analysis of longitudinal data collected by smartphones in mobile health applications. First, we propose a novel statistical approach to disentangle personalized treatment and "time-of-the-day" effects in observational studies. Under the assumption of no unmeasured confounders, we show how to use conditional independence relations in the data in order to determine if a difference in performance between activity tasks performed before and after the participant has taken medication, are potentially due to an effect of the medication or to a "time-of-the-day" effect (or still to both). Second, we show that smartphone data collected from a given study participant can represent a "digital fingerprint" of the participant, and that classifiers of case/control labels, constructed using longitudinal data, can show artificially improved performance when data from each participant is included in both training and test sets. We illustrate our contributions using data collected during the first 6 months of the mPower study.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 9
  "Neto_arXiv_2017_Dec" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M',
               'Bot BM', 'Trister AD', 'Friend SH',
               'Mangravite L', 'Omberg L'),
    Title = 'Learning Disease vs Participant Signatures: a permutation test approach to detect identity confounding in machine learning diagnostic applications',
    Journal = 'arXiv',
    PMID = '-',
    ISSN = '-',
    Year = 2017,
    doi = '-',
    url = 'https://arxiv.org/abs/1712.03120',
    Abstract = 'Recently, Saeb et al (2017) showed that, in diagnostic machine learning applications, having data of each subject randomly assigned to both training and test sets (record-wise data split) can lead to massive underestimation of the cross-validation prediction error, due to the presence of "subject identity confounding" caused by the classifier\'s ability to identify subjects, instead of recognizing disease. To solve this problem, the authors recommended the random assignment of the data of each subject to either the training or the test set (subject-wise data split). The adoption of subject-wise split has been criticized in Little et al (2017), on the basis that it can violate assumptions required by cross-validation to consistently estimate generalization error. In particular, adopting subject-wise splitting in heterogeneous data-sets might lead to model under-fitting and larger classification errors. Hence, Little et al argue that perhaps the overestimation of prediction errors with subject-wise cross-validation, rather than underestimation with record-wise cross-validation, is the reason for the discrepancies between prediction error estimates generated by the two splitting strategies. In order to shed light on this controversy, we focus on simpler classification performance metrics and develop permutation tests that can detect identity confounding. By focusing on permutation tests, we are able to evaluate the merits of record-wise and subject-wise data splits under more general statistical dependencies and distributional structures of the data, including situations where cross-validation breaks down. We illustrate the application of our tests using synthetic and real data from a Parkinson\'s disease study.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 10
  "Neto_arXiv_2018" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M', 'Bot BM',
               'Mangravite L', 'Omberg L'),
    Title = 'Using permutations to assess confounding in machine learning applications for digital health',
    Journal = 'arXiv',
    PMID = '-',
    ISSN = '-',
    Year = 2018,
    doi = '-',
    url = 'https://arxiv.org/abs/1811.11920',
    Abstract = 'Clinical machine learning applications are often plagued with confounders that can impact the generalizability and predictive performance of the learners. Confounding is especially problematic in remote digital health studies where the participants self-select to enter the study, thereby making it challenging to balance the demographic characteristics of participants. One effective approach to combat confounding is to match samples with respect to the confounding variables in order to balance the data. This procedure, however, leads to smaller datasets and hence impact the inferences drawn from the learners. Alternatively, confounding adjustment methods that make more efficient use of the data (e.g., inverse probability weighting) usually rely on modeling assumptions, and it is unclear how robust these methods are to violations of these assumptions. Here, rather than proposing a new approach to control for confounding, we develop novel permutation based statistical methods to detect and quantify the influence of observed confounders, and estimate the unconfounded performance of the learner. Our tools can be used to evaluate the effectiveness of existing confounding adjustment methods. We illustrate their application using real-life data from a Parkinson\'s disease mobile health study collected in an uncontrolled environment.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 11
  "Neto_KDD_2019" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M',
               'Bot BM', 'Mangravite L', 'Omberg L'),
    Title = 'A Permutation Approach to Assess Confounding in Machine Learning Applications for Digital Health',
    Journal = 'KDD \'19: Proceedings of the 25th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining',
    PMID = '-',
    ISBN = '978-1-4503-6201-6',
    Year = 2019,
    doi = '10.1145/3292500.3330903',
    url = 'https://doi.org/10.1145/3292500.3330903',
    Abstract = 'Machine learning applications are often plagued with confounders that can impact the generalizability of the learners. In clinical settings, demographic characteristics often play the role of confounders. Confounding is especially problematic in remote digital health studies where the participants self-select to enter the study, thereby making it difficult to balance the demographic characteristics of participants. One effective approach to combat confounding is to match samples with respect to the confounding variables in order to improve the balance of the data. This procedure, however, leads to smaller datasets and hence negatively impact the inferences drawn from the learners. Alternatively, confounding adjustment methods that make more efficient use of the data (such as inverse probability weighting) usually rely on modeling assumptions, and it is unclear how robust these methods are to violations of these assumptions. Here, instead of proposing a new method to control for confounding, we develop novel permutation based statistical tools to detect and quantify the influence of observed confounders, and estimate the unconfounded performance of the learner. Our tools can be used to evaluate the effectiveness of existing confounding adjustment methods. We evaluate the statistical properties of our methods in a simulation study, and illustrate their application using real-life data from a Parkinson\'s disease mobile health study collected in an uncontrolled environment.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  ),
  
  # 12
  "Neto_PacBio_2016" = list(
    Author = c('Neto EC', 'Bot BM', 'Perumal TM',
               'Omberg L', 'Guinney J', 'Kellen M',
               'Klien A', 'Friend SH', 'Trister AD'),
    Title = 'Personalized Hypothesis Tests For Detecting Medication Response In Parkinson Disease Patients Using iPhone Sensor Data',
    Journal = 'The Pacific Symposium on Biocomputing (PSB) 2016',
    PMID = '26776193',
    ISBN = '978-981-4749-40-4',
    Year = 2016,
    doi = '10.1142/9789814749411_0026',
    url = 'https://doi.org/10.1142/9789814749411_0026',
    Abstract = 'We propose hypothesis tests for detecting dopaminergic medication response in Parkinson disease patients, using longitudinal sensor data collected by smartphones. The processed data is composed of multiple features extracted from active tapping tasks performed by the participant on a daily basis, before and after medication, over several months. Each extracted feature corresponds to a time series of measurements annotated according to whether the measurement was taken before or after the patient has taken his/her medication. Even though the data is longitudinal in nature, we show that simple hypothesis tests for detecting medication response, which ignore the serial correlation structure of the data, are still statistically valid, showing type I error rates at the nominal level. We propose two distinct personalized testing approaches. In the first, we combine multiple feature-specific tests into a single union-intersection test. In the second, we construct personalized classifiers of the before/after medication labels using all the extracted features of a given participant, and test the null hypothesis that the area under the receiver operating characteristic curve of the classifier is equal to 1/2. We compare the statistical power of the personalized classifier tests and personalized union-intersection tests in a simulation study, and illustrate the performance of the proposed tests using data from mPower Parkinsons disease study, recently launched as part of Apples ResearchKit mobile platform. Our results suggest that the personalized tests, which ignore the longitudinal aspect of the data, can perform well in real data analyses, suggesting they might be used as a sound baseline approach, to which more sophisticated methods can be compared to.',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease", 'Control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE'
  )
  
)
##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations
publications.names <- names(publications.list) 
for(publication in publications.names){
  
  publication_entity = File(path=publications.list[[publication]]$url,
                            name=publication,
                            parent=pid,
                            synapseStore=F)
  publication_entity = synStore(publication_entity, forceVersion=F)
  
  #### Uncomment this before updating for real
  
  curr_annotations <- publications.list[[publication]]
  curr_wiki_text <- curr_annotations$Abstract

  # Set Abstract as Wiki page
  curr_wiki <- Wiki(owner=publication_entity$properties$id,
                    title="Abstract",
                    markdown=curr_wiki_text)
  curr_wiki <- synStore(curr_wiki)

  # Set Annotations
  curr_annotations$Abstract <- publication_entity$properties$id
  # making abstract location set to synapse file instead of wiki
  synSetAnnotations(publication_entity$properties$id,
                    annotations = curr_annotations)
  
  
  ####
  
  print(publication)
  print(curr_annotations)
}
