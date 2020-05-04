########################################################################
# Digital Health Portal
# Purpose: To track publications in Digital Health Projects
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/1UAR0cD7TbDV_tmYnPjRUHUQFnW5q39swOIRcc2cmqJE/edit as list of publications
# Using https://sagebionetworks.jira.com/wiki/spaces/PS/pages/801538114/Publications+Schema as publication Schema Skeleton
##############
# Notes, Ideas, To-Dos
##############

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
library(githubr)
synLogin()


##############
# List of projects and related publications
##############
# Project Synapse ID vs publications
publications.list <- list(
  
  ## mPower 1.0
  # 1
  list(
    Author = 'Brian M. Bot, Christine Suver, Elias Chaibub Neto, Michael Kellen, Arno Klein, Christopher Bare, Megan Doerr, Abhishek Pratap, John Wilbanks, E. Ray Dorsey, Stephen H. Friend, Andrew D. Trister',
    Title = 'The mPower study, Parkinson disease mobile data collected using ResearchKit',
    Journal = 'Nature Scientific Data',
    PMID = '',
    Year = '2016',
    doi = '10.1038/sdata.2016.11',
    Abstract = 'Current measures of health and disease are often insensitive, episodic, and subjective. Further, these measures generally are not designed to provide meaningful feedback to individuals. The impact of high-resolution activity data collected from mobile phones is only beginning to be explored. Here we present data from mPower, a clinical observational study about Parkinson disease conducted purely through an iPhone app interface. The study interrogated aspects of this movement disorder through surveys and frequent sensor-based recordings from participants with and without Parkinson disease. Benefitting from large enrollment and repeated measurements on many individuals, these data may help establish baseline variability of real-world activity measurement collected via mobile phones, and ultimately may lead to quantification of the ebbs-and-flows of Parkinson symptoms. App source code for these data collection modules are available through an open source license for use in studies of other conditions. We hope that releasing data contributed by engaged research participants will seed a new community of analysts working collaboratively on understanding mobile health data to advance human health.',
    Keywords = '',
    Consortium = 'mHealth',
    Grant = '',
    Study = 'mPower mobile Parkinson Disease study',
    Diagnosis = "Parkinson's Disease, Control",
    Assay = '',
    DataType = '',
    ModelSystem = '',
    Datasets = '',
    Tools = '',
    Featured = T
  )
) %>% data.table::rbindlist(fill = T)

##############
# Upload to Synapse
##############
# Github link
gtToken = 'github_token.txt';
githubr::setGithubToken(as.character(read.table(gtToken)$V1))
thisFileName <- 'portalPublications.R'
thisRepo <- getRepo(repository = "itismeghasyam/digital-health-portal", ref="branch", refName='dev1')
thisFile <- getPermlink(repository = thisRepo, repositoryPath=thisFileName)

## Upload new table to Synapse
target.tbl.name <- 'Digital Health Publications'
publications.syn.new <- synapser::synBuildTable(name = target.tbl.name,
                                                parent = 'syn21574434',
                                                values = publications.list)
# no filehandleId type columns, so let Synapse decide column types by default
tbl.syn.new <- synapser::synStore(publications.syn.new)
act <- synapser::Activity(name = target.tbl.name, executed = thisFile)
synapser::synSetProvenance(tbl.syn.new, activity = act)