class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.datetime :read_at
      t.references :receiver, null: false
      t.references :sender, null: false
      t.references :notifiable, polymorphic: true, null: false
      t.string :action
      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :receiver_id
    add_foreign_key :notifications, :users, column: :sender_id
  end
end
