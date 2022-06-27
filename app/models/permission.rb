class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :note

  enum permission: { :moderator => 0, :admin => 1 }

end
