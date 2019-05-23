class Group < ApplicationRecord
  belongs_to :message_board
  has_many :events, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, :through => :members

  validates :message_board, presence: true
  validates :name, presence: true, length: { maximum: 100, minimum: 5 }
  validates :state, presence: true, inclusion: { in: %w(public private) }

  scope :ordered, -> { order('updated_at desc') }
  scope :paginated, -> (id, page, entries) { includes(:members)
                                             .where(message_board_id: id)
                                             .paginate(page: page, per_page: 5, total_entries: entries)
                                             .ordered }

  def create_group(creator)
    Group.transaction do
      self.save! 
      creator.save!
    end
  rescue ActiveRecord::RecordInvalid
  end
end
