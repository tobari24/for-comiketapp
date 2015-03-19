class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]
  before_action :set_circlelist, only: [:circlelist]

  # GET /circles
  # GET /circles.json
  def index
    @circles = Circle.all
  end
  
  def circlelist
    @circles = Circle.where(date: params[:id])
  end
  
  def mychecklist
    @id = current_user.id 
    @mylist = Circle.joins(items: :orders).uniq.where(["quantity is not ? and user_id = ? and date = ?",nil, @id, params[:id]])
  end

  def groupchecklist
    @lists = Circle.joins(items: :orders).uniq.where(["quantity is not ? and date = ?",nil, params[:id]])
  end
  # GET /circles/1
  # GET /circles/1.json
  def show
  end

  # GET /circles/new
  def new
    @circle = Circle.new
  end

  # GET /circles/1/edit
  def edit
  end

  # POST /circles
  # POST /circles.json
  def create
    @circle = Circle.new(circle_params)

    respond_to do |format|
      if @circle.save
        format.html { redirect_to @circle, notice: '1件のサークルを登録しました。' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /circles/1
  # PATCH/PUT /circles/1.json
  def update
    respond_to do |format|
      if @circle.update(circle_params)
        format.html { redirect_to @circle, notice: 'サークル情報を更新しました。' }
        format.json { render :show, status: :ok, location: @circle }
      else
        format.html { render :edit }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle.destroy
    respond_to do |format|
      format.html { redirect_to circles_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

  def set_circlelist
    @circles = Circle.where(date: [:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(:name, :url, :date, :space)
    end
end
