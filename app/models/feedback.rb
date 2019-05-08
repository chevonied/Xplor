class Feedback < MailForm::Base
    
    attribute :name,       :validate => true
    attribute :email,       :validate => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i # recommended by emailregex.com to work 99%! :D
    attribute :message,     :validate => true
    # a human won't see botcatcher field but a bot will
    attribute :botcatcher,  :captcha => true
    
    def headers
        {
        :subject => "Feedback Form",
        :to => "chevonie.daniel@mnsu.edu",
        :from => %("#{name}" <#{email}>)
        }
    end
end