class DummyRecordsController < ApplicationController
  load_and_authorize_resource

  # GET /dummy_records
  # GET /dummy_records.json
  def index
    @dummy_records = DummyRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dummy_records }
    end
  end

  # GET /dummy_records/1
  # GET /dummy_records/1.json
  def show
    @dummy_record = DummyRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dummy_record }
    end
  end

  # GET /dummy_records/new
  # GET /dummy_records/new.json
  def new
    @dummy_record = DummyRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dummy_record }
    end
  end

  # GET /dummy_records/1/edit
  def edit
    @dummy_record = DummyRecord.find(params[:id])
  end

  # POST /dummy_records
  # POST /dummy_records.json
  def create
    @dummy_record = DummyRecord.new(params[:dummy_record])

    respond_to do |format|
      if @dummy_record.save
        format.html { redirect_to @dummy_record, :notice => 'Dummy record was successfully created.' }
        format.json { render :json => @dummy_record, :status => :created, :location => @dummy_record }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dummy_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dummy_records/1
  # PUT /dummy_records/1.json
  def update
    @dummy_record = DummyRecord.find(params[:id])

    respond_to do |format|
      if @dummy_record.update_attributes(params[:dummy_record])
        format.html { redirect_to @dummy_record, :notice => 'Dummy record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dummy_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dummy_records/1
  # DELETE /dummy_records/1.json
  def destroy
    @dummy_record = DummyRecord.find(params[:id])
    @dummy_record.destroy

    respond_to do |format|
      format.html { redirect_to dummy_records_url }
      format.json { head :no_content }
    end
  end
end
