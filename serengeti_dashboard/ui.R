library(shiny)
library(shinydashboard)
library(shinyWidgets)

source('overviewUI.R')
source('scatterUI.R')
source('violinUI.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Scatterplot', tabName='scatterplot'),
    menuItem('Boxplot'),
    menuItem('Daily Activity', tabName='violinplot'),
    menuItem('Annual Activity'),
    menuItem('Spatial Distribution')
  )
)

body <- dashboardBody(
  
  # start of tabs
  tabItems(
    overviewTab,
    scatterplotTab,
    violinplotTab
  )
  
  # end of body
)

dashboardPage(
  dashboardHeader(title='Serengeti Case Study'),
  sidebar,
  body
)