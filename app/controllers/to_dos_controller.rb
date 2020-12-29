class ToDosController < ApplicationController
  before_action :set_to_do, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /to_dos
  # GET /to_dos.json
  def index
    @to_dos = ToDo.all
  end

  # GET /to_dos/1
  # GET /to_dos/1.json
  def show
  end

  # GET /to_dos/new
  def new
    # @to_do = ToDo.new
    @to_do = current_user.to_dos.build
  end

  # GET /to_dos/1/edit
  def edit
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    # @to_do = ToDo.new(to_do_params)
    @to_do = current_user.to_dos.build(to_do_params)

    respond_to do |format|
      if @to_do.save
        format.html { redirect_to @to_do, notice: 'To do was successfully created.' }
        format.json { render :show, status: :created, location: @to_do }
      else
        format.html { render :new }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1
  # PATCH/PUT /to_dos/1.json
  def update
    respond_to do |format|
      if @to_do.update(to_do_params)
        format.html { redirect_to @to_do, notice: 'To do was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do }
      else
        format.html { render :edit }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do.destroy
    respond_to do |format|
      format.html { redirect_to to_dos_url, notice: 'To do was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @to_do = current_user.to_dos.find_by(id: params[:id])
    redirect_to to_dos_path, notice: "Not Authorized To Edit This Todo" if @to_do.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:to_do).permit(:task, :detail, :due_date, :due_time, :important, :repeat, :user_id)
    end
end
