class MeasuresController < ApplicationController
def index
    @measures = Measure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measures }
    end
  end
  def show
    @measure = Measure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measure }
    end
  end

  def new
    @measure = Measure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measure }
    end
  end

  def edit
    @measure = Measure.find(params[:id])
  end

  def create
    @measure = Measure.new(params[:measure])

    respond_to do |format|
      if @measure.save
        format.html { redirect_to @measure, notice: 'Tender type was successfully created.' }
        format.json { render json: @measure, status: :created, location: @measure }
      else
        format.html { render action: "new" }
        format.json { render json: @tender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @measure = Measure.find(params[:id])

    respond_to do |format|
      if @measure.update_attributes(params[:measure])
        format.html { redirect_to @measure, notice: 'Tender type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measure = Measure.find(params[:id])
    @measure.destroy

    respond_to do |format|
      format.html { redirect_to tender_types_url }
      format.json { head :no_content }
    end
  end
end
