packages <- c("data.table", "dplyr", "tidyr", "arules",
              "recommenderlab", "ggplot2", "forecast")
install.packages("packages")
lapply(packages, library, character.only = TRUE)
order<-fread("C:/Users/Bibhu Prasad Mishra/OneDrive/Desktop
/Important Dataset/Instacart Market Basket Analysis/orders.csv.zip")
view(order)
head(order)
product<-fread("C:/Users/Bibhu Prasad Mishra/OneDrive/Desktop
/Important Dataset/Instacart Market Basket Analysis/products.csv.zip")
view(product)
head(product)
aisles<-read.csv("C:/Users/Bibhu Prasad Mishra/OneDrive/Desktop
/Important Dataset/Instacart Market Basket Analysis/aisles.csv")
view(aisles)
head(aisles)
departments<-read.csv("C:/Users/Bibhu Prasad Mishra/OneDrive/Desktop
/Important Dataset/Instacart Market Basket Analysis/departments.csv")
view(departments)
head(departments)
orders_prior<-fread("C:/Users/Bibhu Prasad Mishra/OneDrive/Desktop
/Important Dataset/Instacart Market Basket Analysis/order_products__prior.csv.zip")
view(orders_prior)
head(orders_prior)
mergedData<-merge(order,orders_prior,by="order_id")
view(mergedData)
mergedData2<-merge(mergedData,product,by="product_id")
basketlist<-split(mergedData2$product_name,mergedData2$order_id)
view(basketlist)
trans<-as(basketlist,"transactions")
summary(trans)         # quick sanity check
itemFrequencyPlot(trans, topN = 20,type="absolute")
rules <- apriori(trans, parameter = list(supp = 0.01, conf = 0.2))
class(rules)
inspect(head(sort(rules, by="lift"), 10))
plot(rules, method = "graph", engine = "htmlwidget")
install.packages("arulesViz")
library("arulesViz")
plot(rules, method = "graph", engine = "htmlwidget")
ui <- mergedData2 %>%
  group_by(user_id, product_name) %>%
  summarise(purchased = 1, .groups = "drop") %>%
  pivot_wider(names_from = product_name, values_from = purchased, values_fill = 0)

mat <- as.matrix(ui[,-1])
rownames(mat) <- ui$user_id
bin <- as(mat, "binaryRatingMatrix")
banana_sales <- mergedData2 %>%
  filter(product_name == "Banana") %>%
  group_by(order_number) %>%  # or order_dow if you want by day-of-week
  summarise(units = n(), .groups = "drop")
# Convert to a time series
ts_data <- ts(banana_sales$units, frequency = 7)  # weekly seasonality
# Fit an automatic ARIMA model
fit <- auto.arima(ts_data)
# Forecast next 14 periods
future <- forecast(fit, h = 14)
# Plot forecast
autoplot(future)
mergedData2 %>%
  group_by(order_dow) %>%
  summarise(num_orders = n(), .groups = "drop") %>%
  ggplot(aes(x = factor(order_dow), y = num_orders)) +
  geom_col(fill = "steelblue") +
  labs(title = "Number of Orders by Day of Week",
       x = "Day of Week",
       y = "Number of Orders")