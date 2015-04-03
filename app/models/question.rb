class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user

  validates :title, :text, presence: true
end
