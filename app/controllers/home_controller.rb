class HomeController < ApplicationController
  def index
  	@subscriber = 200 + Subscriber.where(active: true).count
  	@new_subscriber = Subscriber.new
    @feedback = Feedback.new
  end

  def contact
    @contact = Feedback.new
  end

  def create_contact
    @contact = Feedback.new(contact_params);
    respond_to do |format|
      if @contact.save
        ClientQuoteMailer.contact_mail(@contact).deliver_later
        @contact = Feedback.new
        format.html { redirect_to root_path, notice: 'Sucessfully sent contact .Thanks for contacting us.We will get back to you soon' }
        format.js
      else
        @contact = Feedback.new
        format.html { render :contact }
        format.js
      end
    end
  end

  def create_subscriber
  	@new_subscriber = Subscriber.new(subscriber_params);
    respond_to do |format|
      if @new_subscriber.save
      	@subscriber = 200 + Subscriber.where(active: true).count
        @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@new_subscriber.id)
        ClientQuoteMailer.subscribe_mail(@new_subscriber,@unsubscribe).deliver_later
      	@new_subscriber = Subscriber.new
        format.html { redirect_to root_path, notice: 'Sucessfully Subscribed Newsletter' }
        format.js
      else
      	@subscriber = 200 + Subscriber.where(active: true).count
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
        ClientQuoteMailer.client_quote(@quote).deliver_later
        @quote = Quote.new
        format.html { redirect_to home_ror_path, notice: 'Sucessfully sent quote. We will contact with you soon.' }
        format.js
      else
        format.html { render :ror }
        format.js
      end
    end
  end
  def about
  
  end
  def terms_condition
    
  end
  def privacy_policy
    
  end
  def java
    
  end

  def unsubscribe
    subscriber = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @subscriber = Subscriber.find(subscriber)
  end

  def update_subscription
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
      @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@subscriber.id)
      ClientQuoteMailer.subscribe_mail(@subscriber,@unsubscribe).deliver_later
      flash[:notice] = 'Subscription Cancelled' 
      redirect_to root_url
    else
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    end
  end

  private

  def subscriber_params
    params.fetch(:subscriber, {}).permit(:email,:active)
  end
  def feedback_params
    params.fetch(:feedback, {}).permit(:name,:email,:phone,:message)
  end
  def quote_params
    params.fetch(:quote, {}).permit(:name,:email,:phone,:timing,:message)
  end
  def contact_params
    params.fetch(:feedback, {}).permit(:name,:email,:phone,:message,:from)
  end
end

