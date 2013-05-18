class TenderStatesController < ApplicationController
  # GET /tender_states
  # GET /tender_states.json
  def index
    @tender_states = TenderState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tender_states }
    end
  end

  # GET /tender_states/1
  # GET /tender_states/1.json
  def show
    @tender_state = TenderState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tender_state }
    end
  end

  # GET /tender_states/new
  # GET /tender_states/new.json
  def new
    @tender_state = TenderState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tender_state }
    end
  end

  # GET /tender_states/1/edit
  def edit
    @tender_state = TenderState.find(params[:id])
  end

  # POST /tender_states
  # POST /tender_states.json
  def create
    @tender_state = TenderState.new(params[:tender_state])

    respond_to do |format|
      if @tender_state.save
        format.html { redirect_to @tender_state, notice: 'Tender state was successfully created.' }
        format.json { render json: @tender_state, status: :created, location: @tender_state }
      else
        format.html { render action: "new" }
        format.json { render json: @tender_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tender_states/1
  # PUT /tender_states/1.json
  def update
    @tender_state = TenderState.find(params[:id])

    respond_to do |format|
      if @tender_state.update_attributes(params[:tender_state])
        format.html { redirect_to @tender_state, notice: 'Tender state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tender_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tender_states/1
  # DELETE /tender_states/1.json
  def destroy
    @tender_state = TenderState.find(params[:id])
    @tender_state.destroy

    respond_to do |format|
      format.html { redirect_to tender_states_url }
      format.json { head :no_content }
    end
  end
end
