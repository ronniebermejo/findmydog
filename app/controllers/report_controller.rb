class ReportController < ApplicationController

  def index
  end

  def new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @form_data = @s3_direct_post.fields.to_json
    @s3_direct_post
  end

end
