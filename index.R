library(shiny)
library(bs4Dash)
library(plotly)

ui <- dashboardPage(
  title = "Aswin VM - Data Engineer",
  
  header = dashboardHeader(
    title = dashboardBrand(
      title = "Aswin VM",
      color = "primary",
      href = "#",
      image = NULL 
    )
  ),
  
  sidebar = dashboardSidebar(
    skin = "light",
    sidebarMenu(
      menuItem("Summary", tabName = "summary", icon = icon("user")),
      menuItem("Skills", tabName = "skills", icon = icon("cogs")),
      menuItem("Experience", tabName = "experience", icon = icon("briefcase")),
      menuItem("Projects", tabName = "projects", icon = icon("project-diagram")),
      menuItem("Education", tabName = "education", icon = icon("graduation-cap")),
      menuItem("Certifications", tabName = "certifications", icon = icon("certificate")),
      menuItem("Download CV", tabName = "download", icon = icon("download"))
    )
  ),
  
  body = dashboardBody(
    tabItems(
      # --- Summary ---
      tabItem(tabName = "summary",
              fluidRow(
                bs4Card(
                  title = "Profile",
                  status = "primary", solidHeader = TRUE, width = 12,
                  "Results-driven Data Engineer with 3+ years’ experience in ETL, data warehousing, 
             and workflow automation. Skilled in Python, SQL, Airflow, and BI tools."
                )
              )
      ),
      
      # --- Skills ---
      tabItem(tabName = "skills",
              fluidRow(
                bs4Card(
                  title = "Technical Skills",
                  width = 6, status = "info", solidHeader = TRUE,
                  "Python, SQL, Airflow, Snowflake, Docker, AWS, Power BI, Shiny"
                ),
                bs4Card(
                  title = "Skill Proficiency",
                  width = 6, status = "info", solidHeader = TRUE,
                  plotlyOutput("skillPlot")
                )
              )
      ),
      
      # --- Experience ---
      tabItem(tabName = "experience",
              fluidRow(
                bs4Card(
                  title = "Professional Experience",
                  width = 12, status = "success", solidHeader = TRUE,
                  h4("Neuome Technologies (2023–2025)"),
                  tags$ul(
                    tags$li("Built Python-based ETL pipelines with Snowflake, improving biomedical data accuracy by 35%."),
                    tags$li("Automated anomaly detection with Airflow, reducing manual monitoring by 40%.")
                  ),
                  h4("Nelise Consultancy (2022)"),
                  tags$ul(
                    tags$li("Analyzed recruitment data, cutting hiring cycle time by 25%."),
                    tags$li("Built Power BI dashboards, improving decision-making speed.")
                  )
                )
              )
      ),
      
      # --- Projects ---
      tabItem(tabName = "projects",
              fluidRow(
                bs4Card(
                  title = "Selected Projects",
                  width = 12, status = "warning", solidHeader = TRUE,
                  tags$ul(
                    tags$li("Data Warehouse & Analytics (Python, SQL, ETL) – [GitHub Link]"),
                    tags$li("PAN Validation & Analytics (Python, Pandas, Regex) – [GitHub Link]"),
                    tags$li("Vendor Performance Analytics (Python, Power BI, DAX) – [GitHub Link]")
                  )
                )
              )
      ),
      
      # --- Education ---
      tabItem(tabName = "education",
              fluidRow(
                bs4Card(
                  title = "Education",
                  width = 12, status = "primary", solidHeader = TRUE,
                  "B.Tech in Computer Science, APJ Abdul Kalam Technological University (2017–2021)"
                )
              )
      ),
      
      # --- Certifications ---
      tabItem(tabName = "certifications",
              fluidRow(
                bs4Card(
                  title = "Certifications",
                  width = 12, status = "danger", solidHeader = TRUE,
                  tags$ul(
                    tags$li("Google Data Analytics – Google"),
                    tags$li("SQL Essential Training – LinkedIn"),
                    tags$li("Machine Learning I – Columbia University"),
                    tags$li("Complete Python Developer – Udemy")
                  )
                )
              )
      ),
      
      # --- Download ---
      tabItem(tabName = "download",
              fluidRow(
                bs4Card(
                  title = "Download My CV",
                  width = 12, status = "secondary", solidHeader = TRUE,
                  "Click below to download the PDF version of my CV.",
                  downloadButton("downloadCV", "Download CV")
                )
              )
      )
    )
  )
)

server <- function(input, output) {
  # Example skill plot
  output$skillPlot <- renderPlotly({
    skills <- c("Python", "SQL", "Airflow", "Power BI", "Shiny", "AWS")
    levels <- c(9, 8, 7, 8, 6, 7)  
    plot_ly(x = skills, y = levels, type = 'bar', name = 'Proficiency') %>%
      layout(yaxis = list(title = "Level (1-10)"))
  })
  
  # --- CV download ---
  output$downloadCV <- downloadHandler(
    filename = function() {"Aswin_VM_CV.pdf"},
    content = function(file) {
      file.copy("Aswin_VM_CV.pdf", file)
    }
  )
}

shinyApp(ui, server)