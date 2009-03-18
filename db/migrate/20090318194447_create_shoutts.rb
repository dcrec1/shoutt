class CreateShoutts < ActiveRecord::Migration
  def self.up
    create_table :shoutts do |t|
      t.references :user
      t.string :body
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :shoutts
  end
end
