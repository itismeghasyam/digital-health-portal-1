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
  
  ## spectrocolorimetry.tsv
  'syn21525189' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'), # clinician reported outcome? RA is recording
                       deviceType = c('handheld'),
                       sensorType = c('spectrocolorimeter'), # or spectrophotometer?
                       devicePlatform = c('windows', 'macOS'), # spectrocolorimeter software
                       deviceLocation = c('face'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('skintone'),
                       digitalAssessmentDetails = c('measure skin color on various parts of the face'),
                       dataType= c('sensor'),
                       dataSubtype= c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## CRF_HR_validation_questions
  'syn17009128' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('pulse oximeter'),
                       sensorType = c('photodetector'),
                       devicePlatform = c('windows'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('measure heart rate from index finger using pulse ox'),
                       dataType=c('raw'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Heart Rate Measurement
  'syn17007713' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand'), #finger?
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heart rate'),
                       digitalAssessmentDetails = c('place finger against flash to measure heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.activities
  'syn11801478' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart
  'syn11673534' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('camera'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('passive heartrate recording through wearable'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart-intraday
  'syn11673533' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('camera'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('passive heartrate recording through wearable'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.summary
  'syn11672591' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('camera'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c('active time', 'distance covered'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio 12MT-v5
  'syn11665074' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('place finger against flash to measure heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stress Test
  'syn11580624' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand'),
                       diagnosis= c('Control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('place finger against flash to measure heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Background Survey
  'syn11460545' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c('patient reported outcome'),
            diagnosis= c('Control'), 
            reportedOutcome = '',
            dataType=c('surveyData'),
            dataSubtype=c('raw', 'metadata'),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Demographics
  'syn11450273' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c('patient reported outcome'),
            diagnosis= c('Control'), 
            reportedOutcome = '',
            dataType=c('surveyData'),
            dataSubtype=c('raw', 'metadata'),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Burden Scale
  'syn11450272' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stair Step
  'syn11432994' = list(consortium = 'mHealth',
            study = 'Heart Snapshot Study',
            numberParticipants= '', 
            dataCollectionMethod= c('active'),
            deviceType = c('handheld'),
            sensorType = c('camera'),
            devicePlatform = c('iOS', 'android'), 
            deviceLocation = c('hand'),
            diagnosis= c('Control'), 
            digitalAssessmentCategory= c('heartrate'),
            digitalAssessmentDetails = c('place finger against flash to measure heart rate'),
            dataType=c('sensor'),
            dataSubtype=c('raw', 'processed', 'metadata'),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Usability Scale
  'syn11388841' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
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