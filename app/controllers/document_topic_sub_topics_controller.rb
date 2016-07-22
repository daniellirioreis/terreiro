class DocumentTopicSubTopicsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_document_topic_sub_topic, only: [:show, :edit, :update, :destroy]

  # GET /document_topic_sub_topics
  # GET /document_topic_sub_topics.json
  def index
    @document_topic_sub_topics = DocumentTopicSubTopic.all
  end

  # GET /document_topic_sub_topics/1
  # GET /document_topic_sub_topics/1.json
  def show
  end

  # GET /document_topic_sub_topics/new
  def new
    @document_topic_sub_topic = DocumentTopicSubTopic.new
  end

  # GET /document_topic_sub_topics/1/edit
  def edit
  end

  # POST /document_topic_sub_topics
  # POST /document_topic_sub_topics.json
  def create
    @document_topic_sub_topic = DocumentTopicSubTopic.new(document_topic_sub_topic_params)

    respond_to do |format|
      if @document_topic_sub_topic.save
        format.html { redirect_to @document_topic_sub_topic, notice: 'Document topic sub topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document_topic_sub_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @document_topic_sub_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_topic_sub_topics/1
  # PATCH/PUT /document_topic_sub_topics/1.json
  def update
    respond_to do |format|
      if @document_topic_sub_topic.update(document_topic_sub_topic_params)
        format.html { redirect_to @document_topic_sub_topic, notice: 'Document topic sub topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document_topic_sub_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_topic_sub_topics/1
  # DELETE /document_topic_sub_topics/1.json
  def destroy
    @document_topic_sub_topic.destroy
    respond_to do |format|
      format.html { redirect_to document_topic_sub_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_topic_sub_topic
      @document_topic_sub_topic = DocumentTopicSubTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_topic_sub_topic_params
      params.require(:document_topic_sub_topic).permit(:document_topic_id, :number, :name, :description)
    end
end
