class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answer do |t|
      t.string :text
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
  end
end
