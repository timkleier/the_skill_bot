class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :platform

      t.timestamps
      t.index [:title, :platform], unique: true
    end
  end
end
