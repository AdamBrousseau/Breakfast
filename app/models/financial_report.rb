class FinancialReport < ActiveRecord::Base
	#acts_as_paranoid
	  belongs_to :user

	  validates :school_name, presence: true, length: { maximum: 100}
      validates :month_of_report, presence: true
      validates :total_spent, presence: true
      validates :comments, length: { maximum: 200}

      validates :user_id, presence: true
end
