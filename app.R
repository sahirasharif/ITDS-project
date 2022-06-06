#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

unilist<-read.csv("C:/Users/iyani/OneDrive/Documents/List_Uni(TRIAL2).csv", header = TRUE)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("University Finder"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          selectInput("type",label =  "Type of university:",
                      c("Private"="Private",
                        "Public" = "Public"
                        )),
          selectInput("major",label = "Which major you want:",
                      c("Accounting"="Accounting",
                        "Computer Science"="Computer.Science",
                        "Engineering"="Engineering",
                        "Education"="Education",
                        "Architecture"="Architecture",
                        "Business"="Business",
                        "Language"="Language",
                        "Islamic studies"="Islamic.studies",
                        "Shariah and Law"="Shariah.and.Law",
                        "Dental"="Dental",
                        "Medic"="Medic",
                        "Nursing"="Nursing",
                        "Health"="Health",
                        "Economy"="Economy",
                        "Science"="Science",
                        "Pharmacy"="Pharmacy",
                        "Fine Arts"="Fine.Arts",
                        "Food"="Food",
                        "Optometry"="Optometry",
                        "Nutrition"="Nutrition",
                        "Forensic Science"="Forensic.Science",
                        "Counselling"="Counselling",
                        "Finance"="Finance",
                        "Social Science"="Social.Science")),
          #selectInput("fee",label = "Fees:",
                      #c("less than RM10000"="<10000",
                        #"RM10000-RM20000"="middle",
                        #"more than RM20000"=">20000",
                        #"do not care"="all")),
          selectInput("state1",label = "Which state you prefer the most:",
                      c("Johor"="Johor",
                        "Kedah"="Kedah",
                        "Kelantan"="Kelantan",
                        "Malacca"="Melaka",
                        "Negeri Sembilan"="Negeri Sembilan",
                        "Pahang"="Pahang",
                        "Pulau Pinang"="Pulau Pinang",
                        "Perak"="Perak",
                        "Perlis"="Perlis",
                        "Sabah"="Sabah",
                        "Sarawak"="Sarawak",
                        "Selangor"="Selangor",
                        "Terengganu"="Terengganu",
                        "Kuala Lumpur"="Kuala Lumpur",
                        "Labuan"="Labuan",
                        "Putrajaya"="Putrajaya")),
          selectInput("state2",label = "Which state you second prefer:",
                      c("Johor"="Johor",
                        "Kedah"="Kedah",
                        "Kelantan"="Kelantan",
                        "Malacca"="Melaka",
                        "Negeri Sembilan"="Negeri Sembilan",
                        "Pahang"="Pahang",
                        "Pulau Pinang"="Pulau Pinang",
                        "Perak"="Perak",
                        "Perlis"="Perlis",
                        "Sabah"="Sabah",
                        "Sarawak"="Sarawak",
                        "Selangor"="Selangor",
                        "Terengganu"="Terengganu",
                        "Kuala Lumpur"="Kuala Lumpur",
                        "Labuan"="Labuan",
                        "Putrajaya"="Putrajaya")),
          #submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          h6(
            p("US News College Rankings from ",
              a("US News",
                href = "https://www.usnews.com/best-colleges/rankings"))),
           h2("University that suitable for you is:"),
           dataTableOutput("table")
        )
    )
)
fee<-function(df,range){
  if(range=="<1000"){
    step4<-filter(df,Fee.<9999L)
  }else if(range=="middle"){
    step4<-filter(df,Fee>9999L,Fee<19999L)
  }else if(range==">20000"){
    step4<-filter(df,Fee>20000L)
  }else if(range=="all"){
    step4<-df
  }
  step4
}
# Define server logic required to draw a histogram
server <- function(input, output) {
  library(dplyr)
  
    output$table<-renderDataTable({
      step1<-filter(unilist,Type==input$type)
      step2<-select(step1,"Name","Location","Type","Fee", input$major)
      step3<-filter(step2,Location == input$state1 | Location == input$state2)
      step4<-filter(step3, step3[,input$major]==1)
      step5<-select(step4,"Name","Location","Type","Fee")
      step5
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
