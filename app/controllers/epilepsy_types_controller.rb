class EpilepsyTypesController < ApplicationController
  def index
    matching_epilepsy_types = EpilepsyType.all

    @list_of_epilepsy_types = matching_epilepsy_types.order({ :created_at => :desc })

    render({ :template => "epilepsy_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_epilepsy_types = EpilepsyType.where({ :id => the_id })

    @the_epilepsy_type = matching_epilepsy_types.at(0)

    render({ :template => "epilepsy_types/show.html.erb" })
  end

  def create
    the_epilepsy_type = EpilepsyType.new
    the_epilepsy_type.seizure_name = params.fetch("query_seizure_name")
    the_epilepsy_type.questions_count = params.fetch("query_questions_count")
    the_epilepsy_type.comment_tags_count = params.fetch("query_comment_tags_count")

    if the_epilepsy_type.valid?
      the_epilepsy_type.save
      redirect_to("/epilepsy_types", { :notice => "Epilepsy type created successfully." })
    else
      redirect_to("/epilepsy_types", { :alert => the_epilepsy_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_epilepsy_type = EpilepsyType.where({ :id => the_id }).at(0)

    the_epilepsy_type.seizure_name = params.fetch("query_seizure_name")
    the_epilepsy_type.questions_count = params.fetch("query_questions_count")
    the_epilepsy_type.comment_tags_count = params.fetch("query_comment_tags_count")

    if the_epilepsy_type.valid?
      the_epilepsy_type.save
      redirect_to("/epilepsy_types/#{the_epilepsy_type.id}", { :notice => "Epilepsy type updated successfully."} )
    else
      redirect_to("/epilepsy_types/#{the_epilepsy_type.id}", { :alert => the_epilepsy_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_epilepsy_type = EpilepsyType.where({ :id => the_id }).at(0)

    the_epilepsy_type.destroy

    redirect_to("/epilepsy_types", { :notice => "Epilepsy type deleted successfully."} )
  end
end
