class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, :through => :members

  validates :message_board, presence: true
  validates :name, presence: true, length: { maximum: 100, too_long: "Nome troppo lungo!" }
  validates :state, presence: true, inclusion: { in: %w(public private) }

  scope :with_members, -> (id) { includes(:members).where(message_board_id: id) }
end
