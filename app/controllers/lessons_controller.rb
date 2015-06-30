class LessonsController < ApplicationController
  def index
    @lessons = Lesson.order(:number)
  end

  def new
      @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson successfully added!!"
      redirect_to lessons_path
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @previous = Lesson.where("number < ?", @lesson.number).last
    @next = Lesson.where("number > ?", @lesson.number).first
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end


  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number)
  end
end
