# client/lib/base_profile_controller.coffee
class @BaseProfileController extends PagableRouteController

  # We are using ready-made templates
  template: 'profile'

  currentUserId: ->
    false

  # subscribe on the boards of the current user
  subscriptions: ->
    if @currentUserId()
      [
        @subscribe 'user', @currentUserId()
        @subscribe 'boards', @currentUserId(), @limit('boards')
      ]

  # return information about the current user, if available
  data: ->
    if @currentUserId()
      {
        user:   UsersCollection.findOne @currentUserId()
        boards: BoardsCollection.findByUser @currentUserId(), {sort: { createdAt: -1 }}
      }

  loaded: (name) ->
    switch name
      when 'boards' then @limit('boards') > @data().boards.count()
      else false

  onRun: ->
    if @currentUserId()
      @resetLimit('boards')
    @next()
