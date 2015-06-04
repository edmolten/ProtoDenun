class Id2 < ActiveRecord::Migration
  def change
    rename_column :denuns, :denun_types_id, :denun_type_id
  end
end
