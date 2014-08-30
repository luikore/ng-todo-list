class HeaderController
  constructor: (items, archivedItems)->
    @title = 'a todo list with ng'
    @items = items
    @archivedItems = archivedItems

class TodoController
  constructor: (items, archivedItems, newItem)->
    @items = items
    @newItem = newItem

    @addItem = ()->
      if newItem.content
        items.push {name: newItem.content}
        newItem.content = ''
      return

    @removeItem = (index)->
      items[index..index] = []

    @checkItem = (index)->
      archivedItems.push items[index]
      items[index..index] = []

class DoneController
  constructor: (items, archivedItems)->
    @items = archivedItems

    @restoreItem = (index)->
      items.push archivedItems[index]
      archivedItems[index..index] = []

    @removeItem = (index)->
      archivedItems[index..index] = []

angular.module('todo', ['ngRoute'])
.controller('HeaderController', HeaderController)
.controller('TodoController', TodoController)
.controller('DoneController', DoneController)

.factory('items', ->
  [] # of {name:}
)

.factory('archivedItems', ->
  [] # of {name:}
)

.factory('newItem', ->
  content: 'todo: make a todo list'
)

.filter('len', ->
  (a)->
    if a and a.length then "(#{a.length})" else ''
)

.config(($routeProvider, $locationProvider)->
  $routeProvider
  .when('/todo',
    templateUrl: '/todo.html'
    controller: 'TodoController'
    controllerAs: 'self'
  )
  .when('/done',
    templateUrl: '/done.html'
    controller: 'DoneController'
    controllerAs: 'self'
  )
  .when('/',
    redirectTo: '/todo'
  )
  $locationProvider.html5Mode(true)
)

.run(($rootScope, $location)->
  $rootScope.location = $location
)

elem = document.querySelector 'body'
angular.element(elem).ready ->
  angular.bootstrap elem, ['todo']
  return
