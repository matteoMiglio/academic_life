class Document < ApplicationRecord
  belongs_to :message_board
  belongs_to :user
  belongs_to :category
end
