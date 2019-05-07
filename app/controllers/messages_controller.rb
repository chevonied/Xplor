class MessagesController < ApplicationController
    # to set correct conversation, because messages route is nested
    before_action :set_conversation
    
    # allows current user to reply to message to the recipient
    def create
        receipt = current_user.reply_to_conversation(@conversation, params[:body])
        #so every receipt has a reference to the correct coversation. Wrapped in conversation path so that both reply here and form link to same path
        redirect_to conversation_path(receipt.conversation)
    end
    
    # finds right conversation
    private
    
        def set_conversation
            @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
        end
    
end