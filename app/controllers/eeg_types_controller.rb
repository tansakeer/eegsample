class EegTypesController < ApplicationController
  def index
    matching_eeg_types = EegType.all

    @list_of_eeg_types = matching_eeg_types.order({ :created_at => :desc })

    render({ :template => "eeg_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_eeg_types = EegType.where({ :id => the_id })

    @the_eeg_type = matching_eeg_types.at(0)

    render({ :template => "eeg_types/show.html.erb" })
  end

  def create
    the_eeg_type = EegType.new
    the_eeg_type.name = params.fetch("query_name")
    the_eeg_type.wave_frequency = params.fetch("query_wave_frequency")

    if the_eeg_type.valid?
      the_eeg_type.save
      redirect_to("/eeg_types", { :notice => "Eeg type created successfully." })
    else
      redirect_to("/eeg_types", { :alert => the_eeg_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_eeg_type = EegType.where({ :id => the_id }).at(0)

    the_eeg_type.name = params.fetch("query_name")
    the_eeg_type.wave_frequency = params.fetch("query_wave_frequency")

    if the_eeg_type.valid?
      the_eeg_type.save
      redirect_to("/eeg_types/#{the_eeg_type.id}", { :notice => "Eeg type updated successfully."} )
    else
      redirect_to("/eeg_types/#{the_eeg_type.id}", { :alert => the_eeg_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_eeg_type = EegType.where({ :id => the_id }).at(0)

    the_eeg_type.destroy

    redirect_to("/eeg_types", { :notice => "Eeg type deleted successfully."} )
  end
end
