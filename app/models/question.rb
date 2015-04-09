class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user
  has_one :user_marks, dependent: :destroy

  validates :title, :text, presence: true
end
