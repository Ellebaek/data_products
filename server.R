#flipCoinAndGetResultTable <- funtion(numberOfFlips) data.frame(FlipNo=seq(1,numberOfFlips), Head=rbinom(n=2, size=numberOfFlips, prob = 0.45)))

library(shiny)
shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint(input$numberOfFlips)
    x <- reactive(rbinom(n=input$numberOfFlips, size=1, prob = 0.45))
    estProb <- reactive(sum(x())/input$numberOfFlips)
    output$resultVector <- renderPrint(x())
    output$resultEstimatedProb <- renderPrint(estProb())
    ci <- reactive(0.5 + c(1,-1)*qnorm(.025)*sqrt(0.5*(1-0.5)/input$numberOfFlips))
    ci_bound <- reactive(c(max(ci()[1],0),min(ci()[2],1)))
    output$resultConfInt <- renderPrint(ci_bound())
    output$resultInConfInt <- renderPrint(estProb() >= ci_bound()[1] & estProb() <= ci_bound()[2])
  }
)