class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :rating
      t.boolean :solved

      t.timestamps
    end
  end
end
