class SimpleApp.Comment extends Batman.Model
  @resourceName: 'comment'
  @storageKey: 'comments'

  # saving everything to the Rails backend
  # gives validation errors
  @persist Batman.RailsStorage

  # fields
  @encode "content", "id", "post_id"
  @encode "created_at", Batman.Encoders.railsDate
  @encode "updated_at", Batman.Encoders.railsDate

  # validations
  @validate "content", presence: true

  # associations
  @belongsTo 'post', { inverseOf: 'comments'}

  # indicates that rails is nesting resources, shallow!
  @urlNestsUnder 'post'
