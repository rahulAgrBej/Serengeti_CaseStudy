library(shiny)
library(shinydashboard)

source('overview.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Scatterplot'),
    menuItem('Boxplot'),
    menuItem('Daily Activity'),
    menuItem('Annual Activity'),
    menuItem('Spatial Distribution')
  )
)

body <- dashboardBody(
  
  # start of tabs
  tabItems(
    overviewTab
  )
  
  # end of body
)

dashboardPage(
  dashboardHeader(title='Serengeti Case Study'),
  sidebar,
  body
)