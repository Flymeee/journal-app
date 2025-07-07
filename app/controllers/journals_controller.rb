class JournalsController < ApplicationController
  before_action :authenticate_user!
  def index
    @journals = current_user.journal_entries
  end

  def create
    @journal_entry = current_user.journal_entries.build(journal_entry_params)
    if @journal_entry.save
      redirect_to @journal_entry, notice: 'Journal entry was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
