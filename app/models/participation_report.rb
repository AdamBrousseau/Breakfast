class ParticipationReport < ActiveRecord::Base
	  #acts_as_paranoid
	  belongs_to :user

	  validates :school_name, presence: true, length: { maximum: 100}
      validates :school_population, presence: true 
      validates :principal_name, presence: true, length: { maximum: 50}
      validates :staff_name, presence: true, length: { maximum: 50}

      validates :no_served_students_breakfast, presence: true
      validates :no_served_students_snack, presence: true

      validates :reporting_period_start, presence: true
      validates :reporting_period_end, presence: true
      validates :program_start_date, presence: true

      validates :no_volunteer_staff, presence: true
      validates :no_volunteer_students, presence: true
      validates :no_volunteer_community, presence: true
      validates :no_volunteer_parents, presence: true

      validates :food_donation_source, presence: true, length: { maximum: 50}
      validates :financial_donation_source, presence: true, length: { maximum: 50}

      validates :user_id, presence: true
end
