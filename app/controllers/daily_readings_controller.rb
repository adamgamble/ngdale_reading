class DailyReadingsController < ApplicationController
  # GET /daily_readings
  # GET /daily_readings.json
  def index
    @daily_readings = DailyReading.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_readings }
    end
  end

  # GET /daily_readings/1
  # GET /daily_readings/1.json
  def show
    @daily_reading = DailyReading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_reading }
    end
  end

  # GET /daily_readings/new
  # GET /daily_readings/new.json
  def new
    @daily_reading = DailyReading.new
    @daily_reading.date = DailyReading.last.date + 1.day

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_reading }
    end
  end

  # GET /daily_readings/1/edit
  def edit
    @daily_reading = DailyReading.find(params[:id])
  end

  # POST /daily_readings
  # POST /daily_readings.json
  def create
    params[:daily_reading][:date] = Time.zone.parse(params[:daily_reading][:date]).to_date
    @daily_reading = DailyReading.new(params[:daily_reading])

    respond_to do |format|
      if @daily_reading.save
        format.html { redirect_to @daily_reading, notice: 'Daily reading was successfully created.' }
        format.json { render json: @daily_reading, status: :created, location: @daily_reading }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_readings/1
  # PUT /daily_readings/1.json
  def update
    params[:daily_reading][:date] = Time.zone.parse(params[:daily_reading][:date]).to_date
    @daily_reading = DailyReading.find(params[:id])

    respond_to do |format|
      if @daily_reading.update_attributes(params[:daily_reading])
        format.html { redirect_to @daily_reading, notice: 'Daily reading was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_readings/1
  # DELETE /daily_readings/1.json
  def destroy
    @daily_reading = DailyReading.find(params[:id])
    @daily_reading.destroy

    respond_to do |format|
      format.html { redirect_to daily_readings_url }
      format.json { head :ok }
    end
  end
end
