class AddlastArticleToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :last_article, :string
    remove_column :authors, :link, :string
  end
end
