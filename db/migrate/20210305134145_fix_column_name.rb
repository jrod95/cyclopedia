class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :bicycles, :type, :activity
  end
end
