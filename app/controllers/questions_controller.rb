class QuestionsController < ApplicationController
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc })

    render({ :template => "questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_questions = Question.where({ :id => the_id })

    @the_question = matching_questions.at(0)

    render({ :template => "questions/show.html.erb" })
  end

  def create
    the_question = Question.new
    the_question.user_id = params.fetch("query_user_id")
    the_question.question = params.fetch("query_question")
    the_question.patient_age = params.fetch("query_patient_age")
    the_question.medical_history = params.fetch("query_medical_history")
    the_question.epilepsy_type_id = params.fetch("query_epilepsy_type_id")

    if the_question.valid?
      the_question.save
      redirect_to("/questions", { :notice => "Question created successfully." })
    else
      redirect_to("/questions", { :alert => the_question.errors.full_messages.to_sentence })
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
end
