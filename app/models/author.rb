class Author < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :last_article, presence: true
end
