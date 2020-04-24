# Eve Jimenez

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Use a fluid Bootstrap layout
fluidPage(

  # Give the page a title
  titlePanel("Popular baby names over time by Eve Jimenez"),

  # Generate a row with a sidebar
  sidebarLayout(

    # Define the sidebar with one input
    sidebarPanel(
      selectInput("name", "Name:",
                  choices=NULL),
      
      #(4) Allows a user to select a year between 1880 and 2017,
      #      using a slider (https://shiny.rstudio.com/articles/sliders.html)
      #      and displays the most common name for males and females
      sliderInput("year", "Year:",
                  min = 1880, max = 2017,
                  value = 1880),

      hr(),
      
      # TO DO: display 'Source:' in blue on the same line as the helpText
      helpText("The babyNames dataset comes from the Social Security Administration")
      
    ),
      
    # Create a spot for the barplot
    mainPanel(
      plotOutput("babyPlot"),
      verbatimTextOutput("maxText"),
      verbatimTextOutput("mostCommonName")
    )

  )
)

