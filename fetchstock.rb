require 'stock_quote'
active = true


while active == true do
puts "What is the stock you need to look up?"
	stock = gets.strip
	quote = StockQuote::Stock.quote(stock)

	puts "
	#{quote.symbol} - #{quote.name}
	Quote: $#{quote.last_trade_price_only}
	Open price $#{quote.open}
	Change price #{quote.changein_percent}
	Dividend Yield: $#{quote.dividend_yield}
	Ex-Dividend Date as of: #{quote.ex_dividend_date}
	"
	
	puts "
	Select additional options:
		1) Loop last trade for stock
		2) Look up another stock
		3) Exit the application
	"

	answer = gets.chomp.to_i
	if [1,2,3].include?(answer)
		if answer == 1
			puts "Press CTRL+C to exit. Proceeding to loop stock...."
			loop do
				puts "#{quote.symbol} - #{quote.last_trade_price_only} (#{quote.changein_percent})"
				sleep(10)
			end
		elsif answer == 2
			active = true
		elsif answer == 3
			active = false
			puts "Exiting program"
		end
	else 
		puts "Option not recognized. Returning to main menu..."
		puts
	end
end
