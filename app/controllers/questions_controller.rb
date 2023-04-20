class QuestionsController < ApplicationController

  
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc })
    @questions = @list_of_questions.paginate(page: params[:page], per_page: 10)

    if @current_user == nil
      redirect_to("/user_sign_in")
    else
    render({ :template => "questions/index.html.erb" })
    end
  end

  def show
    the_id = @current_user.id 

    @matching_questions = Question.where({ :user_id => the_id })

    #@the_question = matching_questions.a

    render({ :template => "questions/show.html.erb" })
  end

  def zebra_create

     create_count=0
    the_question = Question.new
    the_question.user_id = @current_user.id
    the_question.question = params.fetch("query_question")
    the_question.patient_age = params.fetch("query_patient_age")
    the_question.medical_history = params.fetch("query_medical_history")
    
    if the_question.valid?
      the_question.save

      the_photo = Photo.new
      the_photo.question_id = the_question.id
      the_photo.image= params.fetch("query_image")
      
      if the_image.valid?
      the_photo.save
      count+= 1
      end

      if count == 1
      redirect_to("/photo_details", { :notice => "Image was saved successfully." })

     else
      redirect_to("/", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end
end

  def update
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.user_id = params.fetch("query_user_id")
    the_question.question = params.fetch("query_question")
    the_question.patient_age = params.fetch("query_patient_age")
    the_question.medical_history = params.fetch("query_medical_history")
    the_question.epilepsy_type_id = params.fetch("query_epilepsy_type_id")

    if the_question.valid?
      the_question.save
      redirect_to("/questions/#{the_question.id}", { :notice => "Question updated successfully."} )
    else
      redirect_to("/questions/#{the_question.id}", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.destroy

    redirect_to("/questions", { :notice => "Question deleted successfully."} )
  end



  ########

  def create_form
    render({ :template => "questions/new_post.html.erb" })
 end


  # def show_user_posts
  #   matching_questions = Question.where({ :user_id => @current_user.id })

  #   @the_question = matching_questions.at(0)

  #   render({ :template => "questions/show.html.erb" })
  # end

end
