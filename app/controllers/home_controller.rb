class HomeController < ApplicationController
  def index
  	@subscriber = 200 + Subscriber.all.count
  	@new_subscriber = Subscriber.new
    @feedback = Feedback.new
  end

  def create_subscriber
  	@new_subscriber = Subscriber.new(subscriber_params);
    respond_to do |format|
      if @new_subscriber.save
      	@subscriber = 200 + Subscriber.all.count
      	@new_subscriber = Subscriber.new
        format.html { redirect_to root_path, notice: 'Sucessfully Subscribed Newsletter' }
        format.js
      else
      	@subscriber = 200 + Subscriber.all.count
        format.html { render :index }
        format.js
      end
    end
  end
  def feedback_subscriber
    @feedback = Feedback.new(feedback_params);
    respond_to do |format|
      if @feedback.save
        @feedback = Feedback.new
        format.html { redirect_to root_path, notice: 'Sucessfully sent feedback .Thanks for your valuable time' }
        format.js
      else
        format.html { render :index }
        format.js
      end
    end
  end
  def ror
    @quote =  Quote.new
  end

  def create_quote
    @quote = Quote.new(quote_params);
    respond_to do |format|
      if @quote.save
        ClientQuoteMailer.client_quote(@quote).deliver
        @quote = Quote.new
        format.html { redirect_to home_ror_path, notice: 'Sucessfully sent quote. We will contact with you soon.' }
        format.js
      else
        format.html { render :ror }
        format.js
      end
    end
  end
end

private

def subscriber_params
	params.fetch(:subscriber, {}).permit(:email)
end
def feedback_params
  params.fetch(:feedback, {}).permit(:name,:email,:phone,:message)
end
def quote_params
  params.fetch(:quote, {}).permit(:name,:email,:phone,:timing,:message)
end