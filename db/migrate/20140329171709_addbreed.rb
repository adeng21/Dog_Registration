class Addbreed < ActiveRecord::Migration
  def up
    add_column :dogregistrations, :breed, :string
  end

  def down
    remove_column :dogregistrations, :breed
  end
end
