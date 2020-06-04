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

study = 'Heart Snapshot Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  ## spectrocolorimetry.tsv
  'syn21525189' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'), # clinician reported outcome? RA is recording
                       deviceType = c('handheld'),
                       sensorType = c('spectrocolorimeter'), 
                       devicePlatform = c('pantone'), 
                       deviceLocation = c('face', 'finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('skintone'),
                       digitalAssessmentDetails = c('facial skin color',
                                                    'finger skin color'),
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype= c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## CRF_HR_validation_questions
  'syn17009128' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('pulse oximeter'),
                       sensorType = c('photodetector'),
                       devicePlatform = c('windows'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Heart Rate Measurement
  'syn17007713' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.activities
  'syn11801478' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor', 'accelerometer', 'gyroscope'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart
  'syn11673534' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart-intraday
  'syn11673533' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.summary
  'syn11672591' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c('daily physical activity'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio 12MT-v5
  'syn11665074' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respitatory fitness'),
                       digitalAssessmentDetails = c('12-Min Run test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType = c('assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stress Test
  'syn11580624' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respiratory fitness'),
                       digitalAssessmentDetails = c('treadmill stresstest'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Background Survey
  'syn11460545' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Demographics
  'syn11450273' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Burden Scale - won't be release outside
  'syn11450272' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType= c('individual', 'assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stair Step - update
  'syn11432994' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respiratory fitness'),
                       digitalAssessmentDetails = c('tecumseh test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Usability Scale - won't be released outside
  'syn11388841' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType= c('individual', 'assessment'),
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