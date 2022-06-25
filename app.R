#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages('rsconnect')
library(shiny)
library(shinythemes)
#install.packages("DT")
library(DT)


unilist<-read.csv("C:\\Users\\Sahira\\Downloads\\uni_list_trial_3.csv", header = TRUE)
# Define UI for application that draws a histogram
ui <- fluidPage(
  theme=shinytheme("sandstone"),# returns URL of a shiny theme
  #themeSelector(),
  #theme = bs_theme(version = 4, bootswatch = "minty"),
  # Application title
  ##titlePanel("University Finder"),
  navbarPage(
    title="University Finder",
    id="nav",
    tabPanel("Home", value="home",
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("type",label =  "Type of university:",
                  c("Not applied"="Not applied",
                    "Private"="Private",
                    "Public" = "Public"
                  )),
      selectInput("major",label = "Which major you want:",
                  c("Not applied"="Not applied",
                    "Accounting"="Accounting",
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
      
      selectInput("state1",label = "Which state you prefer the most:",
                  c("Not applied"="Not applied",
                    "Johor"="Johor",
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
                  c("Not applied"="Not applied",
                    "Johor"="Johor",
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
                    "Putrajaya"="Putrajaya"))
      #submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h6(
        p("QS Rankings and SETARA Ratings from ",
          a("TopUniversities.com",
            href = "https://www.topuniversities.com/university-rankings/world-university-rankings/2023"))),
      h2("University that suitable for you is:"),
      tabsetPanel(type = "tabs",
                  tabPanel("Explore", DT::dataTableOutput("table")),
                  tabPanel("Visualize Data", plotOutput("plot1"),
                           textOutput("text1"),
                           plotOutput("plot2"),
                           textOutput("text2"))
      )
      
    )
  )
),
tabPanel("Guideline", fluid = TRUE,
         fluidRow(
           column(6,
                  #br(),
                  h1(p("User Manual")),
                  tags$p(HTML("1. App starts with default choices for their preferences. The list of preferences and the choices are: ")),
                  tags$ul(
                    tags$li(HTML("Type of university: Public, Private or Others.")),
                    tags$li(HTML("Preferred major: 24 majors including Accounting, Computer Science, Education and Medic.")),
                    tags$li(HTML("Preferred state: All 13 states and 3 Federal Territorries in Malaysia.")),
                    tags$li(HTML("Second preferred state: All 13 states and 3 Federal Territorries in Malaysia."))
                  ),
                  tags$p(HTML("2. Users will choose their preference in universities. There is an option \"Unimportant\" for users who do not know or do not mind for each preference.")),
                  tags$p(HTML("3. The rankings for all universities can be found at the link provided (TopUniversities.Com) on top of the page.")),
                  tags$p(HTML("4. The app will automatically list out all the available universities that is most suitable for the user.")),
                  tags$p(HTML("5. It will also automatically display two histograms to compare the ranking and fee distribution of all universities with the selected major and type")),
                  tags$p(HTML("6. Users can now choose their dream university from a much more smaller scope."))
                  #hr(),
                  
           )
         )
),
tabPanel("About", fluid = TRUE,
         fluidRow(
           column(6,
                  #br(),
                  h1(p("About the project")),
                  tags$p(HTML("It all starts with questions and problems: ")),
                  tags$ul(
                    tags$li(HTML("I'm not even sure which university to attend.")),
                    tags$li(HTML("I want to choose universities near my home that have a solid academic reputation.")),
                    tags$li(HTML("Which universities should I attend to study my desired major?"))
                    ),
                  tags$p(HTML("So, we come up with a solution.")),
                  tags$p(HTML("We want to make it easier for those who want to study in Malaysia. Specifically, SPM graduates who have recently finished from high school. As a result, we developed a platform for you that recommends the finest universities depending on your choices.")),
                  h1(p("What distinguishes us from others?")),
                  tags$ul(
                    tags$li(HTML("We visualise the statistics for the chosen major so you may choose the best from all Malaysian universities.")),
                    tags$li(HTML("We show the fees for the chosen major and type of university so that you may manage your budget.")),
                    tags$li(HTML("We compile a list of your preferences to help you choose the universities of your dreams."))
                  ),
                  tags$p(HTML("We choose the ideal option for you and your academic studies that will make you a successful person in the future.")),
                  #hr(),
                  h1(p("Data sources")),
                  tags$ul(
                    tags$li(HTML("<a href=\"https://afterschool.my/institution\">https://afterschool.my/institution</a>.")),
                    tags$li(HTML("<a href=\"https://www.topuniversities.com/university-rankings/world-university-rankings/2023\">https://www.topuniversities.com/university-rankings/world-university-rankings/2023</a>")),
                    tags$li(HTML("<a href=\"https://studymalaysia.com/education/top-stories/list-of-universities-in-malaysia\">https://studymalaysia.com/education/top-stories/list-of-universities-in-malaysia</a>"))
                  ),
                  h1(p("Github")),
                  tags$p(HTML("Source code and datasets are available at <a href=\"https://github.com/sahirasharif/IntroToDataScience-GroupProject/tree/main\">https://github.com/sahirasharif/IntroToDataScience-GroupProject/tree/main</a>."))
           )
         )
),
tabPanel("Contributors", fluid = TRUE,
         fluidRow(
           column(6,
                  #br(),
                  h2(p("Group Sophos")),
                  tags$p(HTML("Members: ")),
                  tags$ul(
                    tags$li(HTML("Ahmad Wahnan Anwar (17206102)")),
                    tags$li(HTML("Sahira Binti Sharif (U2001222)")),
                    tags$li(HTML("Nur Damia Binti Mohd Azmin (U2000935)")),
                    tags$li(HTML("Nur Izyan Binti Mohd Aris Fathillah (U2000897)"))
                  )
           )
         )
)
)
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  library(dplyr)
  
  output$table<-renderDataTable({
    if(input$type=="Not applied")
      step1<-unilist
    else
      step1<-filter(unilist,Type==input$type)
    if(input$major=="Not applied")
      step2<-step1
    else
      step2<-select(step1,"Name","Location","Type","Fee","QS.Ranking","Setara.Rating", input$major)
    if(input$state1=="Not applied")
      step3<-step2
    else{
      if(input$state2=="Not applied")
        step3<-step2
      else
        step3<-filter(step2,Location == input$state1 | Location == input$state2)
    }
    if(input$major=="Not applied")
      step4<-step3
    else
      step4<-filter(step3, step3[,input$major]==1)
    step5<-select(step4,"Name","Location","Type","Fee","QS.Ranking","Setara.Rating")
  })
  
  output$plot1 <- renderPlot({
    if(input$major=="Not applied")
      step1<-unilist
    else
      step1<-filter(unilist, unilist[,input$major]==1)
    if(input$type=="Not applied")
      step2<-step1
    else
      step2<-filter(step1,Type==input$type)
    
    hist(step2$QS.Ranking,
         main="QS Ranking of all universities with selected major and type",
         xlab="QS Ranking",
         ylab="Frequency",
         col="gold",
         breaks = 10
    )
    
    abline(v = median(step2$QS.Ranking, na.rm = TRUE),                       
           col = "red",
           lwd = 3)
    
  })
  
  output$plot2 <- renderPlot({
    if(input$major=="Not applied")
      step1<-unilist
    else
      step1<-filter(unilist, unilist[,input$major]==1)
    if(input$type=="Not applied")
      step2<-step1
    else
      step2<-filter(step1,Type==input$type)

    hist(step2$Fee,
         main="Fee distribution of all universities with selected major and type",
         xlab="Total Tuition Fee",
         ylab="Frequency",
         col="purple",
         breaks = 10)
    
    abline(v = median(step2$Fee, na.rm = TRUE),                       
           col = "red",
           lwd = 3)
    
  })
  
  output$text1 <- renderText({
    if(input$major=="Not applied")
      step1<-unilist
    else
      step1<-filter(unilist, unilist[,input$major]==1)
    if(input$type=="Not applied")
      step2<-step1
    else
      step2<-filter(step1,Type==input$type)
    paste("The median QS Ranking of all universities with selected major and type is: ", median(step2$QS.Ranking, na.rm = TRUE))
  })
  
  output$text2 <- renderText({
    if(input$major=="Not applied")
      step1<-unilist
    else
      step1<-filter(unilist, unilist[,input$major]==1)
    if(input$type=="Not applied")
      step2<-step1
    else
      step2<-filter(step1,Type==input$type)
    paste("The median Fee of all universities with selected major and type is: RM", median(step2$Fee, na.rm = TRUE))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
