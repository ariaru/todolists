class Profile < ActiveRecord::Base
  belongs_to :user

  # validates :first_name, presence: true, if: "last_name.blank?"
  # validates :last_name, presence: true, if: "first_name.blank?"
  validate :first_name_or_last_name_present

  def first_name_or_last_name_present
  	if first_name.blank? && last_name.blank?
  		errors.add(:last_name, "either first name or last name must be present")
  	end
  end
end
