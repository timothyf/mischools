class CreateCounties < ActiveRecord::Migration
  def self.up
    create_table :counties do |t|
      t.references  :state
      t.string      :name
      t.string      :number
      t.timestamps
    end
  end

  def self.down
    drop_table :counties
  end
end
