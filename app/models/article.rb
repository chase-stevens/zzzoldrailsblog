class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 150 }
  validates :text, presence: true

  def get_excerpt
    text.truncate(250)
  end

  def self.search(search)
    if search
      Article.where("title LIKE ?", "%#{search}%").to_a
    else
      Article.all
    end
  end
end
