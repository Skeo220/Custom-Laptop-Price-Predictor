library(shiny)


shinyUI(fluidPage(
  titlePanel("Laptop Price Prediction"),

  fillRow(
    column(width = 10,
           # Input elements for each column name
           lapply(input_cols, function(col_name) {
             if (col_name == "product_type") {
               # Assuming "product_type" is a categorical variable
               selectInput("product_type", "Product Type:", choices = c("Ultrabook", "Notebook", "Netbook", "Gaming", "2 in 1 Convertible", "Workstation"))
             } else if (col_name == "drive_type") {
               selectInput("drive_type", "Drive Type:", choices = c("SSD", "Flash Storage", "HDD", "Hybrid"))
             } else if (col_name == "resolution") {
               selectInput("resolution", "Resolution:", choices = c("2560x1600", "1440x900", "1920x1080", "2880x1800", "1366x768", "2304x1440", "3200x1800", "1920x1200", "2256x1504", "3840x2160", "2160x1440", "2560x1440", "1600x900", "2736x1824", "2400x1600"))
             } else if (col_name == "display") {
               selectInput("display", "Display:", choices = c("IPS Panel Retina Display", "None", "Full HD", "IPS Panel Full HD", "Quad HD+", "IPS Panel", "IPS Panel 4K Ultra HD", "4K Ultra HD", "IPS Panel Quad HD+"))
             } else if (col_name == "touch_screen") {
               selectInput("touch_screen", "Touchscreen:", choices = c("No", "Yes"))
             } else if (col_name == "cpu") {
               selectInput("cpu", "CPU:", choices = c("Intel", "AMD", "Samsung"))
             } else if (col_name == "gpu") {
               selectInput("gpu", "GPU:", choices = c("Intel", "AMD", "Nvidia", "ARM"))
             } else if (col_name == "op_sys") {
               selectInput("op_sys", "Operating System:", choices = c("macOS", "No OS", "Windows 10", "Mac OS X", "Linux", "Android", "Windows 10 S", "Chrome OS", "Windows 7"))
             } else if (col_name == "extra_drive_capacity") {
               selectInput("extra_drive_capacity", "Extra Drive Capacity:", choices = c("Yes", "No"))
             } else {
               # Assuming other columns are numerical variables
               numericInput(col_name, label = col_name, value = 0)
             }
           })),
    column(width = 12,
           mainPanel(
             # "Estimate Price" button
             # actionButton("estimate_btn", "Estimate Price"),
             # br(),
             # Output element to display the results
             verbatimTextOutput("prediction_output")
           )
    )
  )
))




