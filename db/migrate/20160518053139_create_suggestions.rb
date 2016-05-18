class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :suggestion_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
