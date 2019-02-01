class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 150 }
  validates :text, presence: true

  def get_excerpt
    text.truncate(250)
  end
end
