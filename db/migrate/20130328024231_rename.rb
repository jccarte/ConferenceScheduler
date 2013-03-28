class Rename < ActiveRecord::Migration
  def up
	rename_column :events, :startsAt, :starts_at
	rename_column :events, :endsAt, :ends_at
  end

  def down
  end
end
