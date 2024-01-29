class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string     :type
      t.references :user, index: true
      t.string     :event_name
      t.boolean    :is_published
      t.json       :metadata

      t.timestamps
    end
  end
end
