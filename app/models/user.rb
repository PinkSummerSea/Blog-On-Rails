class User < ApplicationRecord

    has_secure_password

    before_validation :downcase_email

    validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true # I installed email_validator gem to validate the email format # can also use regex /^(.+)@(.+)$/
    validates :name, presence: true
    validates :password_digest, presence: true

    private
    
    def downcase_email
        self.email = email.downcase
    end
end
