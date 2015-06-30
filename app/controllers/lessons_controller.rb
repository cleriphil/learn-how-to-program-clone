class LessonsController < ApplicationController
  def index
    @section = Section.find(params[:section_id])
    @lessons = Lesson.order(:number)
  end
  # get rid of index

  def new
      @section = Section.find(params[:section_id])
      @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson successfully added!!"
      redirect_to section_path(@section)
    else
      render :new
    end
  end

  def show
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @previous = Lesson.where("number < ?", @lesson.number).last
    @next = Lesson.where("number > ?", @lesson.number).first
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to section_lesson_path(@section, @lesson)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to section_path(@section)
  end


  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number)
  end
end
