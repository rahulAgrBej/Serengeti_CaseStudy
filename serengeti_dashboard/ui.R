library(shiny)
library(shinydashboard)

source('overview.R')
source('scatterplot.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Scatterplot', tabName='scatterplot'),
    menuItem('Boxplot'),
    menuItem('Daily Activity'),
    menuItem('Annual Activity'),
    menuItem('Spatial Distribution')
  )
)

body <- dashboardBody(
  
  # start of tabs
  tabItems(
    overviewTab,
    scatterplotTab
  )
  
  # end of body
)

dashboardPage(
  dashboardHeader(title='Serengeti Case Study'),
  sidebar,
  body
)