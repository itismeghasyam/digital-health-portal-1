########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Heart Snapshot Project (Cardio Respiratory Fitness)
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn10837149
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

##############
# List of tables and related annotations
##############
tables.annotations = list(

  ## spectrocolorimetry.csv
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## CRF_HR_validation_questions
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Heart Rate Measurement
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.activities
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart-intraday
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.summary
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Cardio 12MT-v5
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Background Survey
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Cardio Stress Test
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Demographics
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Burden Scale
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Cardio Stair Step
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Usability Scale
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## crf-module-status
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Health Data Summary Table
  '' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = '')
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
# Should we include the following?
# - Analysis?
# - Features?