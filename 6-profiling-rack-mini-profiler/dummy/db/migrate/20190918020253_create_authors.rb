class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.timestamps
      t.string(:name, null: false)
    end

    change_table :posts do |t|
      t.references(:author)
    end
  end
end
