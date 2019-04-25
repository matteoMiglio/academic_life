class Document < ApplicationRecord
  belongs_to :message_board
  belongs_to :user
  belongs_to :category

  has_one_attached :file

  validates :message_board, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }

  scope :with_eager_loaded_image, -> { eager_load(file_attachment: :blob) }
  scope :with_preloaded_image, -> { preload(file_attachment: :blob) }
  scope :pagination, -> (page, entries) { paginate(page: page, per_page: 5, total_entries: entries).with_preloaded_image }
end
