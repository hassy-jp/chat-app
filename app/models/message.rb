class Message < ApplicationRecord
  belong_to :rooms
  belong_to :users

end
