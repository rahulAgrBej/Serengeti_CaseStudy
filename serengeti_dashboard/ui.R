library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview'),
    menuItem('Scatterplot'),
    menuItem('Boxplot'),
    menuItem('Daily Activity'),
    menuItem('Annual Activity'),
    menuItem('Spatial Distribution')
  )
)

dashboardPage(
  dashboardHeader(title='Serengeti Case Study'),
  sidebar,
  dashboardBody()
)