class ConversationsController < ApplicationController
    
    #receives all chats
    def index
        @conversations = current_user.mailbox.conversations
    end
    
    
    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end
end