########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Mole Mapper Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn5576734
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

study = 'Mole Mapper Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  ## Mole images
  'syn6829811' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= '', 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen', 'camera'),
                      devicePlatform = c('iOS', 'android'), 
                      deviceLocation = c('hand'),
                      diagnosis=  c('melanoma', 'controls'), 
                      digitalAssessmentCategory= c('dermatologic phenotype'),
                      digitalAssessmentDetails = c('photograph'),
                      dataType=c('sensor'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn5576734/wiki/406009',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),
  
  ## Mole Measurements
  'syn6829810' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome'),
                      deviceType = c('handheld'),
                      sensorType = c('touchscreen'),
                      devicePlatform = c('iOS', 'android'), 
                      deviceLocation = c('hand'),
                      diagnosis=  c('melanoma', 'controls'), 
                      digitalAssessmentCategory= c('dermatologic phenotype'),
                      digitalAssessmentDetails = c('photograph'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn5576734/wiki/406009',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),
  
  ## Mole Removal indicator
  'syn6829809' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis=  c('melanoma', 'controls'), 
                      reportedOutcome = c('mole removal status'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn5576734/wiki/406009',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),
  
  ## Followup Survey
  'syn6829808' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= '', 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis=  c('melanoma', 'controls'),
                      reportedOutcome =c('followup survey'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn5576734/wiki/406009',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),
  
  ## Baseline Demographics Survey
  'syn682907' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= '', 
                     dataCollectionMethod= c('patient reported outcome'),
                     diagnosis=  c('melanoma', 'controls'), 
                     reportedOutcome =c('demographics survey'),
                     dataType=c('clinical', 'surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType = c('individual'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn5576734/wiki/406009',
                     dataAccessInstructions = 'syn5576734/wiki/391119')
  
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
## NO INDIVIDUAL FILES IN THIS PROJECT ##