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
## Projects covered (with their studyOrProject URLs)
## Studies
mjffurl=paste('[MJFF Levodopa Response Study](/Explore/Studies/DetailsPage?study=',
              URLencode('MJFF Levodopa Response Study',  reserved = FALSE, repeated = FALSE),
              ')', sep="")

mpowerurl=paste('[mPower Mobile Parkinson Disease Study](/Explore/Studies/DetailsPage?study=',
                URLencode('mPower Mobile Parkinson Disease Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")

asthmaurl=paste('[Asthma Mobile Health Study](/Explore/Studies/DetailsPage?study=',
                URLencode('Asthma Mobile Health Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")
elevatemsurl=paste('[elevateMS Study](/Explore/Studies/DetailsPage?study=',
                   URLencode('elevateMS Study', reserved = FALSE, repeated = FALSE),
                   ')', sep = "")
myhearturl=paste('[MyHeart Counts Cardiovascular Health Study](/Explore/Studies/DetailsPage?study=',
                 URLencode('MyHeart Counts Cardiovascular Health Study', reserved = FALSE, repeated = FALSE),
                 ')', sep = "")
brightenurl=paste('[Brighten Study](/Explore/Studies/DetailsPage?study=',
                  URLencode('Brighten Study', reserved = FALSE, repeated = FALSE),
                  ')', sep = "")
sleepurl=paste('[SleepHealth](/Explore/Studies/DetailsPage?study=',
               URLencode('SleepHealth', reserved = FALSE, repeated = FALSE),
               ')', sep = "")

molemapperurl = paste('[Mole Mapper Study](/Explore/Studies/DetailsPage?study=',
                      URLencode('Mole Mapper Study', reserved = FALSE, repeated = FALSE),
                      ')', sep = "")

heartsnapshoturl = paste('[Heart Snapshot Study](/Explore/Studies/DetailsPage?study=',
                         URLencode('Heart Snapshot Study', reserved = FALSE, repeated = FALSE),
                         ')', sep = "")

## Projects
participantretentionurl = paste('[Participant Retention in Digital Health Studies](/Explore/Projects/DetailsPage?study=',
                                     URLencode('Participant Retention in Digital Health Studies', reserved = FALSE, repeated = FALSE),
                                     ')', sep = "")

pddbdreamurl = paste('[Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge](/Explore/Projects/DetailsPage?study=',
                     URLencode('Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge', reserved = FALSE, repeated = FALSE),
                     ')', sep = "")

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
    Year = as.integer(2016),
    doi = '10.1038/sdata.2016.11',
    url = 'https://doi.org/10.1038/sdata.2016.11',
    Abstract = 'Current measures of health and disease are often insensitive, episodic, and subjective. Further, these measures generally are not designed to provide meaningful feedback to individuals. The impact of high-resolution activity data collected from mobile phones is only beginning to be explored. Here we present data from mPower, a clinical observational study about Parkinson disease conducted purely through an iPhone app interface. The study interrogated aspects of this movement disorder through surveys and frequent sensor-based recordings from participants with and without Parkinson disease. Benefitting from large enrollment and repeated measurements on many individuals, these data may help establish baseline variability of real-world activity measurement collected via mobile phones, and ultimately may lead to quantification of the ebbs-and-flows of Parkinson symptoms. App source code for these data collection modules are available through an open source license for use in studies of other conditions. We hope that releasing data contributed by engaged research participants will seed a new community of analysts working collaboratively on understanding mobile health data to advance human health.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
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
    Year = as.integer(2019),
    doi = '10.1038/s41746-019-0178-x',
    url = 'https://doi.org/10.1038/s41746-019-0178-x',
    Abstract = 'Collection of high-dimensional, longitudinal digital health data has the potential to support a wide-variety of research and clinical applications including diagnostics and longitudinal health tracking. Algorithms that process these data and inform digital diagnostics are typically developed using training and test sets generated from multiple repeated measures collected across a set of individuals. However, the inclusion of repeated measurements is not always appropriately taken into account in the analytical evaluations of predictive performance. The assignment of repeated measurements from each individual to both the training and the test sets ("record-wise" data split) is a common practice and can lead to massive underestimation of the prediction error due to the presence of "identity confounding." In essence, these models learn to identify subjects, in addition to diagnostic signal. Here, we present a method that can be used to effectively calculate the amount of identity confounding learned by classifiers developed using a record-wise data split. By applying this method to several real datasets, we demonstrate that identity confounding is a serious issue in digital health studies and that record-wise data splits for machine learning- based applications need to be avoided.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 3
  "Neto_arXiv_2019" = list(
    Author = c('Neto EC','Tummalacherla M',
               'Mangravite L', 'Omberg L'),
    Title = 'Causality-based tests to detect the influence of confounders on mobile health diagnostic applications: a comparison with restricted permutations',
    Journal = 'arXiv',
    # PMID = '-',
    # ISSN = '-',
    Year = as.integer(2019),
    # doi = '-',
    url = 'https://arxiv.org/abs/1911.05139',
    Abstract = 'Machine learning practice is often impacted by confounders. Confounding can be particularly severe in remote digital health studies where the participants self-select to enter the study. While many different confounding adjustment approaches have been proposed in the literature, most of these methods rely on modeling assumptions, and it is unclear how robust they are to violations of these assumptions. This realization has recently motivated the development of restricted permutation methods to quantify the influence of observed confounders on the predictive performance of a machine learning models and evaluate if confounding adjustment methods are working as expected. In this paper we show, nonetheless, that restricted permutations can generate biased estimates of the contribution of the confounders to the predictive performance of a learner, and we propose an alternative approach to tackle this problem. By viewing a classification task from a causality perspective, we are able to leverage conditional independence tests between predictions and test set labels and confounders in order to detect confounding on the predictive performance of a classifier. We illustrate the application of our causality-based approach to data collected from mHealth study in Parkinson\'s disease.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 4
  "Perumal_Ubicomp_2018" = list(
    Author = c('Perumal TM', 'Tummalacherla M',
               'Snyder P','Neto EC', 'Dorsey ER',
               'Mangravite L','Omberg L'),
    Title = 'Remote Assessment, in Real-World Setting, of Tremor Severity in Parkinson\'s Disease Patients Using Smartphone Inertial Sensors',
    Journal = 'UbiComp \'18: The 2018 ACM International Joint Conference on Pervasive and Ubiquitous Computing',
    # PMID = '-',
    ISBN = '978-1-4503-5966-5',
    Year = as.integer(2018),
    doi = '10.1145/3267305.3267612',
    url = 'https://doi.org/10.1145/3267305.3267612',
    Abstract = 'Current clinimetrics assessment of Parkinson\'s disease (PD) is insensitive, episodic, subjective, and provider-centered. Ubiquitous technologies such as smartphones promise to fundamentally change PD assessments. To enable frequent remote assessment of PD tremor severity, here we present a 39-month smartphone research study in a real-world setting without supervision. More than 15,000 consented participants used the smartphone application, mPower, to perform self-administered active tasks. In the scope of this abstract, we developed an objective smartphone measure of PD tremor severity called mPower Tremor Scores (mPTS) using machine learning. Efficacy, and reliability of mPTS was further tested and validated in a separate cohort in the real world and in-clinic setting. This study demonstrates the utility of using structured activities with built-in smartphone sensors to measure PD tremor severity remotely and objectively in a real-world setting using more than 1100 participants.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 5
  "Doerr_JMIRmHealth_2017" = list(
    Author = c('Doerr M', 'Truong AM','Bot BM',
               'Wilbanks J', 'Suver C','Mangravite LM'),
    Title = 'Formative Evaluation of Participant Experience With Mobile eConsent in the App-Mediated Parkinson mPower Study: A Mixed Methods Study',
    Journal = 'JMIR mHealth and uHealth',
    PMID = '28209557',
    ISSN = '2291-5222',
    Year = as.integer(2017),
    doi = '10.2196/mhealth.6521',
    url = 'http://doi.org/10.2196/mhealth.6521',
    Abstract = 'Background: To fully capitalize on the promise of mobile technology to enable scalable, participant-centered research, we must develop companion self-administered electronic informed consent (eConsent) processes. As we do so, we have an ethical obligation to ensure that core tenants of informed consent—informedness, comprehension, and voluntariness—are upheld. Furthermore, we should be wary of recapitulating the pitfalls of “traditional” informed consent processes.\n Objective: Our objective was to describe the essential qualities of participant experience, including delineation of common and novel themes relating to informed consent, with a self-administered, smartphone-based eConsent process. We sought to identify participant responses related to informedness, comprehension, and voluntariness as well as to capture any emergent themes relating to the informed consent process in an app-mediated research study.\n Methods: We performed qualitative thematic analysis of participant responses to a daily general prompt collected over a 6-month period within the Parkinson mPower app. We employed a combination of a priori and emergent codes for our analysis. A priori codes focused on the core concepts of informed consent; emergent codes were derived to capture additional themes relating to self-administered consent processes. We used self-reported demographic information from the study’s baseline survey to characterize study participants and respondents.\n Results: During the study period, 9846 people completed the eConsent process and enrolled in the Parkinson mPower study. In total, 2758 participants submitted 7483 comments; initial categorization identified a subset of 3875 germane responses submitted by 1678 distinct participants. Respondents were more likely to self-report a Parkinson disease diagnosis (30.21% vs 11.10%), be female (28.26% vs 20.18%), be older (42.89 years vs 34.47 years), and have completed more formal education (66.23% with a 4-year college degree or more education vs 55.77%) than all the mPower participants (P<.001 for all values). Within our qualitative analysis, 3 conceptual domains emerged. First, consistent with fully facilitated in-person informed consent settings, we observed a broad spectrum of comprehension of core research concepts following eConsent. Second, we identified new consent themes born out of the remote mobile research setting, for example the impact of the study design on the engagement of controls and the misconstruction of the open response field as a method for responsive communication with researchers, that bear consideration for inclusion within self-administered eConsent. Finally, our findings highlighted participants’ desire to be empowered as partners.\n Conclusions: Our study serves as a formative evaluation of participant experience with a self-administered informed consent process via a mobile app. Areas for future investigation include direct comparison of the efficacy of self-administered eConsent with facilitated informed consent processes, exploring the potential benefits and pitfalls of smartphone user behavioral habits on participant engagement in research, and developing best practices to increase informedness, comprehension, and voluntariness via participant coengagement in the research endeavor.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'),
  
  # 6
  "Wilbanks_NatBioTech_2016" = list(
    Author = c('Wilbanks J', 'Friend SH'),
    Title = 'First, design for data sharing',
    Journal = 'Nature Biotechnology',
    PMID = '26939011',
    ISSN = '1546-1696',
    Year = as.integer(2016),
    doi = '10.1038/nbt.3516',
    url = 'https://doi.org/10.1038/nbt.3516',
    # Abstract = '',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 7
  "Trister_npjParkinsons_2016" = list(
    Author = c('Trister AD', 'Dorsey ER', 'Friend SH'),
    Title = 'Smartphones as new tools in the management and understanding of Parkinson’s disease',
    Journal = 'npj Parkinson\'s Disease',
    PMID = '28725694',
    ISSN = '2373-8057',
    Year = as.integer(2016),
    doi = '10.1038/npjparkd.2016.6',
    url = 'https://doi.org/10.1038/npjparkd.2016.6',
    # Abstract = '',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 8
  "Neto_arXiv_2017_Jun" = list(
    Author = c('Neto EC', 'Perumal TM',
               'Pratap A', 'Bot BM', 'Mangravite L', 'Omberg L'),
    Title = 'On the analysis of personalized medication response and classification of case vs control patients in mobile health studies: the mPower case study',
    Journal = 'arXiv',
    # PMID = '-',
    # ISSN = '-',
    Year = as.integer(2017),
    # doi = '-',
    url = 'https://arxiv.org/abs/1706.09574',
    Abstract = 'In this work we provide a couple of contributions to the analysis of longitudinal data collected by smartphones in mobile health applications. First, we propose a novel statistical approach to disentangle personalized treatment and "time-of-the-day" effects in observational studies. Under the assumption of no unmeasured confounders, we show how to use conditional independence relations in the data in order to determine if a difference in performance between activity tasks performed before and after the participant has taken medication, are potentially due to an effect of the medication or to a "time-of-the-day" effect (or still to both). Second, we show that smartphone data collected from a given study participant can represent a "digital fingerprint" of the participant, and that classifiers of case/control labels, constructed using longitudinal data, can show artificially improved performance when data from each participant is included in both training and test sets. We illustrate our contributions using data collected during the first 6 months of the mPower study.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 9
  "Neto_arXiv_2017_Dec" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M',
               'Bot BM', 'Trister AD', 'Friend SH',
               'Mangravite L', 'Omberg L'),
    Title = 'Learning Disease vs Participant Signatures: a permutation test approach to detect identity confounding in machine learning diagnostic applications',
    Journal = 'arXiv',
    # PMID = '-',
    # ISSN = '-',
    Year = as.integer(2017),
    # doi = '-',
    url = 'https://arxiv.org/abs/1712.03120',
    Abstract = 'Recently, Saeb et al (2017) showed that, in diagnostic machine learning applications, having data of each subject randomly assigned to both training and test sets (record-wise data split) can lead to massive underestimation of the cross-validation prediction error, due to the presence of "subject identity confounding" caused by the classifier\'s ability to identify subjects, instead of recognizing disease. To solve this problem, the authors recommended the random assignment of the data of each subject to either the training or the test set (subject-wise data split). The adoption of subject-wise split has been criticized in Little et al (2017), on the basis that it can violate assumptions required by cross-validation to consistently estimate generalization error. In particular, adopting subject-wise splitting in heterogeneous data-sets might lead to model under-fitting and larger classification errors. Hence, Little et al argue that perhaps the overestimation of prediction errors with subject-wise cross-validation, rather than underestimation with record-wise cross-validation, is the reason for the discrepancies between prediction error estimates generated by the two splitting strategies. In order to shed light on this controversy, we focus on simpler classification performance metrics and develop permutation tests that can detect identity confounding. By focusing on permutation tests, we are able to evaluate the merits of record-wise and subject-wise data splits under more general statistical dependencies and distributional structures of the data, including situations where cross-validation breaks down. We illustrate the application of our tests using synthetic and real data from a Parkinson\'s disease study.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 10
  "Neto_arXiv_2018" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M', 'Bot BM',
               'Mangravite L', 'Omberg L'),
    Title = 'Using permutations to assess confounding in machine learning applications for digital health',
    Journal = 'arXiv',
    # PMID = '-',
    # ISSN = '-',
    Year = as.integer(2018),
    # doi = '-',
    url = 'https://arxiv.org/abs/1811.11920',
    Abstract = 'Clinical machine learning applications are often plagued with confounders that can impact the generalizability and predictive performance of the learners. Confounding is especially problematic in remote digital health studies where the participants self-select to enter the study, thereby making it challenging to balance the demographic characteristics of participants. One effective approach to combat confounding is to match samples with respect to the confounding variables in order to balance the data. This procedure, however, leads to smaller datasets and hence impact the inferences drawn from the learners. Alternatively, confounding adjustment methods that make more efficient use of the data (e.g., inverse probability weighting) usually rely on modeling assumptions, and it is unclear how robust these methods are to violations of these assumptions. Here, rather than proposing a new approach to control for confounding, we develop novel permutation based statistical methods to detect and quantify the influence of observed confounders, and estimate the unconfounded performance of the learner. Our tools can be used to evaluate the effectiveness of existing confounding adjustment methods. We illustrate their application using real-life data from a Parkinson\'s disease mobile health study collected in an uncontrolled environment.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  # 11
  "Neto_KDD_2019" = list(
    Author = c('Neto EC', 'Pratap A',
               'Perumal TM', 'Tummalacherla M',
               'Bot BM', 'Mangravite L', 'Omberg L'),
    Title = 'A Permutation Approach to Assess Confounding in Machine Learning Applications for Digital Health',
    Journal = 'KDD \'19: Proceedings of the 25th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining',
    # PMID = '-',
    ISBN = '978-1-4503-6201-6',
    Year = as.integer(2019),
    doi = '10.1145/3292500.3330903',
    url = 'https://doi.org/10.1145/3292500.3330903',
    Abstract = 'Machine learning applications are often plagued with confounders that can impact the generalizability of the learners. In clinical settings, demographic characteristics often play the role of confounders. Confounding is especially problematic in remote digital health studies where the participants self-select to enter the study, thereby making it difficult to balance the demographic characteristics of participants. One effective approach to combat confounding is to match samples with respect to the confounding variables in order to improve the balance of the data. This procedure, however, leads to smaller datasets and hence negatively impact the inferences drawn from the learners. Alternatively, confounding adjustment methods that make more efficient use of the data (such as inverse probability weighting) usually rely on modeling assumptions, and it is unclear how robust these methods are to violations of these assumptions. Here, instead of proposing a new method to control for confounding, we develop novel permutation based statistical tools to detect and quantify the influence of observed confounders, and estimate the unconfounded performance of the learner. Our tools can be used to evaluate the effectiveness of existing confounding adjustment methods. We evaluate the statistical properties of our methods in a simulation study, and illustrate their application using real-life data from a Parkinson\'s disease mobile health study collected in an uncontrolled environment.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
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
    Year = as.integer(2016),
    doi = '10.1142/9789814749411_0026',
    url = 'https://doi.org/10.1142/9789814749411_0026',
    Abstract = 'We propose hypothesis tests for detecting dopaminergic medication response in Parkinson disease patients, using longitudinal sensor data collected by smartphones. The processed data is composed of multiple features extracted from active tapping tasks performed by the participant on a daily basis, before and after medication, over several months. Each extracted feature corresponds to a time series of measurements annotated according to whether the measurement was taken before or after the patient has taken his/her medication. Even though the data is longitudinal in nature, we show that simple hypothesis tests for detecting medication response, which ignore the serial correlation structure of the data, are still statistically valid, showing type I error rates at the nominal level. We propose two distinct personalized testing approaches. In the first, we combine multiple feature-specific tests into a single union-intersection test. In the second, we construct personalized classifiers of the before/after medication labels using all the extracted features of a given participant, and test the null hypothesis that the area under the receiver operating characteristic curve of the classifier is equal to 1/2. We compare the statistical power of the personalized classifier tests and personalized union-intersection tests in a simulation study, and illustrate the performance of the proposed tests using data from mPower Parkinsons disease study, recently launched as part of Apples ResearchKit mobile platform. Our results suggest that the personalized tests, which ignore the longitudinal aspect of the data, can perform well in real data analyses, suggesting they might be used as a sound baseline approach, to which more sophisticated methods can be compared to.',
    Consortium = 'mHealth',
    Study = 'mPower Mobile Parkinson Disease Study',
    Diagnosis = c("Parkinson's disease", 'control'),
    digitalAssessmentCategory = c('resting tremor', 'kinetic tremor',
                                  'postural tremor','action tremor',
                                  'gait', 'voice'),
    sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                   'touchscreen', 'microphone'),
    synID = 'syn4993293',
    Featured = 'TRUE',
    studyOrProject = mpowerurl,
    publicationType = 'study'
  ),
  
  #### Asthma Mobile Health Study
  # 1
  "Chan_NatBioTech_2017" = list(
    Author = c('Chan YF', 'Wang P', 'Rogers L',
               'Tignor N', 'Zweig M', 'Hershman SG', 'Genes N',
               'Scott ER', 'Krock E', 'Badgeley M', 'Edgar R'),
    Title = 'The Asthma Mobile Health Study, a large-scale clinical observational study using ResearchKit',
    Journal = 'Nature Biotechnology',
    PMID = '28288104',
    ISSN = '1546-1696',
    Year = as.integer(2017),
    doi = '10.1038/nbt.3826',
    url = 'https://doi.org/10.1038/nbt.3826',
    Abstract = 'The feasibility of using mobile health applications to conduct observational clinical studies requires rigorous validation. Here, we report initial findings from the Asthma Mobile Health Study, a research study, including recruitment, consent, and enrollment, conducted entirely remotely by smartphone. We achieved secure bidirectional data flow between investigators and 7,593 participants from across the United States, including many with severe asthma. Our platform enabled prospective collection of longitudinal, multidimensional data (e.g., surveys, devices, geolocation, and air quality) in a subset of users over the 6-month study period. Consistent trending and correlation of interrelated variables support the quality of data obtained via this method. We detected increased reporting of asthma symptoms in regions affected by heat, pollen, and wildfires. Potential challenges with this technology include selection bias, low retention rates, reporting bias, and data security. These issues require attention to realize the full potential of mobile platforms in research and patient care.',
    Consortium = 'mHealth',
    Study = 'Asthma Mobile Health Study',
    # Diagnosis = c(''),
    # digitalAssessmentCategory = c(''),
    # sensorType = c(''),
    synID = 'syn8361748',
    Featured = 'TRUE',
    studyOrProject = asthmaurl,
    publicationType = 'study'
  ),
  
  # 2
  "Chan_NatSciData_2018" = list(
    Author = c('Chan YF', 'Bot BM', 'Zweig M',
               'Tignor N', 'Ma W', 'Suver C', 'Cedeno R',
               'Scott ER', 'Hershman SG', 'Schadt EE', 'Wang P'),
    Title = 'The asthma mobile health study, smartphone data collected using ResearchKit',
    Journal = 'Scientific Data',
    PMID = '29786695',
    ISSN = '2052-4463',
    Year = as.integer(2018),
    doi = '10.1038/sdata.2018.96',
    url = 'https://doi.org/10.1038/sdata.2018.96',
    Abstract = 'Widespread adoption of smart mobile platforms coupled with a growing ecosystem of sensors including passive location tracking and the ability to leverage external data sources create an opportunity to generate an unprecedented depth of data on individuals. Mobile health technologies could be utilized for chronic disease management as well as research to advance our understanding of common diseases, such as asthma. We conducted a prospective observational asthma study to assess the feasibility of this type of approach, clinical characteristics of cohorts recruited via a mobile platform, the validity of data collected, user retention patterns, and user data sharing preferences. We describe data and descriptive statistics from the Asthma Mobile Health Study, whereby participants engaged with an iPhone application built using Apple\'s ResearchKit framework. Data from 6346 U.S. participants, who agreed to share their data broadly, have been made available for further research. These resources have the potential to enable the research community to work collaboratively towards improving our understanding of asthma as well as mobile health research best practices.',
    Consortium = 'mHealth',
    Study = 'Asthma Mobile Health Study',
    # Diagnosis = c(''),
    # digitalAssessmentCategory = c(''),
    # sensorType = c(''),
    synID = 'syn8361748',
    Featured = 'TRUE',
    studyOrProject = asthmaurl,
    publicationType = 'study'
  ),
  
  #### Mole Mapper Study
  # 1
  "Webster_NatSciData_2017" = list(
    Author = c('Webster DE', 'Suver C', 'Doerr M',
               'Mounts E', 'Domenico L', 'Petrie T',
               'Leachman SA', 'Trister AD', 'Bot BM'),
    Title = 'The Mole Mapper Study, Mobile Phone Skin Imaging and Melanoma Risk Data Collected Using ResearchKit',
    Journal = 'Scientific Data',
    PMID = '28195576',
    ISSN = '2052-4463',
    Year = as.integer(2017),
    doi = '10.1038/sdata.2017.5',
    url = 'https://doi.org/10.1038/sdata.2017.5',
    Abstract = 'Sensor-embedded phones are an emerging facilitator for participant-driven research studies. Skin cancer research is particularly amenable to this approach, as phone cameras enable self-examination and documentation of mole abnormalities that may signal a progression towards melanoma. Aggregation and open sharing of this participant-collected data can be foundational for research and the development of early cancer detection tools. Here we describe data from Mole Mapper, an iPhone-based observational study built using the Apple ResearchKit framework. The Mole Mapper app was designed to collect participant-provided images and measurements of moles, together with demographic and behavioral information relating to melanoma risk. The study cohort includes 2,069 participants who contributed 1,920 demographic surveys, 3,274 mole measurements, and 2,422 curated mole images. Survey data recapitulates associations between melanoma and known demographic risks, with red hair as the most significant factor in this cohort. Participant-provided mole measurements indicate an average mole size of 3.95 mm. These data have been made available to engage researchers in a collaborative, multidisciplinary effort to better understand and prevent melanoma.',
    Consortium = 'mHealth',
    Study = 'Mole Mapper Study',
    Diagnosis = c('melanoma', 'control'),
    digitalAssessmentCategory = c('dermatologic phenotype'),
    sensorType = c('touchscreen', 'camera'),
    synID = 'syn5576734',
    Featured = 'TRUE',
    studyOrProject = molemapperurl,
    publicationType = 'study'
  ),
  
  # 2
  "Petri_SemCutMedSur_2019" = list(
    Author = c('Petrie T', 'Samatham R',
               'Goodyear SM', 'Webster DE', 'Leachman SA'),
    Title = 'MoleMapper: An Application for Crowdsourcing Mole Images to Advance Melanoma Early-Detection Research',
    Journal = 'Seminars in Cutaneous Medicine and Surgery',
    PMID = '31051024',
    ISSN = '1085-5629',
    Year = as.integer(2019),
    doi = '10.12788/j.sder.2019.001',
    url = 'https://doi.org/10.12788/j.sder.2019.001',
    Abstract = 'Advancements in smartphone technologies and the use of specialized health care applications offer an exciting new era to promote melanoma awareness to the public and improve education and prevention strategies. These applications also afford an opportunity to power meaningful research aimed at improving image diagnostics and early melanoma detection. Here, we summarize our experience associated with developing and managing the implementation of MoleMapper™, a research-based application that not only provides an efficient way for users to digitally track images of moles and facilitate skin self-examinations but also provides a platform to crowdsource research participants and the curation of mole images in efforts to advance melanoma research. Obtaining electronic consent, safeguarding participant data, and employing a framework to ensure collection of meaningful data represent a few of the inherent difficulties associated with orchestrating such a wide-scale research enterprise. In this review, we discuss strategies to overcome these and other challenges leading to the implementation of MoleMapper™. \n Advancements in smartphone technologies and the use of specialized health care applications offer an exciting new era to promote melanoma awareness to the public and improve education and prevention strategies.',
    Consortium = 'mHealth',
    Study = 'Mole Mapper Study',
    Diagnosis = c('melanoma', 'control'),
    digitalAssessmentCategory = c('dermatologic phenotype'),
    sensorType = c('touchscreen', 'camera'),
    synID = 'syn5576734',
    Featured = 'TRUE',
    studyOrProject = molemapperurl,
    publicationType = 'study'
  ),
  
  #### My Heart Counts
  # 1
  "Hershman_NatSciData_2019" = list(
    Author = c('Hershman SG', 'Bot BM', 'Shcherbina A',
               'Doerr M', 'Moayedi Y', 'Pavlovic A', 'Waggott D',
               'Cho MK', 'Rosenberger ME', 'Haskell WL', 'Myers J'),
    Title = 'Physical activity, sleep and cardiovascular health data for 50,000 individuals from the MyHeart Counts Study',
    Journal = 'Scientific Data',
    PMID = '30975992',
    ISSN = '2052-4463',
    Year = as.integer(2019),
    doi = '10.1038/s41597-019-0016-7',
    url = 'https://doi.org/10.1038/s41597-019-0016-7',
    Abstract = 'Studies have established the importance of physical activity and fitness for long-term cardiovascular health, yet limited data exist on the association between objective, real-world large-scale physical activity patterns, fitness, sleep, and cardiovascular health primarily due to difficulties in collecting such datasets. We present data from the MyHeart Counts Cardiovascular Health Study, wherein participants contributed data via an iPhone application built using Apple’s ResearchKit framework and consented to make this data available freely for further research applications. In this smartphone-based study of cardiovascular health, participants recorded daily physical activity, completed health questionnaires, and performed a 6-minute walk fitness test. Data from English-speaking participants aged 18 years or older with a US-registered iPhone who agreed to share their data broadly and who enrolled between the study’s launch and the time of the data freeze for this data release (March 10 2015–October 28 2015) are now available for further research. It is anticipated that releasing this large-scale collection of real-world physical activity, fitness, sleep, and cardiovascular health data will enable the research community to work collaboratively towards improving our understanding of the relationship between cardiovascular indicators, lifestyle, and overall health, as well as inform mobile health research best practices.',
    Consortium = 'mHealth',
    Study = 'MyHeart Counts Cardiovascular Health Study',
    # Diagnosis = c(''),
    # digitalAssessmentCategory = c(''),
    # sensorType = c(''),
    synID = 'syn11269541',
    Featured = 'TRUE',
    studyOrProject = myhearturl,
    publicationType = 'study'
  ),
  
  # 2
  "McConnell_JAMACardio_2019" = list(
    Author = c('McConnell MV', 'Shcherbina A', 'Pavlovic A',
               'Homburger JR', 'Goldfeder RL', 'Waggot D',
               'Cho MK', 'Rosenberger ME',
               'Haskell WL', 'Myers J', 'Champagne MA'),
    Title = 'Feasibility of Obtaining Measures of Lifestyle From a Smartphone App: The MyHeart Counts Cardiovascular Health Study',
    Journal = 'JAMA Cardiology',
    PMID = '27973671',
    ISSN = '2380-6583',
    Year = as.integer(2016),
    doi = '10.1001/jamacardio.2016.4395',
    url = 'https://doi.org/10.1001/jamacardio.2016.4395',
    Abstract = 'Importance: Studies have established the importance of physical activity and fitness, yet limited data exist on the associations between objective, real-world physical activity patterns, fitness, sleep, and cardiovascular health. \n Objectives: To assess the feasibility of obtaining measures of physical activity, fitness, and sleep from smartphones and to gain insights into activity patterns associated with life satisfaction and self-reported disease. \n Design, setting, and participants: The MyHeart Counts smartphone app was made available in March 2015, and prospective participants downloaded the free app between March and October 2015. In this smartphone-based study of cardiovascular health, participants recorded physical activity, filled out health questionnaires, and completed a 6-minute walk test. The app was available to download within the United States. \n Main outcomes and measures: The feasibility of consent and data collection entirely on a smartphone, the use of machine learning to cluster participants, and the associations between activity patterns, life satisfaction, and self-reported disease. \n Results: From the launch to the time of the data freeze for this study (March to October 2015), the number of individuals (self-selected) who consented to participate was 48 968, representing all 50 states and the District of Columbia. Their median age was 36 years (interquartile range, 27-50 years), and 82.2% (30 338 male, 6556 female, 10 other, and 3115 unknown) were male. In total, 40 017 (81.7% of those who consented) uploaded data. Among those who consented, 20 345 individuals (41.5%) completed 4 of the 7 days of motion data collection, and 4552 individuals (9.3%) completed all 7 days. Among those who consented, 40 017 (81.7%) filled out some portion of the questionnaires, and 4990 (10.2%) completed the 6-minute walk test, made available only at the end of 7 days. The Heart Age Questionnaire, also available after 7 days, required entering lipid values and age 40 to 79 years (among 17 245 individuals, 43.1% of participants). Consequently, 1334 (2.7%) of those who consented completed all fields needed to compute heart age and a 10-year risk score. Physical activity was detected for a mean (SD) of 14.5% (8.0%) of individuals\' total recorded time. Physical activity patterns were identified by cluster analysis. A pattern of lower overall activity but more frequent transitions between active and inactive states was associated with equivalent self-reported cardiovascular disease as a pattern of higher overall activity with fewer transitions. Individuals\' perception of their activity and risk bore little relation to sensor-estimated activity or calculated cardiovascular risk. \n Conclusions and relevance: A smartphone-based study of cardiovascular health is feasible, and improvements in participant diversity and engagement will maximize yield from consented participants. Large-scale, real-world assessment of physical activity, fitness, and sleep using mobile devices may be a useful addition to future population health studies.',
    Consortium = 'mHealth',
    Study = 'MyHeart Counts Cardiovascular Health Study',
    # Diagnosis = c(''),
    # digitalAssessmentCategory = c(''),
    # sensorType = c(''),
    synID = 'syn11269541',
    Featured = 'TRUE',
    studyOrProject = myhearturl,
    publicationType = 'study'
  ),
  
  #### Brighten Study
  # 1
  "Pratap_DepAnx_2018" = list(
    Author = c('Pratap A', 'Atkins DC', 'Renn BN',
               'Tanana MJ', 'Mooney SD', 'Anguera JA', 'Arean PA'),
    Title = 'The Accuracy of Passive Phone Sensors in Predicting Daily Mood',
    Journal = 'Depression and Anxiety',
    PMID = '30129691',
    ISSN = '1520-6394',
    Year = as.integer(2018),
    doi = '10.1002/da.22822',
    url = 'https://doi.org/10.1002/da.22822',
    Abstract = 'Background: Smartphones provide a low-cost and efficient means to collect population level data. Several small studies have shown promise in predicting mood variability from smartphone-based sensor and usage data, but have not been generalized to nationally recruited samples. This study used passive smartphone data, demographic characteristics, and baseline depressive symptoms to predict prospective daily mood. \n Method: Daily phone usage data were collected passively from 271 Android phone users participating in a fully remote randomized controlled trial of depression treatment (BRIGHTEN). Participants completed daily Patient Health Questionnaire-2. A machine learning approach was used to predict daily mood for the entire sample and individual participants. \n Results: Sample-wide estimates showed a marginally significant association between physical mobility and self-reported daily mood (B = -0.04, P < 0.05), but the predictive models performed poorly for the sample as a whole (median R2 ∼ 0). Focusing on individuals, 13.9% of participants showed significant association (FDR < 0.10) between a passive feature and daily mood. Personalized models combining features provided better prediction performance (median area under the curve [AUC] > 0.50) for 80.6% of participants and very strong prediction in a subset (median AUC > 0.80) for 11.8% of participants. \n Conclusions: Passive smartphone data with current features may not be suited for predicting daily mood at a population level because of the high degree of intra- and interindividual variation in phone usage patterns and daily mood ratings. Personalized models show encouraging early signs for predicting an individual\'s mood state changes, with GPS-derived mobility being the top most important feature in the present sample.',
    Consortium = 'mHealth',
    Study = 'Brighten Study',
    Diagnosis = c('control'),
    digitalAssessmentCategory = c('cognition', 'sleep', 'mood',
                                  'mobility', 'mental health'),
    sensorType = c('touchscreen'),
    synID = 'syn10848316',
    Featured = 'TRUE',
    studyOrProject = brightenurl,
    publicationType = 'study'
  ),
  
  # 2
  "Renn_MHPA_2018" = list(
    Author = c('Renn BN', 'Pratap A', 'Atkins DC',
               'Mooney SD', 'Arean PA'),
    Title = 'Smartphone-Based Passive Assessment of Mobility in Depression: Challenges and Opportunities',
    Journal = 'Mental Health and Physical Activity',
    PMID = '30123324',
    ISSN = '1755-2966',
    Year = as.integer(2018),
    doi = '10.1016/j.mhpa.2018.04.003',
    url = 'https://doi.org/10.1016/j.mhpa.2018.04.003',
    Abstract = 'Advances in technology have ushered in exciting potential for smartphone sensors to inform mental health care. This commentary addresses the practical challenges of collecting smartphone-based physical activity data. Using data (N = 353) from a large scale, fully remote randomized clinical trial for depression, we discuss findings and limitations associated with using passively collected mobility data to make inferences about depressive symptom severity. We highlight a range of issues in associating mobility data with mental health symptoms, including a high degree of variability, data featurization, granularity, and sparsity. Given the considerable efforts toward leveraging technology in mental health care, it is important to consider these challenges to optimize assessment and guide best practices.',
    Consortium = 'mHealth',
    Study = 'Brighten Study',
    Diagnosis = c('control'),
    digitalAssessmentCategory = c('cognition', 'sleep', 'mood',
                                  'mobility', 'mental health'),
    sensorType = c('touchscreen'),
    synID = 'syn10848316',
    Featured = 'TRUE',
    studyOrProject = brightenurl,
    publicationType = 'study'
  ),
  
  # 3
  "Pratap_JMIR_2018" = list(
    Author = c('Pratap A', 'Renn BN', 'Volponi J',
               'Mooney SD', 'Gazzaley A', 'Arean PA', 'Anguera JA'),
    Title = 'Using Mobile Apps to Assess and Treat Depression in Hispanic and Latino Populations: Fully Remote Randomized Clinical Trial',
    Journal = 'Journal of Medical Internet Research',
    PMID = '30093372',
    ISSN = '1438-8871',
    Year = as.integer(2018),
    doi = '10.2196/10130',
    url = 'https://doi.org/10.2196/10130',
    Abstract = 'Background: Most people with mental health disorders fail to receive timely access to adequate care. US Hispanic/Latino individuals are particularly underrepresented in mental health care and are historically a very difficult population to recruit into clinical trials; however, they have increasing access to mobile technology, with over 75% owning a smartphone. This technology has the potential to overcome known barriers to accessing and utilizing traditional assessment and treatment approaches. \n Objective: This study aimed to compare recruitment and engagement in a fully remote trial of individuals with depression who either self-identify as Hispanic/Latino or not. A secondary aim was to assess treatment outcomes in these individuals using three different self-guided mobile apps: iPST (based on evidence-based therapeutic principles from problem-solving therapy, PST), Project Evolution (EVO; a cognitive training app based on cognitive neuroscience principles), and health tips (a health information app that served as an information control). \n Methods: We recruited Spanish and English speaking participants through social media platforms, internet-based advertisements, and traditional fliers in select locations in each state across the United States. Assessment and self-guided treatment was conducted on each participant\'s smartphone or tablet. We enrolled 389 Hispanic/Latino and 637 non-Hispanic/Latino adults with mild to moderate depression as determined by Patient Health Questionnaire-9 (PHQ-9) score≥5 or related functional impairment. Participants were first asked about their preferences among the three apps and then randomized to their top two choices. Outcomes were depressive symptom severity (measured using PHQ-9) and functional impairment (assessed with Sheehan Disability Scale), collected over 3 months. Engagement in the study was assessed based on the number of times participants completed active surveys. \n Results: We screened 4502 participants and enrolled 1040 participants from throughout the United States over 6 months, yielding a sample of 348 active users. Long-term engagement surfaced as a key issue among Hispanic/Latino participants, who dropped from the study 2 weeks earlier than their non-Hispanic/Latino counterparts (P<.02). No significant differences were observed for treatment outcomes between those identifying as Hispanic/Latino or not. Although depressive symptoms improved (beta=–2.66, P=.006) over the treatment course, outcomes did not vary by treatment app. \n Conclusions: Fully remote mobile-based studies can attract a diverse participant pool including people from traditionally underserved communities in mental health care and research (here, Hispanic/Latino individuals). However, keeping participants engaged in this type of “low-touch” research study remains challenging. Hispanic/Latino populations may be less willing to use mobile apps for assessing and managing depression. Future research endeavors should use a user-centered design to determine the role of mobile apps in the assessment and treatment of depression for this population, app features they would be interested in using, and strategies for long-term engagement. \n Trial Registration: Clinicaltrials.gov NCT01808976; https://clinicaltrials.gov/ct2/show/NCT01808976 (Archived by WebCite at http://www.webcitation.org/70xI3ILkz)',
    Consortium = 'mHealth',
    Study = 'Brighten Study',
    Diagnosis = c('control'),
    digitalAssessmentCategory = c('cognition', 'sleep', 'mood',
                                  'mobility', 'mental health'),
    sensorType = c('touchscreen'),
    synID = 'syn10848316',
    Featured = 'TRUE',
    studyOrProject = brightenurl,
    publicationType = 'study'
  ),
  
  # 4
  "Anguera_BMJInnov_2016" = list(
    Author = c('Anguera JA', 'Jordan JT', 'Castaneda D',
               'Gazzaley A', 'Arean PA'),
    Title = 'Conducting a fully mobile and randomised clinical trial for depression: access, engagement and expense',
    Journal = 'BMJ Innovations',
    PMID = '27019745',
    ISSN = '2055-8074',
    Year = as.integer(2016),
    doi = '10.1136/bmjinnov-2015-000098',
    url = 'https://doi.org/10.1136/bmjinnov-2015-000098',
    Abstract = 'Importance Advances in mobile technology have resulted in federal and industry-level initiatives to facilitate large-scale clinical research using smart devices. Although the benefits of technology to expand data collection are obvious, assumptions about the reach of mobile research methods (access), participant willingness to engage in mobile research protocols (engagement), and the cost of this research (cost) remain untested. \n Objective To assess the feasibility of a fully mobile randomised controlled trial using assessments and treatments delivered entirely through mobile devices to depressed individuals. \n Design Using a web-based research portal, adult participants with depression who also owned a smart device were screened, consented and randomised to 1 of 3 mental health apps for treatment. Assessments of self-reported mood and cognitive function were conducted at baseline, 4, 8 and 12 weeks. Physical and social activity was monitored daily using passively collected phone use data. All treatment and assessment tools were housed on each participant\'s smart phone or tablet. \n Interventions A cognitive training application, an application based on problem-solving therapy, and a mobile-sensing application promoting daily activities. \n Results Access: We screened 2923 people and enrolled 1098 participants in 5 months. The sample characteristics were comparable to the 2013 US census data. Recruitment via Craigslist.org yielded the largest sample. Engagement: Study engagement was high during the first 2 weeks of treatment, falling to 44% adherence by the 4th week. Cost: The total amount spent on for this project, including staff costs and β testing, was $314264 over 2 years. \n Conclusions and relevance These findings suggest that mobile randomised control trials can recruit large numbers of participants in a short period of time and with minimal cost, but study engagement remains challenging. \n Trial registration number NCT00540865.',
    Consortium = 'mHealth',
    Study = 'Brighten Study',
    Diagnosis = c('control'),
    digitalAssessmentCategory = c('cognition', 'sleep', 'mood',
                                  'mobility', 'mental health'),
    sensorType = c('touchscreen'),
    synID = 'syn10848316',
    Featured = 'TRUE',
    studyOrProject = brightenurl,
    publicationType = 'study'
  ),
  
  # 5
  "Arean_JMIR_2016" = list(
    Author = c('Arean PA', 'Hallgren KA', 'Jordan JT',
               'Gazzaley A', 'Atkins DC', 'Heagerty PJ', 'Anguera JA'),
    Title = 'The Use and Effectiveness of Mobile Apps for Depression: Results From a Fully Remote Clinical Trial',
    Journal = 'Journal of Medical Internet Research',
    PMID = '27998876',
    ISSN = '1438-8871',
    Year = as.integer(2016),
    doi = '10.2196/jmir.6482',
    url = 'https://doi.org/10.2196/jmir.6482',
    Abstract = 'Background: Mobile apps for mental health have the potential to overcome access barriers to mental health care, but there is little information on whether patients use the interventions as intended and the impact they have on mental health outcomes. \n Objective: The objective of our study was to document and compare use patterns and clinical outcomes across the United States between 3 different self-guided mobile apps for depression. \n Methods: Participants were recruited through Web-based advertisements and social media and were randomly assigned to 1 of 3 mood apps. Treatment and assessment were conducted remotely on each participant’s smartphone or tablet with minimal contact with study staff. We enrolled 626 English-speaking adults (≥18 years old) with mild to moderate depression as determined by a 9-item Patient Health Questionnaire (PHQ-9) score ≥5, or if their score on item 10 was ≥2. The apps were (1) Project: EVO, a cognitive training app theorized to mitigate depressive symptoms by improving cognitive control, (2) iPST, an app based on an evidence-based psychotherapy for depression, and (3) Health Tips, a treatment control. Outcomes were scores on the PHQ-9 and the Sheehan Disability Scale. Adherence to treatment was measured as number of times participants opened and used the apps as instructed. \n Results: We randomly assigned 211 participants to iPST, 209 to Project: EVO, and 206 to Health Tips. Among the participants, 77.0% (482/626) had a PHQ-9 score >10 (moderately depressed). Among the participants using the 2 active apps, 57.9% (243/420) did not download their assigned intervention app but did not differ demographically from those who did. Differential treatment effects were present in participants with baseline PHQ-9 score >10, with the cognitive training and problem-solving apps resulting in greater effects on mood than the information control app (χ22=6.46, P=.04). \n Conclusions: Mobile apps for depression appear to have their greatest impact on people with more moderate levels of depression. In particular, an app that is designed to engage cognitive correlates of depression had the strongest effect on depressed mood in this sample. This study suggests that mobile apps reach many people and are useful for more moderate levels of depression. \n ClinicalTrial: Clinicaltrials.gov NCT00540865; https://www.clinicaltrials.gov/ct2/show/NCT00540865 (Archived by WebCite at http://www.webcitation.org/6mj8IPqQr)',
    Consortium = 'mHealth',
    Study = 'Brighten Study',
    Diagnosis = c('control'),
    digitalAssessmentCategory = c('cognition', 'sleep', 'mood',
                                  'mobility', 'mental health'),
    sensorType = c('touchscreen'),
    synID = 'syn10848316',
    Featured = 'TRUE',
    studyOrProject = brightenurl,
    publicationType = 'study'
  ),
  
  #### Participant Retention Study
  # 1
  "Pratap_npjDigiMed_2020" = list(
    Author = c('Pratap A', 'Neto EC', 'Snyder P',
               'Stepnowsky C', 'Elhadad N', 'Grant D',
               'Mohebbi MH', 'Mooney S', 'Suver C',
               'Wilbanks J', 'Mangravite L'),
    Title = 'Indicators of retention in remote digital health studies: a cross-study evaluation of 100,000 participants',
    Journal = 'npj Digital Medicine',
    PMID = '32128451',
    ISSN = '2398-6352',
    Year = as.integer(2020),
    doi = '10.1038/s41746-020-0224-8',
    url = 'https://doi.org/10.1038/s41746-020-0224-8',
    Abstract = 'Digital technologies such as smartphones are transforming the way scientists conduct biomedical research. Several remotely conducted studies have recruited thousands of participants over a span of a few months allowing researchers to collect real-world data at scale and at a fraction of the cost of traditional research. Unfortunately, remote studies have been hampered by substantial participant attrition, calling into question the representativeness of the collected data including generalizability of outcomes. We report the findings regarding recruitment and retention from eight remote digital health studies conducted between 2014-2019 that provided individual-level study-app usage data from more than 100,000 participants completing nearly 3.5 million remote health evaluations over cumulative participation of 850,000 days. Median participant retention across eight studies varied widely from 2-26 days (median across all studies = 5.5 days). Survival analysis revealed several factors significantly associated with increase in participant retention time, including (i) referral by a clinician to the study (increase of 40 days in median retention time); (ii) compensation for participation (increase of 22 days, 1 study); (iii) having the clinical condition of interest in the study (increase of 7 days compared with controls); and (iv) older age (increase of 4 days). Additionally, four distinct patterns of daily app usage behavior were identified by unsupervised clustering, which were also associated with participant demographics. Most studies were not able to recruit a sample that was representative of the race/ethnicity or geographical diversity of the US. Together these findings can help inform recruitment and retention strategies to enable equitable participation of populations in future digital health research.',
    Consortium = 'mHealth',
    Study = 'Participant Retention in Digital Health Studies',
    Diagnosis = c('depression', 'endometriosis', 'Multiple sclerosis', "Parkinson's disease", 'sleep related disorder', "control"),
    digitalAssessmentCategory = c('participant engagement'),
    # sensorType = c(''),
    synID = 'syn20715364',
    Featured = 'TRUE',
    studyOrProject = participantretentionurl,
    publicationType = 'project'
  ),
  
  #### Parkinsons Disease Digital Biomarker DREAM Challenge 
  # 1
  "Sieberts_bioarXiv_2020" = list(
    Author = c('Sieberts SK', 'Schaff J', 'Duda M',
               'Pataki BÁ', 'Sun M', 'Snyder P',
               'Daneault JF', 'Parisi F', 'Costante G',
               'Rubin U', 'Banda P', 'Chae Y',
               'Neto EC', 'Dorsey ER', 'Aydın Z',
               'Chen A', 'Elo LL', 'Espino C',
               'Glaab E', 'Goan E', 'Golabchi FN',
               'Gormez Y', 'Jaakkola MK', 'Jonnagaddala J',
               'Klen R', 'Li D', 'McDaniel C',
               'Perrin D', 'Perumal TM', 'Rad NM',
               'Rainaldi E', 'Sapienza S', 'Schwab P',
               'Shokhirev N', 'Venalainen MS', 'Vergara-Diaz G',
               'Zhang Y', 'Wang Y', 'Guan Y',
               'Brunner D', 'Bonato P', 'Mangravite LM',
               'Omberg L'),
    Title = 'Crowdsourcing digital health measures to predict Parkinson’s disease severity: the Parkinson’s Disease Digital Biomarker DREAM Challenge',
    Journal = 'bioarXiv',
    # PMID = '',
    # ISSN = '',
    Year = as.integer(2020),
    doi = '10.1101/2020.01.13.904722',
    url = 'https://doi.org/10.1101/2020.01.13.904722',
    Abstract = 'Mobile health, the collection of data using wearables and sensors, is a rapidly growing field in health research with many applications. Deriving validated measures of disease and severity that can be used clinically or as outcome measures in clinical trials, referred to as digital biomarkers, has proven difficult. In part due to the complicated analytical approaches necessary to develop these metrics. Here we describe the use of crowdsourcing to specifically evaluate and benchmark features derived from accelerometer and gyroscope data in two different datasets to predict the presence of Parkinson’s Disease (PD) and severity of three PD symptoms: tremor, dyskinesia and bradykinesia. Forty teams from around the world submitted features, and achieved drastically improved predictive performance for PD status (best AUROC=0.87), as well as tremor (best AUPR=0.75), dyskinesia (best AUPR=0.48) and bradykinesia (best AUPR=0.95) severity.',
    Consortium = 'mHealth',
    Study = 'Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge',
    Diagnosis = c("Parkinson's disease", "control"),
    digitalAssessmentCategory = c('resting tremor', 'action tremor', 'gait'),
    sensorType = c('accelerometer', 'gyroscope'),
    synID = 'syn8717496',
    Featured = 'TRUE',
    studyOrProject = pddbdreamurl,
    publicationType = 'project'
  ),
  
  #### mHealthtools 
  # 1
  "Snyder_JOSS_2020" = list(
    Author = c('Snyder P', 'Tummalacherla M', 'Perumal T', 'Omberg L'),
    Title = 'mhealthtools: A Modular R Package for Extracting Features from Mobile and Wearable Sensor Data',
    Journal = 'Journal of Open Source Software',
    # PMID = '',
    ISSN = '2475-9066',
    Year = as.integer(2020),
    doi = '10.21105/joss.02106',
    url = 'https://doi.org/10.21105/joss.02106',
    # Abstract = '',
    Consortium = 'mHealth',
    Tools = 'mhealthtools',
    # Diagnosis = '',
    # digitalAssessmentCategory = '',
    sensorType = c('accelerometer', 'gyroscope', 'camera', 'touchscreen'),
    # synID = '',
    Featured = 'TRUE', 
    publicationType = 'tool'
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
