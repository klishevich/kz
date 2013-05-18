class ProductionsController < ApplicationController
	def create
    @lot = Lot.find(params[:lot_id])
    @production = @lot.productions.create(params[:production])
    if(@production.valid?)
      redirect_to tender_lot_production_path(@production.lot.tender, @production.lot, @production), notice: t(:Production_was_successfully_created)
    else
      render action: "new"
    end
  end

  def show
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:lot_id])
    @production = Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production }
    end
  end

  def new
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:lot_id])
    @production = @lot.productions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production }
    end
  end

  def edit
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:lot_id])
    @production = Production.find(params[:id])
  end

  def update
    @production = Production.find(params[:id])

    respond_to do |format|
      if @production.update_attributes(params[:production])
        format.html { redirect_to tender_lot_production_path(@production.lot.tender, @production.lot, @production),
                                  notice: t(:Production_was_successfully_updated) }
        format.json { head :no_content }
      else
        format.html {
          #flash[:notice] = "qw"
          render action: "edit"
        }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:lot_id])
    @production = Production.find(params[:id])
    @production.destroy

    respond_to do |format|
      format.html { redirect_to tender_lot_path(@tender,@lot) }
      format.json { head :no_content }
    end
  end
end
