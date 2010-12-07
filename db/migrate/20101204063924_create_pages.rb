class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :area_one
      t.text :area_two
      t.text :area_three
      t.text :area_four

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
