class LotsController < ApplicationController
	def create
    @tender = Tender.find(params[:tender_id])
    @lot = @tender.lots.create(params[:lot])
    if(@lot.valid?)
      redirect_to tender_lot_path(@lot.tender,@lot), notice: t(:Lot_was_successfully_created)
    else
      render action: "new"
    end
  end

  def show
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lot }
    end
  end

  def new
    @tender = Tender.find(params[:tender_id])
    @lot = @tender.lots.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lot }
    end
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    @lot = Lot.find(params[:id])

    respond_to do |format|
      if @lot.update_attributes(params[:lot])
        format.html { redirect_to tender_lot_path(@lot.tender,@lot), notice: t(:Lot_was_successfully_updated) }
        format.json { head :no_content }
      else
        format.html {
          #flash[:notice] = "qw"
          render action: "edit"
        }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender = Tender.find(params[:tender_id])
    @lot = Lot.find(params[:id])
    @lot.destroy

    respond_to do |format|
      format.html { redirect_to @tender }
      format.json { head :no_content }
    end
  end
end
