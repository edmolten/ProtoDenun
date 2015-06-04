class DefaultLikeDislikeComments < ActiveRecord::Migration
  def change
    change_column :comments, :likes, :boolean, :default => 0
    change_column :comments, :likes, :boolean, :default => 0
  end
end
