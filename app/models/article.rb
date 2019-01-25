class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 150 }
  validates :text, presence: true

  def get_excerpt
    text.truncate(150) # 30 is char limit
  end
end
