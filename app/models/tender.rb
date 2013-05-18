class Tender < ActiveRecord::Base

  attr_accessible :app_open_date, :app_open_place, :app_order, :app_place,
  :app_view_date, :app_view_place, :doc_begin_date, :doc_end_date,
  :doc_order,:doc_place, :end_app_date, :name, :placing_date,
  :registry_number,:start_app_date, :tender_type_id, :customer_id, :tender_state_id
  
  validates :name, :presence => true, :length => { :minimum => 5}
  validates :tender_state_id, :presence => true
  validates :tender_type_id, :presence => true
  validates :customer_id, :presence => true
  validate :validate_app_view_date_after_app_open_date

  has_many :lots
  belongs_to :tender_type
  belongs_to :customer
  belongs_to :tender_state


  def validate_app_view_date_after_app_open_date
    if app_view_date && app_open_date
      errors.add(:app_view_date,"Should be after App open date") if app_view_date < app_open_date
    end
  end

  def self.search(sname, sreg_num, scustomer, stender_type, stender_state, sprice_s,sprice_do, date_reg_s,date_reg_po,placing_date_s,placing_date_po)
    if (sname)
      if (sname!="")
        cond1 = "name LIKE ?"
        val1 = "%#{sname}%"
      end
      if (sreg_num!="")
        cond2 = "registry_number LIKE ?"
        val2 = "%#{sreg_num}%"
      end
      if (scustomer!="0")
        cond3 = "customer_id = ?"
        val3 = scustomer
      end
      if (stender_type!="0")
        cond4 = "tender_type_id = ?"
        val4 = stender_type
      end
      if (stender_state!="0")
        cond5 = "tender_state_id = ?"
        val5 = stender_state
      end
      if (sprice_s!="")
        cond6 = "price >= ?"
        val6 = sprice_s
      end
      if (sprice_do!="")
        cond7 = "price <= ?"
        val7 = sprice_do
      end
      if (date_reg_s!="")
        cond8 = "created_at >= ?"
        val8 = date_reg_s
      end
      if (date_reg_po!="")
        cond9 = "created_at <= ?"
        val9 = date_reg_po
      end
      if (placing_date_s!="")
        cond10 = "placing_date >= ?"
        val10 = placing_date_s
      end
      if (placing_date_po!="")
        cond11 = "placing_date <= ?"
        val11 = placing_date_po
      end
      cond = [cond1,cond2,cond3,cond4,cond5,cond6,cond7,cond8,cond9,cond10,cond11].compact.join(' AND ')
      cond_val = [cond,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11].compact
      find(:all, :conditions => cond_val)
    else
      find(:all)
      end
  end
end
