class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: %i[ show edit update destroy ]
 
  def index
    @journal_entries = JournalEntry.all
  end

  def show
  end
  
  def new
    @journal_entry = current_user.journal_entries.build
    if params[:category_id].present?
      @journal_entry.category_id = params[:category_id]
    end
  end

  def edit
  end

  def create
    @journal_entry = current_user.journal_entries.build(journal_entry_params) # <= Make sure this line is correct!
    respond_to do |format|
      if @journal_entry.save
        format.html { redirect_to journal_entry_url(@journal_entry), notice: "Journal entry was successfully created." }
        format.json { render :show, status: :created, location: @journal_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @journal_entry.update(journal_entry_params)
        format.html { redirect_to @journal_entry, notice: "Journal entry was successfully updated." }
        format.json { render :show, status: :ok, location: @journal_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journal_entry.destroy!

    respond_to do |format|
      format.html { redirect_to journal_entries_path, status: :see_other, notice: "Journal entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_journal_entry
      @journal_entry = current_user.journal_entries.find(params[:id])
    end

    def journal_entry_params
      params.require(:journal_entry).permit(:title, :content, :category_id)
    end
end
