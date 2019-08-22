class AddConstraintsCategory < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :name, false
    add_index :categories, :name, unique: true
  end
end
