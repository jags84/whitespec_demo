class User < ApplicationRecord
  has_many :group_events
  validates :email, presence: true
  accepts_nested_attributes_for :group_events

  private
    def user_params
     params.require(:user).permit(:email)
    end
end
