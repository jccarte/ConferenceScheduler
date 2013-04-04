class RenameEndToEndAt < ActiveRecord::Migration
  def up
    rename_column :events, :end, :endAt
  end

  def down
  end
end
