class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
  # GET /lecturers
  # GET /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1
  # GET /lecturers/1.json
  def show
    @reviews = Review.where(lecturer_id: @lecturer.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0;
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /lecturers/new
  def new
      @lecturer = current_user.lecturers.build
  end

  # GET /lecturers/1/edit
  def edit
  end

  # POST /lecturers
  # POST /lecturers.json
  def create
    @lecturer = current_user.lecturers.build(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecturers/1
  # PATCH/PUT /lecturers/1.json
  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1
  # DELETE /lecturers/1.json
  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecturer_params
      params.require(:lecturer).permit(:firstname, :lastname, :age, :rating, :image)
    end
end
