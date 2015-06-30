class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.column :title, :string
    end
  end
end
