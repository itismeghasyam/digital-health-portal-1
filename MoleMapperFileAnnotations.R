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

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  ## Mole images
  'syn6829811' = list(consortium = 'mHealth',
                      study = 'Mole Mapper study',
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
  
  ## Mole Measurements
  'syn6829810' = list(consortium = 'mHealth',
                      study = 'Mole Mapper study',
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
  
  ## Mole Removal indicator
  'syn6829809' = list(consortium = 'mHealth',
                      study = 'Mole Mapper study',
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
  
  ## Followup Survey
  'syn6829808' = list(consortium = 'mHealth',
                      study = 'Mole Mapper study',
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
  
  ## Baseline Demographics Survey
  'syn682907' = list(consortium = 'mHealth',
                     study = 'Mole Mapper study',
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
## NO INDIVIDUAL FILES IN THIS PROJECT ##