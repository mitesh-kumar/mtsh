# Preview all emails at http://localhost:3000/rails/mailers/client_quote_mailer
class ClientQuoteMailerPreview < ActionMailer::Preview
	def client_quote
		ClientQuoteMailer.client_quote(Quote.last)
	end
end
