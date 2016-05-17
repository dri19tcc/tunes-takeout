class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, default: "spotify", null: false
      t.string :uid, null: false
      t.string :name 

      t.timestamps null: false
    end
  end
end
