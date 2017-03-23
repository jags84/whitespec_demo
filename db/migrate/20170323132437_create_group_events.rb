class CreateGroupEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :publish_status
      t.boolean :remove_mark, :default => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
