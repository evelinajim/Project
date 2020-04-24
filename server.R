# Eve Jimenez

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(dplyr)
library(datasets)

# Define a server for the Shiny app
function(input, output,session) {

  updateSelectInput(session,'name', "Name:",
                    choices=possibleNames)

  
  updateSliderInput(session,'year','Year:',
                    value=possibleYear)
  
  
  # Fill in the spot we created for a plot
  output$babyPlot <- renderPlot({
    
    df <- babyNames %>% filter(name == input$name) %>% 
      group_by(year) %>% summarise(n = sum(count))
    
    main <- paste0("Frequency of babies named '", input$name, "' over time")
    barplot(df$n, names.arg = df$year, col = "lightblue", 
            xlab = 'Year', ylab = "Frequency", 
            main = main, axis.lty = 1)
    
  })
  
  
  #  (3) Displays when that name was most popular, in the following 
  #      format: "The most popular year for Garrett was 2000, when
  #      "5840 babies were named Garrett"
  
  
  output$maxText <- renderText ({
    df <- babyNames %>% filter(name == input$name) %>% 
      group_by(year) %>% summarise(n = sum(count))
    
    
    w <- which.max(df$n)
    yearBest <- df$year[w]
    
    # what was the frequency in the most popular year?
    m <- max(df$n)
    
    paste("The most popular year for", input$name, 
          "was", yearBest, "when", m, 
          "babies were named",input$name,".")
  })
  

  output$mostCommonName <- renderText ({
    df <- babyNames %>% filter(year == input$year) %>% 
      group_by(name) %>% summarise(n = sum(count)) 
  
    orderData <- df[order(df$n),]
    mostNames <- tail(orderData$name)
    stringTogether <- paste(mostNames,collapse=' ')
    
    paste("The most common names used in", 
          input$year, "are the following:",stringTogether)
  })
  
  
}



