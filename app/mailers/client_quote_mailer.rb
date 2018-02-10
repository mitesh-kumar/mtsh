class ClientQuoteMailer < ApplicationMailer

	def client_quote(quote)
		@quote = quote
		mail( :to => @quote.email,:subject => 'Regarding quote / query.' )
	end
	def contact_mail(contact)
		@contact = contact
		mail(:to => @contact.email,:subject => 'Thanks for contacting MTSH SOFTWARE & CONSULTANCY PRIVATE LIMITED.')
	end
	def subscribe_mail(contact,unsubscribe)
		@contact = contact
		@unsubscribe = unsubscribe
		mail(:to => @contact.email,:subject => 'Thanks for subscribing MTSH SOFTWARE & CONSULTANCY PRIVATE LIMITED Newsletter.')
	end
end
