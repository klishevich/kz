class TenderTypesController < ApplicationController
def index
    @ttypes = TenderType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ttypes }
    end
  end
  def show
    @ttype = TenderType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ttype }
    end
  end

  def new
    @ttype = TenderType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ttype }
    end
  end

  def edit
    @ttype = TenderType.find(params[:id])
  end

  def create
    @ttype = TenderType.new(params[:tender_type])

    respond_to do |format|
      if @ttype.save
        format.html { redirect_to @ttype, notice: 'Tender type was successfully created.' }
        format.json { render json: @ttype, status: :created, location: @ttype }
      else
        format.html { render action: "new" }
        format.json { render json: @tender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ttype = TenderType.find(params[:id])

    respond_to do |format|
      if @ttype.update_attributes(params[:tender_type])
        format.html { redirect_to @ttype, notice: 'Tender type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ttype.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ttype = TenderType.find(params[:id])
    @ttype.destroy

    respond_to do |format|
      format.html { redirect_to tender_types_url }
      format.json { head :no_content }
    end
  end
end

