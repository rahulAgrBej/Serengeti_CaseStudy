library(shiny)
library(shinydashboard)
library(shinyWidgets)

#source('overviewUI.R')
#source('scatterUI.R')
#source('violinUI.R')
#source('boxplotUI.R')
#source('barUI.R')
#source('histoUI.R')
source('annualUI.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Bar Chart Plot', tabName='barplot'),
    menuItem('Histograms', tabName='histoplot'),
    menuItem('Scatterplot', tabName='scatterplot'),
    menuItem('Boxplot', tabName='boxplot'),
    menuItem('Daily Activity', tabName='violinplot'),
    menuItem('Annual Activity', tabName='annualplot'),
    menuItem('Spatial Distribution')
  )
)

body <- dashboardBody(
  
  # start of tabs
  tabItems(
    #overviewTab,
    #barTab,
    #histoTab,
    #scatterplotTab,
    #boxplotTab,
    #violinplotTab,
    annualplotTab
  )
  
  # end of body
)

dashboardPage(
  dashboardHeader(title='Serengeti Case Study'),
  sidebar,
  body
)