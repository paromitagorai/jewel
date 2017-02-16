class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, presence: true, length: { minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 1000}
  validates :category_id, presence: true
  has_attached_file :photo, styles: { large: "600*600>", medium: "300*300>", thumb: "150*150>"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
