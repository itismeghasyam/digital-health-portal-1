########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in mPower 1.0 Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn4993293
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# Did not include annotations for Sample Data files, as these should be excluded from the Portal
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'mPower Mobile Parkinson Disease Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Walking Activity
  'syn5511449' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 3101, 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                      devicePlatform = c('iOS'), 
                      deviceLocation = c('hand', 'pocket'),
                      diagnosis= c("Parkinson's Disease", 'control'),
                      reportedOutcome = c('medication intake'),
                      digitalAssessmentCategory= c('gait'),
                      digitalAssessmentDetails = c('walking (flat)', 'standing'),
                      dataType=c('sensor', 'surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/376006',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Voice Activity
  'syn5511444' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 5826, 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('microphone'),
                      devicePlatform = c('iOS'), 
                      deviceLocation = c('flat surface', 'hand'),
                      diagnosis= c("Parkinson's Disease", 'control'), 
                      reportedOutcome = c('medication intake'),
                      digitalAssessmentCategory= c('phonation'),
                      digitalAssessmentDetails = c('phonation'),
                      dataType=c('sensor', 'surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType='assessment',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375988',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Tapping Activity
  'syn5511439' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 8003, 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen'),
                      devicePlatform = c('iOS'), 
                      deviceLocation = c('flat surface'),
                      diagnosis= c("Parkinson's Disease", 'control'), 
                      reportedOutcome = c('medication intake'),
                      digitalAssessmentCategory= c('motor coordination'),
                      digitalAssessmentDetails = c('tapping'),
                      dataType=c('sensor', 'surveyData'),
                      dataSubtype=c('raw','metadata'),
                      metadataType='assessment',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375950',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Memory Activity
  'syn5511434' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 968, 
                      dataCollectionMethod=c('active'),
                      reportedOutcome = 'medication intake',
                      digitalAssessmentCategory= c('cognition'),
                      digitalAssessmentDetails = c('matching tiles'),
                      diagnosis= c("Parkinson's Disease", 'control'),
                      reportedOutcome = c('medication intake'),
                      dataType=c('surveyData'),
                      dataSubtype=c('processed', 'metadata'),
                      metadataType= c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375909',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # PDQ8 Survey
  'syn5511433' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 1334, 
                      dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                      diagnosis= c("Parkinson's Disease", 'control'), 
                      reportedOutcome = 'PDQ-8',
                      dataType=c('surveyData'),
                      dataSubtype=c('raw','metadata'),
                      metadataType=c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/390374',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # MDS-UPDRS Survey
  'syn5511432' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 2024, 
                      dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                      diagnosis= c("Parkinson's Disease", 'control'), 
                      reportedOutcome = c('MDS-UPDRS'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType=c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/390373',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Demographics Survey
  'syn5511429' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= 6805, 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c("Parkinson's Disease", 'control'), 
                      reportedOutcome = c('demographics survey'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('individual'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/390372',
                      dataAccessInstructions = 'syn4993293/wiki/247860')
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
## There are 4 folders here
# - featureExtraction
# - figures
# - mpowerVideos
# - myThoughts
# Which of these folders (and files inside them) should be considered for annotation??
