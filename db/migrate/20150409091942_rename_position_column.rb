class RenamePositionColumn < ActiveRecord::Migration
  def change
    rename_column :tasks, :position, :row_order
  end
end
