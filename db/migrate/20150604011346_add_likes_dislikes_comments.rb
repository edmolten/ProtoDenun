class AddLikesDislikesComments < ActiveRecord::Migration
  def change
    remove_column :comments, :like
    add_column :comments, :is_like, :boolean
    add_column :comments, :likes, :integer
    add_column :comments, :dislikes, :integer
  end
end
