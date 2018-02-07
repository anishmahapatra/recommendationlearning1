df <- read.csv('Online Retail.csv')
print(sum(df[df$Country == 'United Kingdom', ]$Quantity))
df$TotalPrice <- df$Quantity * df$UnitPrice
print(sum(df[df$CustomerID %in% c(13744) & grepl('^20[-/]02[-/](20)*11', df$InvoiceDate),  ]$TotalPrice))
france_sales <- aggregate(Quantity ~ Description, df[df$Country == 'France', ], sum)
print(france_sales[which.max(france_sales$Quantity), ])
second_quarter_sales <- aggregate(Quantity ~ Description, df[grepl('[/-]0[4-6][/-](20)*11', df$InvoiceDate), ], sum)
print(head(second_quarter_sales[order(second_quarter_sales$Quantity, decreasing = TRUE), ], 5))
print(mean(df[grepl('[/-]04[/-](20)*11', df$InvoiceDate), ]$TotalPrice))
