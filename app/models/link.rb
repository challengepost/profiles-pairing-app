class Link < ApplicationRecord
  belongs_to :profile

  validates :name, :url, presence: true
  validates :url, url: true
end
