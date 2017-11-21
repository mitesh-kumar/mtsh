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
        format.html { redirect_to root_path, notice: 'Sucessfully sent feedback / quote. We will contact with you soon.' }
        format.js
      else
        format.html { render :index }
        format.js
      end
    end
  end
  def ror
  end
end

private

def subscriber_params
	params.fetch(:subscriber, {}).permit(:email)
end
def feedback_params
  params.fetch(:feedback, {}).permit(:name,:email,:phone,:message)
end