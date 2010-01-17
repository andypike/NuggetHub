class CreateNuggets < ActiveRecord::Migration
  def self.up
    create_table :nuggets do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :nuggets
  end
end
