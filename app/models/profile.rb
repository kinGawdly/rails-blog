class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birth, presence: true
  validates :gender, presence: true
  validate :validate_gender

  belongs_to :user

  enum role: [:member, :admin, :superadmin]
  after_create :set_role

  private
  def validate_gender
    if self.gender =! 'Male' || self.gender =! 'Female'
      errors.add(:gender, "was not included in the list")
    end
  end

  def set_role
    self.update(role: 0) if self.role.nil?
  end
end
