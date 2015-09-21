class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :comment

      t.timestamps
    end
  end
end