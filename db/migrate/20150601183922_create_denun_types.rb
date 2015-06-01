class CreateDenunTypes < ActiveRecord::Migration
  def change
    create_table :denun_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
