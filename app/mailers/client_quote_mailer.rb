class ClientQuoteMailer < ApplicationMailer

	def client_quote(quote)
		@quote = quote
		mail( :to => @quote.email,:subject => 'Regarding quote / query.' )
	end
end
