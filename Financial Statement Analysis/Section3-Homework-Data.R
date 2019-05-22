
#Scenario: You are a Data Scientist working for a consulting firm. One of your 
#colleagues from the Auditing department has asked you to help them assess the financial statement of organisation X.

#You have been supplied with two vectors of data: monthly revenue and monthly
#expenses for the financial year in question. Your task is to calculate the following
#financial metrics:

#- profit for each month
#- profit after tax for each month (the tax rate is 30%)
#- profit margin for each month - equals to profit after tax divided by revenue
#- good months - where the profit after tax was greater than the mean for the year
#- bad months - where the profit after tax was less than the mean for the year
#- the best month - where the profit after tax was max for the year
#- the worst month - where the profit after tax was min for the year

#All results need to be presented as vectors.
#Results for dollar values need to be calculated with $0.01 precision, but need to be 
#presented in Units of $1,000 (i.e. 1k) with no decimal points.

#Results for the profit margin ratio need to be presented in units of % with no decimal points.

#Note: You colleague has warned you that it is okay for tax for any given month to be
#negative (in accounting terms, negative tax translates into a deferred tax asset).


#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)



#Problem 1: profit of each month

#profit is revenue - expenses, create a vector approach

# Make sure both vectors cover an entire year with length. Both have length = 12
length(revenue)
length(expenses)

#create a new vector and assign it as profit, calculating difference between revenue and expenses and round to nearest dollar

profit <-revenue - expenses

profit

#Problem 2: Profit after tax for each month

#find the tax each month and round to nearest dollar
tax_each_month <- round(profit[1:12] * 0.30, digits = 2)

tax_each_month

#profit minus tax
profit_after_tax <- profit - tax_each_month

profit_after_tax

#Problem 3: profit margin for each month, profit_after_tax/revenue

monthly_profit_margin <- round((profit_after_tax / revenue) * 100, digits = 0) 


monthly_profit_margin

# problem 4: good months calculation

#calculate the mean
profit_after_tax_mean <- mean(profit_after_tax)

(profit_after_tax_mean)

#calculate good months

profit_good_months <- profit_after_tax > profit_after_tax_mean
 
profit_good_months

#Problem 5: Bad Months calculation

profit_bad_months <- !profit_good_months

profit_bad_months

#Problem 6: Best Month where profit after tax was highest

best_month <- profit_after_tax ==  max(profit_after_tax[1:12])

#Problem 7: Worst Month where profit after tax was lowest

worst_month <- profit_after_tax == min(profit_after_tax[1:12])


#units in thousands

revenue_1000 <- round(revenue / 1000)
expenses_1000 <- round(expenses / 1000)
profit_1000 <- round(profit / 1000)
profit_after_tax_1000 <- round(profit_after_tax / 1000)
