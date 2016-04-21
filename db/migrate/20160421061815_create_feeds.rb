class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
