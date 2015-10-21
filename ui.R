library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Coin Flip Test"),
  sidebarPanel(
    sliderInput(inputId = "numberOfFlips", label = "How many times do you want to flip?", value =  10, min = 1, max = 100, step = 1),
    p("Move the slider in order to set the number of flips for the experiment. Under the results, 1 corresponds to heads and 0 to tails."),
    p("The confidence interval is based on the frequently used normal approximation.")
    ),
  mainPanel(
    h3("Result"),
    h4("You got following result"),
    verbatimTextOutput("resultVector"),
    h4("Corresponding to following percent heads:"),
    verbatimTextOutput("resultEstimatedProb"),
    h4("95% confidense interval for a fair coin is:"),
    verbatimTextOutput("resultConfInt"),
    h4("So can this, statistically, be considered a fair coin? Answer:"),
    verbatimTextOutput("resultInConfInt")
    )
  ))