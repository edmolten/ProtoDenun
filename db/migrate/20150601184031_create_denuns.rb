class CreateDenuns < ActiveRecord::Migration
  def change
    create_table :denuns do |t|
      t.string :name
      t.string :description
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
