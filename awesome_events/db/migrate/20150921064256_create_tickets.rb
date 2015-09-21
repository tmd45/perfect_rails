class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user
      t.references :event, null: false
      t.string :comment

      t.timestamps
    end

    add_index :tickets, [ :user_id, :event_id ], unique: true, name: :index_user_id_event_id
    add_index :tickets, [ :event_id, :user_id ], unique: true, name: :index_event_id_user_id
  end
end
