class SimpleApp.PostsController extends Batman.Controller
  routingKey: 'posts'

  index: (params) ->
    SimpleApp.Post.load (err,results) =>
      @set 'posts', results

  show: (params) ->
    @set 'post', SimpleApp.Post.find parseInt(params.id, 10), (err) ->
      throw err if err

    @render source: 'posts/show'

  new: (params) ->
    @set 'post', new SimpleApp.Post()
    @form = @render()

  create: (params) ->
    @get('post').save (err) =>
      $('#new_post').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        SimpleApp.flashSuccess "#{@get('post.title')} created successfully!"
        @redirect '/posts'

  edit: (params) ->
    @set 'post', SimpleApp.Post.find parseInt(params.id, 10), (err) ->
      throw err if err
    @form = @render()

  update: (params) ->
    @get('post').save (err) =>
      $('#edit_post').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        SimpleApp.flashSuccess "#{@get('post.title')} updated successfully!"
        @redirect '/posts'

  # not routable, an event
  destroy: ->
    @get('post').destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        SimpleApp.flashSuccess "Removed successfully!"
        @redirect '/posts'