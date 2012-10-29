class SimpleApp.Post extends Batman.Model
  @resourceName: 'post'
  @storageKey: 'posts'

  @persist Batman.RailsStorage

  # fields
  @encode "title", "content"
  @hasMany "comments"

  # validations
  @validate "title", presence: true
  @validate "content", presence: true