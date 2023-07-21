# Custom-Laptop-Price-Predictor
## Project Description
A European electronics shop wants to offer its client the ability to order custom computers. Also, using their data, they want to accurately estimate the price of custom work. For that reason, this application was developed using R and Azure ML Studio to assist a European store in predicting the prices of custom laptops for their esteemed clients.
## Data Description
This dataset, sourced from Kaggle, contains 1303 rows and 13 columns. Each row represents a product with its unique identification number, name, brand, type, and various other specifications.

#### Data dictionary 
* Company - String - Laptop Manufacturer
* Product - String - Brand and Model
* Product_type - String - Type of laptop (Notebook, Ultrabook, Gaming, etc.)
* Screen_size - Numeric - Screen size in inches
* Resolution - String - Screen resolution
* Touch_screen - Bool - Whether the computer has a touch screen
* Cpu - String - CPU brand name
* Processor_speed - Numeric - Processor speed in GHz
* Ram - Numeric - RAM size in GB
* Hard_drive - String - Hard drive details (capacity, type, and additional storage if any)
* Gpu - String - Graphics processing unit (GPU) brand name
* Op_sys - String - Operating system
* Weight - Numeric - Weight of the computer in kilograms
* Price_euros - Numeric - Price of the computer in euros

To view the full dataset, click [here](https://www.kaggle.com/datasets/muhammetvarl/laptop-price).

## EDA and Data Cleaning
During the data exploration and cleaning process using R programming language, several data-cleaning actions were performed to enhance the dataset's quality and prepare it for analysis. Here is a comprehensive summary of the key steps taken:
* Dropped Laptop ID Column: The "Laptop ID" column was removed from the dataset as it was deemed irrelevant for the analysis.
* Renamed Columns: Two columns were renamed to improve clarity and consistency. The column "Inches" was renamed to "Screen_size," and "TypeName" was renamed to "Product_type."
* Split Screen Resolution: The "ScreenResolution" column was split into three separate columns - "Display," "Touch_screen," and "Resolution" - to provide more detailed and relevant information.
* Simplified CPU and GPU Columns: The "CPU" and "GPU" columns were simplified by retaining only the brand names and removing unnecessary details, making the data more concise and manageable.
* Reformatted Features: The "Ram," "Memory," and "Weight" columns, originally in string format, were reformatted to numeric values for consistency and ease of analysis.
* Split Memory Column: The "Memory" column was split into two separate columns - "Drive_capacity" and "Extra_drive_capacity" - to offer more specific details about the hard drive configurations.
* Removed Extra Details from Product Names: The "Product" column initially contained excessive information, such as memory, CPU, and GPU details. This extra information was removed, leaving only the product names for improved analysis.
* Additionally, it is worth noting that no rows were dropped during the data-cleaning process.
<br>
Overall, after the data cleaning, the dataset expanded from 13 columns (2 numeric, 11 string) to 17 columns (6 numeric, 9 string, 2 boolean). The thorough exploratory data analysis, including the code and visualizations, can be found in the provided repository, available in both R notebook and HTML file formats. The dataset is now better structured and ready for modeling.

## Modeling 
The modeling phase was conducted using Azure Machine Learning Studio. After evaluating multiple models, the random forest model was selected for its superior predictive performance. The links to the Azure experiments are as follows:
* [ML studio experiment](https://gallery.azure.ai/Experiment/Laptop-Price-Prediction)
* [Published model](https://gallery.azure.ai/Experiment/Custom-Laptop-Price-Predictor-workflow)

This model had an R squared of 0.80 indicating that the variables present in our dataset were responsible for 80% of the variation in the price of the laptops. 

## Application
Furthermore, to provide a practical solution, an interactive application was developed using R. This application allows users to input their desired laptop specifications, and in return, it predicts and displays the corresponding price.
<br>
The application is available at this **[link](https://posit.cloud/content/6215383)**. Users can conveniently access and utilize this tool for personalized laptop price predictions based on their preferences.

	
