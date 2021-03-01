class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  before_validation :company_exists

  private
    def company_exists
      recruiter_domain = self.email.split("@").last
      Company.all.each do |company|
        if recruiter_domain == company[:website].split("www.").last
          self.company_id = company[:id]
          self.admin = false
        end
      end
    end
end
