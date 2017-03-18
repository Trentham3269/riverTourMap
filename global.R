library(leaflet)     # js mapping
library(readr)       # fast I/O
library(shiny)       # web framework
library(shinythemes) # free bootstrap themes from bootswatch.com

# Import csv file 
shows <- read_csv("data/shows.csv")