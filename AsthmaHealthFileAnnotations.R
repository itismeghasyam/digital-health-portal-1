########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Asthma Health Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn8361748
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'Asthma Mobile Health Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  # Participant 3 Digit Zip
  'syn9993530' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(1959), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'),
                      reportedOutcome = c('ZIP code'),
                      dataType=c('surveyData'),
                      dataSubtype=c('metadata'),
                      metadataType='individual',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444701',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # About You Survey
  'syn8466446' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(3728), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('demographics survey'),
                      dataType=c('clinical', 'surveyData'),
                      dataSubtype=c('metadata'),
                      metadataType='individual',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444696',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Asthma History Survey
  'syn8466443' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(5476), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('medical history'),
                      dataType=c('clinical', 'surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444695',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Asthma Medication Survey
  'syn8466442' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(5174), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('medication report'),
                      dataType=c('clinical', 'surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444694',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Daily Prompt Survey
  'syn8466439' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(5286), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('asthma symptoms', 'asthma triggers'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444697',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Demographics Survey
  'syn8466435' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(2593), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('demographics survey'),
                      dataType=c('surveyData'),
                      dataSubtype=c('metadata'),
                      metadataType = c('individual'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444691',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # EQ5D Survey
  'syn8466434' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(3445), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('EQ-5D'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444699',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Medical History Survey
  'syn8466433' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(3251), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('medical history'),
                      dataType=c('clinical','surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444693',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Milestone Survey
  'syn8466432' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(212), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('asthma symptoms', 'asthma management'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType = c('individual'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444700',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Weekly Prompt Survey
  'syn8466431' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(2449), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('asthma symptoms', 'asthma management'),
                      dataType=c('clinical','surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444698',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  # Your Asthma Survey
  'syn8466429' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(3849), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c('asthma'), 
                      reportedOutcome = c('asthma triggers', 'asthma management'),
                      dataType=c('clinical','surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8361748/wiki/444692',
                      dataAccessInstructions = 'syn8361748/wiki/415364')
)

#################
# Now set annotations
#################
projects.list =  names(tables.annotations)
for(proj.id in projects.list){
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}

##################
# Set annotations of individual files
##################
## There are NO INDIVIDUAL FILES in this study