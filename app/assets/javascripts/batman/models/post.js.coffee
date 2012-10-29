class SimpleApp.Post extends Batman.Model
  @resourceName: 'post'
  @storageKey: 'posts'

  @persist Batman.RailsStorage

  # fields
  @encode "title", "content"
  @encode "created_at", Batman.Encoders.railsDate
  @encode "updated_at", Batman.Encoders.railsDate
  @hasMany "comments"

  # validations
  @validate "title", presence: true
  @validate "content", presence: true