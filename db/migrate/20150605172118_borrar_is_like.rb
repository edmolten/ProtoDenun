class BorrarIsLike < ActiveRecord::Migration
  def change
    remove_column :comments, :is_like
  end
end
