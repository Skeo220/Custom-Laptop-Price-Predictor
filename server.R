library(shiny)
library(httr)
library(rjson)
library(tidyverse)  


# Function to make the Azure API call
predict_laptop_price_azure <- function(input_data) {
    api_key <- "Hb5k9X/E/8REZ/Tgg0HxHUlhks7W0qxI2jMzwKGs5+aDpbQrBvicHs9Wr6FDvXZqZUXrFr0U5cnK+AMCF5mwKw==" # Replace this with the API key for the web service
    authz_hdr <- paste('Bearer', api_key, sep=' ')

    response <- POST(
        url = "https://ussouthcentral.services.azureml.net/workspaces/6f51aae658904915aa274a1383a8f7aa/services/4c38d03967694137a8c7d45840b50689/execute?api-version=2.0&details=true",
        add_headers("Content-Type" = "application/json", "Authorization" = authz_hdr),
        body = enc2utf8(toJSON(input_data))
    )

    result <- content(response, type = "text", encoding = "UTF-8")
    fromJSON(result)
}

# Rest of the server code
shinyServer(function(input, output) {

    # Reactive expression to construct input_data based on user inputs
    input_data <- reactive({
        list(
            "Inputs" = list(
                "input1" = list(
                    "ColumnNames" = c(
                        "product_type", "screen_size", "resolution", "display", "touch_screen", "cpu",
                        "processor_speed", "ram", "drive_capacity", "drive_type", "extra_drive_capacity",
                        "gpu", "op_sys", "weight", "price_euros"
                    ),
                    "Values" = list(
                        c(
                            input$product_type, input$screen_size, input$resolution, input$display, input$touch_screen,
                            input$cpu, input$processor_speed, max(1, input$ram), max(1, input$drive_capacity),
                            input$drive_type, input$extra_drive_capacity, input$gpu, input$op_sys, max(1, input$weight), "0"
                        )
                    )
                )
            ),
            "GlobalParameters" = setNames(fromJSON('{}'), character(0))
        )
    })

    # Call the predict_laptop_price_azure function to make the API call
    prediction <- reactive({
        req <- input_data()
        predict_laptop_price_azure(req)
    })

    # Render the prediction output (display the predicted price)
    output$prediction_output <- renderText({
        prediction_result <- prediction()
        predicted_price <- prediction_result$Results$output1$value$Values
        paste("Predicted Laptop Price: €", round(as.numeric(predicted_price),2))
    })
})




