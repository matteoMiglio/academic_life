class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, :through => :members

  validates :message_board, presence: true
  validates :name, presence: true, length: { maximum: 100, too_long: "Nome troppo lungo!",
                                             minimum: 5, too_short: "Nome troppo corto!" }
  validates :state, presence: true, inclusion: { in: %w(public private) }

  scope :ordered,    -> { order('created_at desc') }
  scope :with_members, -> (id) { includes(:members).where(message_board_id: id).ordered }

  def create_group(creator)
    Group.transaction do
      self.save! 
      creator.save!
    end
  rescue ActiveRecord::RecordInvalid
  end
end
