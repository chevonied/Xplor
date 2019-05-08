class FeedbacksController < ApplicationController
    
    def new
        @feedback = Feedback.new
    end
    
    def create
        @feedback = Feedback.new(params[:feedback])
        @feedback.request = request
        
        if @feedback.deliver
            flash.now[:error] = nil
        else
            flash.now[:error] = "Sorry. Your message could not be delivered."
            render :new
        end
    end
    
end
