class AddHidden < ActiveRecord::Migration
  def change
    add_column(:denuns, :hidden, :boolean, default: FALSE )
  end
end
