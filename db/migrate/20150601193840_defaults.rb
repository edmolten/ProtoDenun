class Defaults < ActiveRecord::Migration
  def change
    change_column :denuns, :like, :integer, :default => 0
    change_column :denuns, :dislike, :integer, :default => 0
  end
end
