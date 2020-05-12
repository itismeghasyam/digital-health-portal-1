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

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Walking Activity
  'syn5511449' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                      devicePlatform = c('iOS', 'android'), 
                      deviceLocation = c('hand'),
                      diagnosis= c("Parkinson's Disease", 'Control'),
                      reportedOutcome = c('dyskinesia', 'bradykinesia', 'freezing of gait'),
                      digitalAssessmentCategory= c('gait'),
                      digitalAssessmentDetails = c('walking (flat)', 'standing'),
                      dataType=c('sensor'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType='',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/376006',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Voice Activity
  'syn5511444' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('microphone'),
                      devicePlatform = c('iOS', 'android'), 
                      deviceLocation = c('flat surface', 'hand'),
                      diagnosis= c("Parkinson's Disease", 'Control'), 
                      reportedOutcome = c('dyskinesia', 'bradykinesia', 'cognition', 'mood'),
                      digitalAssessmentCategory= c('phonation'),
                      digitalAssessmentDetails = c('talking into the microphone'),
                      dataType=c('sensor'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType='',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375988',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Tapping Activity
  'syn5511439' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen'),
                      devicePlatform = c('iOS','android'), 
                      deviceLocation = c('flat surface'),
                      diagnosis= c("Parkinson's Disease", 'Control'), 
                      reportedOutcome = c('dyskinesia', 'bradykinesia'),
                      digitalAssessmentCategory= c('tap'),
                      digitalAssessmentDetails = c('tap the screen'),
                      dataType=c('sensor'),
                      dataSubtype=c('raw','metadata'),
                      metadataType='',
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375950',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Memory Activity
  'syn5511434' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod=c('patient reported outcome'),
                      reportedOutcome = '',
                      diagnosis= c("Parkinson's Disease", 'Control'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/375909',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # PDQ8 Survey
  'syn5511433' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                      diagnosis= c("Parkinson's Disease", 'Control'), 
                      reportedOutcome = '',
                      dataType=c('surveyData'),
                      dataSubtype=c('raw','metadata'),
                      metadataType=c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/390374',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # MDS-UPDRS Survey
  'syn5511432' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                      diagnosis= c("Parkinson's Disease", 'Control'), 
                      reportedOutcome = c(''),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType=c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn4993293/wiki/390373',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # Demographics Survey
  'syn5511429' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c("Parkinson's Disease", 'Control'), 
                      reportedOutcome = c(''),
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
