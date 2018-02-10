# Preview all emails at http://localhost:3000/rails/mailers/client_quote_mailer
class ClientQuoteMailerPreview < ActionMailer::Preview
	def client_quote
		ClientQuoteMailer.client_quote(Quote.last)
	end
	def contact_mail
		ClientQuoteMailer.contact_mail(Feedback.where(from: "contact").last)
	end
	def subscribe_mail
		@subscriber = Subscriber.first
		@unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@subscriber.id)
		ClientQuoteMailer.subscribe_mail(@subscriber,@unsubscribe)
	end
end
