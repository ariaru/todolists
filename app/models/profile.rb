class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name_present

  # The programmer doesn't agree with the gender binarism implied in the
  # specifications of this assignment (following two validations)
  validates :gender, inclusion: { in: %w(female male) }
  validate :male_person_named_sue_forbidden_which_is_ridiculous

  def first_name_or_last_name_present
  	if first_name.blank? && last_name.blank?
  		errors.add(:last_name, "either first name or last name must be present")
  	end
  end

  def male_person_named_sue_forbidden_which_is_ridiculous
  	if gender == "male" && first_name == "Sue"
  		errors.add(:gender, "according to the assignment, with which the programmer
  			of this practice app does not agree, a male person cannot be named Sue,
  			or a person named Sue cannot be male -- which is nonsense, of course")
  	end
  end
end
