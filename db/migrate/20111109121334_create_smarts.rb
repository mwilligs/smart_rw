class CreateSmarts < ActiveRecord::Migration
  def self.up
    create_table :smarts do |t|
      t.string :name
      t.text :description
      t.decimal :price, {:precision => 8, :scale => 2}
      t.text :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :smarts
  end
end
