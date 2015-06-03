class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :like
      t.text :text
      t.belongs_to :denuns
      t.timestamps
    end

    add_belongs_to :denuns, :denun_types
  end
end
