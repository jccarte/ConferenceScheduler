class RenameStartEnd < ActiveRecord::Migration
  def up
    rename_column :events, :starts_at, :start
    rename_column :events, :ends_at, :end
  end

  def down
  end
end
