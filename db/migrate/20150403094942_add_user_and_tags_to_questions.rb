class AddUserAndTagsToQuestions < ActiveRecord::Migration
  def change
    #add_reference :questions, :user, index: true
    #add_column :questions, :tag, :has_many_and_belongs_to

    create_table :questions_tags, id:false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :tag, index: true
    end
  end
end
