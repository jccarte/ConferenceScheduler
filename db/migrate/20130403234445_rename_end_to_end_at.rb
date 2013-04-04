class RenameEndToEndAt < ActiveRecord::Migration
  def up
    rename_column :events, :end, :end_at
  end

  def down
  end
end
