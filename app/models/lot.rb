class Lot < ActiveRecord::Base
  validates :name, :presence => true, :length => { :minimum => 5}
  mount_uploader :contract, ContractUploader
  mount_uploader :tz_file, TzFileUploader
  mount_uploader :initial_price_reasoning_file, InitialPriceReasoningFileUploader
  mount_uploader :other_documents_file, OtherDocumentsFileUploader
  validates_numericality_of :application_pledge_sum
  validates_numericality_of :contract_pledge_sum
  validates :application_pledge_percent, :numericality => {
      :less_than_or_equal_to => 100,
      :greater_than_or_equal_to => 0
  }
  validates :contract_pledge_percent, :numericality => {
      :less_than_or_equal_to => 100,
      :greater_than_or_equal_to => 0
  }
  validates :start_price, :numericality => {:greater_than_or_equal_to => 1000}
  belongs_to :tender
  has_many :productions
  attr_accessible :contract_delivery_date, :name, :start_price, :contract, :contract_cache, :remove_contract,
                  :tz_file, :tz_file_cache, :remove_tz_file,
                  :initial_price_reasoning_file, :initial_price_reasoning_file_cache, :remove_initial_price_reasoning_file,
                  :other_documents_file, :other_documents_file_cache, :remove_other_documents_file,
                  :order_number, :initial_price_description, :participant_demands, :subcontractor_demands, :application_pledge,
                  :application_pledge_percent, :application_pledge_sum, :application_pledge_form, :contract_pledge, :contract_pledge_percent,
                  :contract_pledge_sum, :contract_pledge_form
  after_save :update_tender_sum
  after_destroy :update_tender_sum_destroy

  private
  def update_tender_sum
    return true unless start_price_changed?
    Tender.update_counters tender.id,
                           :price => (start_price - (start_price_was || 0))
    return true
  end

  def update_tender_sum_destroy
    Tender.update_counters tender.id,
                           :price => ( - start_price_was)
    return true
  end

end
