# client/lib/pageable_route_controller.coffee
varName = (inst, name = null) ->
  name = name && "_#{name}" || ""
  "#{inst.constructor.name}#{name}_limit"

class @PagableRouteController extends RouteController

  pageable: true # will check what kind of controller
  perPage: 20    # the amount of data on a single page

  # the amount of downloaded data
  limit: (name = null) ->
    Session.get(varName(@, name)) || @perPage

  # next page
  incLimit: (name = null, inc = null) ->
    inc ||= @perPage
    Session.set varName(@, name), (@limit(name) + inc)

  # sbors number
  resetLimit: (name = null) ->
    Session.set varName(@, name), null

  # whether all the data has been downloaded?
  loaded: (name = null) ->
    true
