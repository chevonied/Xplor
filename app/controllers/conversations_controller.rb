class ConversationsController < ApplicationController

    #receives all chats
    def index
        @conversations = current_user.mailbox.conversations
    end
    
    
    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end
    
    def new
        # makes it so that user doesn't see themselves in dropdown to send messages to other users
        @recipients = User.all - [current_user]
    end
    
    def create
        # finds correct recipient in coversation and sends them message. Since we're not using it in a view, we can avoid using instance variables
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        # goes back to conversation after message is sent
        redirect_to conversations_path(receipt.conversation)
    end
    
    def destroy
        conversation = current_user.mailbox.conversations.find(params[:id])
        current_user.trash(conversation)
    end
end