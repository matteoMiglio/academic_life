class Review < ApplicationRecord
  belongs_to :user
  belongs_to :message_board
end
