class TodoList < ApplicationRecord
  has_many :todo_items
  mount_uploader :avatar, AvatarUploader

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
