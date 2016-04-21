class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :message_text
      t.string :phone_number
      t.string :email
      t.integer :duration
      t.integer :frequency
      t.integer :user_id
      t.boolean :is_active
      t.datetime :last_sent

      t.timestamps null: false
    end
  end
end
