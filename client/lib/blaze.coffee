# We describe the helpers that will be available in all templates
helpers =
  valueFromPath: (object = {}, path) ->
    ObjAndPath.valueFromPath(object, path)

  nameFromPath: (base, path) ->
    ObjAndPath.valueFromPath(base, path)

  isHomePage: ->
    Router.current() instanceof HomeController

# add helpers in Blaze
_(helpers).map (value, key) -> Blaze.registerHelper(key, value)
