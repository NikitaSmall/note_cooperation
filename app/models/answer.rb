class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_one :user_marks, dependent: :destroy

  def self.get_user_statistic
    answer_rating = Answer.select('user_id, count(rating) as rating').group(:user_id)

    @answer_rating = Hash.new
    answer_rating.each do |a|
      @answer_rating[a.user.username] = a.rating
    end
    @answer_rating
  end
end
