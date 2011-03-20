class Component < ActiveRecord::Base
  cattr_reader :component_types

  has_many :task_components, :dependent => :destroy
  has_many :tasks, :through => :task_components

  if Rails.env.production?
    has_attached_file :media,
      :storage => :s3,
      :bucket => "paal_web_app",
      :s3_credentials => {
        :access_key_id => ENV["S3_KEY"],
        :secret_access_key => ENV["S3_SECRET"]
      }
  else
    has_attached_file :media
  end

  validate :valid_component_type?
  validates_attachment_presence :media
  validates_attachment_content_type :media, :content_type => ["audio/mpeg", "audio/mp3", "image/jpeg", "image/png", "image/gif"]

  @@component_types = %w(audio image)

  private

  def valid_component_type?
    unless @@component_types.include?(component_type)
      errors.add(:component_type, "Invalid component type. Please use one of the following #{@@component_types.to_s}")
    end
  end
end
