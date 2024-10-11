install.packages("rvest")
install.packages("dplyr")

library(rvest)
library(dplyr)

link = "https://in.tradingview.com/symbols/NSE-NIFTY/components/"
page = read_html(link)

stock = page%>%html_nodes(".tickerDescription-GrtoTeat")%>%html_text()
market_cap = page%>%html_nodes(".onscroll-shadow+ .right-RLhfr_y4")%>%html_text()
price = page%>%html_nodes(".right-RLhfr_y4:nth-child(3)")%>%html_text()
pe = page%>%html_nodes(".right-RLhfr_y4:nth-child(7)")%>%html_text()
div_yield = page%>%html_nodes(".right-RLhfr_y4:nth-child(10)")%>%html_text()
sector = page%>%html_nodes(".link-KcaOqbQP")%>%html_text()
analyst_rating = page%>%html_nodes(".container-ibwgrGVw")%>%html_text()

nifty_data = data.frame(stock, market_cap, price, pe, div_yield, sector, analyst_rating, stringsAsFactors = FALSE)
