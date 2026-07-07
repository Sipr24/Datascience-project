# Datascience-project
# 🛒 Instacart Market Basket Analysis using R

## 📖 Overview

This project performs **Market Basket Analysis** on the Instacart Online Grocery Shopping dataset using **R**. The analysis explores customer purchasing behavior, discovers frequently bought-together products using the Apriori algorithm, analyzes ordering trends, and forecasts future product demand using ARIMA time series forecasting.

---

## 📂 Dataset

The project uses the **Instacart Market Basket Analysis** dataset available on Kaggle.

Dataset Files:
- orders.csv
- products.csv
- aisles.csv
- departments.csv
- order_products__prior.csv

Dataset Link:
https://www.kaggle.com/competitions/instacart-market-basket-analysis

---

## 🎯 Objectives

- Analyze customer purchasing behavior
- Identify frequently purchased products
- Discover product associations using Apriori
- Visualize ordering trends
- Forecast future product demand using ARIMA

---

## 🛠️ Technologies Used

- R
- data.table
- dplyr
- tidyr
- ggplot2
- arules
- arulesViz
- recommenderlab
- forecast

---

## 📊 Project Workflow

1. Load Instacart datasets
2. Merge order and product information
3. Convert orders into transaction format
4. Perform Market Basket Analysis using Apriori
5. Visualize frequent itemsets and association rules
6. Analyze ordering patterns by day of the week
7. Forecast future demand using ARIMA

---

## 📈 Results

### Frequent Item Analysis
- Identified the top 20 most frequently purchased products.
- Generated both absolute and relative frequency plots.

### Association Rule Mining
- Applied the Apriori algorithm to discover relationships between products.
- Visualized association rules using a graph network.

### Order Trend Analysis
- Analyzed the number of orders across different days of the week.

### Time Series Forecasting
- Built an ARIMA model to forecast future demand for one of the most frequently purchased products.

---

## 📁 Project Structure

```
Instacart-Market-Basket-Analysis/
│
├── data/
│   ├── orders.csv
│   ├── products.csv
│   ├── aisles.csv
│   ├── departments.csv
│   └── order_products__prior.csv
│
├── plots/
│   ├── item_frequency_absolute.png
│   ├── item_frequency_relative.png
│   ├── association_graph.png
│   ├── order_day_distribution.png
│   └── arima_forecast.png
│
├── instacart_analysis.R
└── README.md
```

---

## 📦 Required Packages

```r
install.packages(c(
  "data.table",
  "dplyr",
  "tidyr",
  "arules",
  "arulesViz",
  "recommenderlab",
  "ggplot2",
  "forecast"
))
```

---

## ▶️ Running the Project

1. Download the Instacart dataset.
2. Update the dataset file paths in the R script.
3. Install the required R packages.
4. Run the script.
5. Generated plots will be displayed.

---

## 📌 Key Insights

- Bananas are the most frequently purchased product.
- Organic products dominate customer purchases.
- Association rules reveal products that are commonly bought together.
- Ordering activity varies across different days of the week.
- ARIMA forecasting provides an estimate of future demand.

---

## 🚀 Future Improvements

- Product Recommendation System
- FP-Growth Algorithm
- Customer Segmentation
- Interactive Shiny Dashboard
- Advanced Time Series Models (LSTM, Prophet)

---

## 👨‍💻 Author

**Bibhu Prasad Mishra**
