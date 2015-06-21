# client/routes/home.coffee
Router.route '/', name: 'home'
class @HomeController extends BaseProfileController

  # is the user authorized?
  isUserPresent: ->
    !!Meteor.userId()

  # We are looking for user
  currentUserId: ->
    Meteor.userId()

  # render the profile template in case the user is authorized
  # and the homepage if otherwise
  action: ->
    if @isUserPresent()
      @render 'profile'
    else
      @render 'home'
