class Profile < ApplicationRecord
  has_many :links

  validates :name, presence: true
  validates :age, numericality: { only_integer: true }, allow_nil: true

  after_save :sync_profile

  def sync_profile
    ProfileSyncJob.perform_later(profile: self)
  end
end
