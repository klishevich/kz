class TendersController < ApplicationController
  # GET /tenders
  # GET /tenders.json
  def index
    start_default = Date.civil(2010,1,1)
    end_default  = Date.civil(2015,1,1)
    @date_reg_s=Date.civil(params[:sdate_reg_s][:year].to_i,params[:sdate_reg_s][:month].to_i,params[:sdate_reg_s][:day].to_i) rescue start_default
    @date_reg_po=Date.civil(params[:sdate_reg_po][:year].to_i,params[:sdate_reg_po][:month].to_i,params[:sdate_reg_po][:day].to_i) rescue end_default
    @placing_date_s=Date.civil(params[:splacing_date_s][:year].to_i,params[:splacing_date_s][:month].to_i,params[:splacing_date_s][:day].to_i) rescue start_default
    @placing_date_po=Date.civil(params[:splacing_date_po][:year].to_i,params[:splacing_date_po][:month].to_i,params[:splacing_date_po][:day].to_i) rescue end_default
    @tenders = Tender.search(params[:sname], params[:sreg_num], params[:scustomer], params[:stender_type],
    params[:stender_state],params[:sprice_s],params[:sprice_do],@date_reg_s,@date_reg_po,@placing_date_s,@placing_date_po)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenders }
    end
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show
    @tender = Tender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tender }
    end
  end

  # GET /tenders/new
  # GET /tenders/new.json
  def new
    @tender = Tender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tender }
    end
  end

  # GET /tenders/1/edit
  def edit
    @tender = Tender.find(params[:id])
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(params[:tender])

    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: t(:Tender_created) }
        format.json { render json: @tender, status: :created, location: @tender }
      else
        format.html { render action: "new" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tenders/1
  # PUT /tenders/1.json
  def update
    @tender = Tender.find(params[:id])

    respond_to do |format|
      if @tender.update_attributes(params[:tender])
        format.html { redirect_to @tender, notice: t(:Tender_was_successfully_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender = Tender.find(params[:id])
    @tender.destroy

    respond_to do |format|
      format.html { redirect_to tenders_url }
      format.json { head :no_content }
    end
  end

end
