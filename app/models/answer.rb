class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_one :user_marks, dependent: :destroy
end
