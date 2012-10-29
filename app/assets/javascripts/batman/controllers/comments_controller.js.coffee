class SimpleApp.CommentsController extends Batman.Controller
  routingKey: 'comments'

  show: (params) ->
    comment = new SimpleApp.Comment(id: params.id, post_id: params.postId)
    comment.load (err,result)  =>
      throw err if err
      @set 'comment', result

  edit: (params) ->
    comment = new SimpleApp.Comment(id: params.id, post_id: params.postId)
    comment.load (err,result) =>
      throw err if err
      @set 'comment', result
    @form = @render()

  new: (params) ->
    @set 'comment', new SimpleApp.Comment(post_id: params.postId)
    @form = @render()

  create: (params) ->
    @new_comment = @get('comment')
    @new_comment.save (err,record) =>
      $('#new_comment').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
        #@set 'comment', record
      else
        SimpleApp.flashSuccess "Comment created successfully!"
        @redirect '/posts/' + @new_comment.get('post_id')

  update: (params) ->
    @new_comment = @get('comment')
    @new_comment.save (err,record) =>
      $('#new_comment').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
        #@set 'comment', record
      else
        SimpleApp.flashSuccess "Comment updated successfully!"
        @redirect '/posts/' + @new_comment.get('post_id')

  destroy: ->
    @new_comment = @get('comment')
    @new_comment.destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        SimpleApp.flashSuccess "Removed successfully!"
        @redirect '/posts/' + @new_comment.get('post_id')



