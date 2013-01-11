class AttachmentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @attachments = @post.attachments
    respond_to do |format|
      format.json { render :json => @attachments}
    end
  end

  def show
    @attachment = Attachment.find(params[:id])
    respond_to do |format|
      format.json { render json: @attachment.as_json }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @attachment = @post.attachments.build(params[:attachment])
    respond_to do |format|
      if @attachment.save
        format.json { render :json => [@attachment.to_jq_upload ].to_json }
      else
        format.json { render :json => [@attachment.to_jq_upload.merge({:error => "custom_failure"}) ].to_json}
      end
    end
  end

  def update
    @attachment = Attachment.find(params[:id])
    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.json { render :json => @attachment }
      else
        format.json { render :json => @attachment.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok}
    end
  end
end
