########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Participant Retention Study (syn20715364)
# Author: Solveig Sieberts
# email: solly.sieberts@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn20715364
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# 
#
#

##############
# Required libraries
##############
#library(plyr)
#library(tidyverse)
library(synapser)
synLogin()


#Note that this is a project, so URL needs to reflect that
study = 'Participant Retention in Digital Health Studies'
projectlink = paste("[", study, "](/Explore/Projects/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
file.annotations = list(
  ## Brighten Engagement
  'syn20929414' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(876), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= 'depression', 
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## Brighten Metadata
  'syn20929425' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(876), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= 'depression', 
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  
  ## ElevateMS engagement data
  'syn20929415' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(605), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= c('multiple sclerosis', 'control'),
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## ElevateMS Metadata
  'syn20929426' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(605), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('multiple sclerosis', 'control'),
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  
  ## Phendo engagement data
  'syn20929423' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(7802), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= 'endometriosis', 
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## Phendo Metadata
  'syn20929437' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(7802), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= 'endometriosis', 
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
 
  ## SleepHealth engagement data
  'syn20929424' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12914), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= c('sleep related disorder', 'control'), 
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## SleepHealth Metadata
  'syn20929441' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12914), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('sleep related disorder', 'control'), 
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  
  ## START engagement data
  'syn20929421' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(42704), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= 'depression', 
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## START Metadata
  'syn20929455' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(42704), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= 'depression', 
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## mPower engagement data
  'syn20929422' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12236), 
                       dataCollectionMethod= c('patient reported outcome', 'active', 'passive'),
                       diagnosis= c("Parkinson's disease", "control"),
                       # reportedOutcome ='',
                       digitalAssessmentCategory= c('participant engagement'),
                       dataType=c('surveyData', 'sensor'),
                       dataSubtype='metadata',
                       metadataType=c('sensor', 'assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144'),
  
  ## mPower Metadata
  'syn20929429' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12236), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c("Parkinson's disease", "control"),
                       # reportedOutcome ='',
                       dataType=c('surveyData'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20715364/wiki/596145',
                       dataAccessInstructions = 'syn20715364/wiki/596144')
)  


#################
# Now set annotations
#################
for(proj.id in names(file.annotations)){
  
  #### Uncomment this before updating for real
 synSetAnnotations(proj.id, annotations = file.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(file.annotations[[proj.id]])
}

  
  
   