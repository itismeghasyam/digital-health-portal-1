########################################################################
# Digital Health Portal
# Purpose: To collate all Annotation Key value the Digital Health Portal(studies, projects, data, tool)
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# Required functions
##############
getAnnotations <- function(keyColumn, key, keyType){
  # keyType is either a LIST type column or NOTLIST
  if(keyType == 'LIST'){
    current.anno <- lapply(keyColumn, function(x){
      x <- gsub('"','',x)
      x_len <- stringr::str_length(x)
      x <- substr(x,2,x_len-1)
      x <- strsplit(x,',') %>% unlist()
      return(x)
    })
  }else{
    current.anno <- keyColumn
  }
  
  current.anno <- current.anno %>% 
    unlist() %>% 
    unique()
  
  # current.anno.dat <- data.frame(key = rep(key, length(current.anno)),
  #                                value = current.anno)
  
  return(current.anno)
  
}

getAnnotationsFromFileView <- function(fileViewDat){
  
  # initialization
  annotations.key.value.list <- list()
  for(key in colnames(fileViewDat)){
    
    if(key %in% string_list.columns){
      keyType = 'LIST'
    }else{
      keyType = 'NOTLIST'
    }
    
    keyColumn <- fileViewDat[[key]]
    
    current.annotation <- getAnnotations(keyColumn, key, keyType)
    
    
    if(is.null(annotations.key.value.list[[key]])){
      annotations.key.value.list[[key]] <- current.annotation %>% unique() %>% as.list()
    }else{
      annotations.key.value.list[[key]] <- c(annotations.key.value.list[[key]],
                                             current.annotation) %>% unique()
    }
    
  }
  
  # Merge a list of values for a given key into a string
  for(key in names(annotations.key.value.list)){
    annotations.key.value.list[[key]] <- as.data.frame(annotations.key.value.list[[key]]) %>%
      t() %>% as.data.frame()
  }
  
  # Make a table out of the previous list
  annotations.key.value.tbl <- annotations.key.value.list %>% 
    data.table::rbindlist(use.names = T, idcol = T, fill = T) %>% 
    `colnames<-`(c('key','val')) %>% 
    dplyr::filter(!val == '') # remove empty fields
  
  return(annotations.key.value.tbl)
}

##############
# STRING_LIST columns
##############
# list of all string list columns since they need to be parsed differently
string_list.columns <- c(
  ## Study-Project Fileview
  'diagnosis',
  'deviceType',
  'sensorType',
  'dataCollectionMethod',
  'devicePlatform',
  'deviceLocation',
  'reportedOutcome',
  'digitalAssessmentCategory',
  'dataUsed',
  'digitalAssessmentDetails',
  'investigator',
  'keywords',
  'resourceType',
  'sensorDataType',
  
  ## Data FileView
  'dataType',
  'dataSubtype',
  'deviceType',
  'metadataType',
  'sensorType',
  
  ## Tools
  'inputDataType',
  'outputDataType',
  'softwareAuthor',
  'suggestedStudies'
)

##############
# Update list of Annotations (key-value pairs) 
##############  
## study-projects fileview
study.project.fileview <- synapser::synTableQuery('SELECT * FROM syn21994974')$asDataFrame() %>% 
  dplyr::select(-ROW_ID, -ROW_VERSION, -ROW_ETAG)
all.used.ids <- 'syn21994974'
study.project.anno <- getAnnotationsFromFileView(study.project.fileview)

## Data fileview
data.fileview <- synapser::synTableQuery('SELECT * FROM syn21994970')$asDataFrame() %>% 
  dplyr::select(-ROW_ID, -ROW_VERSION, -ROW_ETAG)
all.used.ids <- c(all.used.ids, 'syn21994970')
data.anno <- getAnnotationsFromFileView(data.fileview)

## Tools fileview
tools.fileview <- synapser::synTableQuery('SELECT * FROM syn22014091')$asDataFrame() %>% 
  dplyr::select(-ROW_ID, -ROW_VERSION, -ROW_ETAG)
all.used.ids <- c(all.used.ids, 'syn22014091')
tools.anno <- getAnnotationsFromFileView(tools.fileview)

# Merge all the annotations
all.anno <- rbind(rbind(study.project.anno, data.anno), tools.anno) 

##############
# Upload to Synapse
##############
# Github link
gtToken = 'github_token.txt';
githubr::setGithubToken(as.character(read.table(gtToken)$V1))
thisFileName <- 'annotationKeyValuePairs.R'
thisRepo <- getRepo(repository = "itismeghasyam/digital-health-portal", ref="branch", refName='master')
thisFile <- getPermlink(repository = thisRepo, repositoryPath=thisFileName)

# Write to Synapse
write.csv(all.anno,file = paste0('annotation_key_value_pairs','.csv'),na="")
obj = File(paste0('annotation_key_value_pairs','.csv'),
           name = paste0('annotation_key_value_pairs','.csv'),
           parentId = 'syn21574434')
obj = synStore(obj, executed = thisFile, used = all.used.ids)
