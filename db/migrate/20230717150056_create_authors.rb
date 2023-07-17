class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :link
      t.string :rss_link

      t.timestamps
    end
  end
end
