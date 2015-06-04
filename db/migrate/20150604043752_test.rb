class Test < ActiveRecord::Migration
  def change
    rename_column :comments, :denuns_id, :denun_id
  end
end
