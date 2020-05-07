
########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Projects
# Author: Solly Sieberts
# email: solly.sieberts@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## Projects are analyses of one or more studies. Studies are annotated in
# projectStudyLevelAnnotations.R.
## To successfully run this code, you need write permissions to all the following
# mhealth projects
## All projects have a template annotation list assigned. Any annotation classes 
# from that list can be edited/removed. 

### To-Dos(continous update):
## Keep the Excel sheet of all metadata possibilities for each metadata type
# For eg., sensor - accelerometer, PPG, gyroscope, camera, touchscreen etc.,

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
## Parkinsons Disease Digital Biomarker DREAM Challenge 
'syn8717496' = list(consortium = 'mHealth',
                    study = 'Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge',
                    dataCollectionMethod= c('active', 'patient reported outcome', 'clinical assessment'),
                    deviceType = c('handheld', 'wearable'),
                    sensorType = c('accelerometer', 'gyroscope'),
                    devicePlatform = c('GENEActiv', 'Pebble OS', 'iOS'), 
                    deviceLocation = c('wrist', 'pocket'),
                    diagnosis=  c("Parkinson's Disease", "Control"), 
                    reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia',
                                      'medication report'),
                    digitalAssessmentCategory= c('resting tremor', 'action tremor', 'gait'),
                    digitalAssessmentDetails = c('walking (flat)', 
                                                 'standing', 'alternating hand movements', 
                                                 'opening a water bottle and pouring', 
                                                 'arranging paper','assembling nuts and bolts',
                                                 'folding towels'),
                    investigator= '',
                    resourceType = c('analysis', 'challenge'),
                    keywords = c('neurodegeneration', 'neurology', "Parkinson's", 'DREAM Challenge'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn22017473', 
                    dataUsed = c('syn20681023', 'syn4993293'),
                    studyDescription = "The Parkinson’s Disease Digital Biomarker DREAM Challenge was a first of it's kind challenge, designed to benchmark methods for the processing of sensor data for development of digital signatures reflective of Parkinson's Disease.",
                    dataAccessInstructions = '',
                    isDHProject='TRUE')
)



##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations

for(projects in names(projects.annotations)){
  
  #### Uncomment this before updating for real
  synSetAnnotations(projects, annotations = projects.annotations[[projects]])
  ####
  
  print(projects)
  print(projects.annotations[[projects]])
}

