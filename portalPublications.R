########################################################################
# Digital Health Portal
# Purpose: To track publications in Digital Health Projects
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/1UAR0cD7TbDV_tmYnPjRUHUQFnW5q39swOIRcc2cmqJE/edit as list of publications
# Using https://sagebionetworks.jira.com/wiki/spaces/PS/pages/801538114/Publications+Schema as publication Schema Skeleton
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to the Digital Health Portal Backend (syn21574434)
#  Publications live in folder syn22014192

##############
# Required libraries
##############
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# Global parameters
##############
pid <- 'syn22014192'

##############
# List of projects and related publications
##############
# Project Synapse ID vs publications
publications.list <- list(
  
  ## mPower 1.0
  # 1
  "Bot_NatSciData_2016" = list(
    Author = 'Brian M. Bot, Christine Suver, Elias Chaibub Neto, Michael Kellen, Arno Klein, Christopher Bare, Megan Doerr, Abhishek Pratap, John Wilbanks, E. Ray Dorsey, Stephen H. Friend, Andrew D. Trister',
    Title = 'The mPower study, Parkinson disease mobile data collected using ResearchKit',
    Journal = 'Nature Scientific Data',
    PMID = '',
    Year = '2016',
    doi = '10.1038/sdata.2016.11',
    # Abstract = 'Current measures of health and disease are often insensitive, episodic, and subjective. Further, these measures generally are not designed to provide meaningful feedback to individuals. The impact of high-resolution activity data collected from mobile phones is only beginning to be explored. Here we present data from mPower, a clinical observational study about Parkinson disease conducted purely through an iPhone app interface. The study interrogated aspects of this movement disorder through surveys and frequent sensor-based recordings from participants with and without Parkinson disease. Benefitting from large enrollment and repeated measurements on many individuals, these data may help establish baseline variability of real-world activity measurement collected via mobile phones, and ultimately may lead to quantification of the ebbs-and-flows of Parkinson symptoms. App source code for these data collection modules are available through an open source license for use in studies of other conditions. We hope that releasing data contributed by engaged research participants will seed a new community of analysts working collaboratively on understanding mobile health data to advance human health.',
    Keywords = '',
    Consortium = 'mHealth',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = c("Parkinson's Disease, Control"),
    digitalAssessmentCategory = '',
    sensorType = '',
    synID = 'syn4993293',
    Featured = 'TRUE',
    url = 'https://doi.org/10.1038/sdata.2016.11'
  )
  
)
##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations
publications.names <- names(publications.list) 
for(publication in publications.names){
  
  publication_entity = File(path=publications.list[[publication]]$url,
                            name=publication,
                            parent=pid,
                            synapseStore=F)
  publication_entity = synStore(publication_entity, forceVersion=F)
  
  #### Uncomment this before updating for real
  synSetAnnotations(publication_entity$properties$id,
                    annotations = publications.list[[publication]])
  ####
  
  print(publication)
  print(publications.list[[publication]])
}
