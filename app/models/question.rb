class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user
  has_one :user_marks, dependent: :destroy

  validates :title, :text, presence: true

  def self.get_user_statistic
    question_rating = Question.select('user_id, count(rating) as rating').group(:user_id)

    @question_rating = Hash.new
    question_rating.each do |q|
      @question_rating[q.user.username] = q.rating
    end
    @question_rating
  end

  def self.get_user_summary_rating
    @question_rating = Question.select('user_id, sum(rating) as rating').group(:user_id).limit(10)

    @question_rating.map do |r|
      answer = Answer.select('sum(rating) as rating').where(user_id: r.user_id)
      r.rating += answer.first.rating unless answer.first.rating.nil?
    end
    @question_rating
  end
end
