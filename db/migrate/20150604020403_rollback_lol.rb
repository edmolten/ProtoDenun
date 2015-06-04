class RollbackLol < ActiveRecord::Migration
  def change
    change_column :comments, :likes, :integer, :default => 0
    change_column :comments, :dislikes, :integer, :default => 0
  end
end
