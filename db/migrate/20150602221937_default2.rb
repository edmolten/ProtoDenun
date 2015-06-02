class Default2 < ActiveRecord::Migration
  def change
    change_column :denuns, :like, :integer, :default => 1
  end
end
