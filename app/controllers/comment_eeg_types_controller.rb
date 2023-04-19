class CommentEegTypesController < ApplicationController
  def index
    matching_comment_eeg_types = CommentEegType.all

    @list_of_comment_eeg_types = matching_comment_eeg_types.order({ :created_at => :desc })

    render({ :template => "comment_eeg_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comment_eeg_types = CommentEegType.where({ :id => the_id })

    @the_comment_eeg_type = matching_comment_eeg_types.at(0)

    render({ :template => "comment_eeg_types/show.html.erb" })
  end

  def create
    the_comment_eeg_type = CommentEegType.new
    the_comment_eeg_type.comment_id = params.fetch("query_comment_id")
    the_comment_eeg_type.eeg_type_id = params.fetch("query_eeg_type_id")
    the_comment_eeg_type.epilepsy_type_id = params.fetch("query_epilepsy_type_id")

    if the_comment_eeg_type.valid?
      the_comment_eeg_type.save
      redirect_to("/comment_eeg_types", { :notice => "Comment eeg type created successfully." })
    else
      redirect_to("/comment_eeg_types", { :alert => the_comment_eeg_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment_eeg_type = CommentEegType.where({ :id => the_id }).at(0)

    the_comment_eeg_type.comment_id = params.fetch("query_comment_id")
    the_comment_eeg_type.eeg_type_id = params.fetch("query_eeg_type_id")
    the_comment_eeg_type.epilepsy_type_id = params.fetch("query_epilepsy_type_id")

    if the_comment_eeg_type.valid?
      the_comment_eeg_type.save
      redirect_to("/comment_eeg_types/#{the_comment_eeg_type.id}", { :notice => "Comment eeg type updated successfully."} )
    else
      redirect_to("/comment_eeg_types/#{the_comment_eeg_type.id}", { :alert => the_comment_eeg_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment_eeg_type = CommentEegType.where({ :id => the_id }).at(0)

    the_comment_eeg_type.destroy

    redirect_to("/comment_eeg_types", { :notice => "Comment eeg type deleted successfully."} )
  end
end
