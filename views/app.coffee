angular.module('todo', ['ngRoute'])

.controller('HeaderController', ($scope, items, archivedItems)->
  $scope.title = 'a todo list with ng'
  $scope.items = items
  $scope.archivedItems = archivedItems
)

.controller('TodoController', ($scope, items, archivedItems)->
  $scope.items = items

  $scope.addItem = (newName)->
    if newName
      items.push {name: newName}
      $scope.newItem = ''
    return

  $scope.removeItem = (index)->
    items[index..index] = []

  $scope.checkItem = (index)->
    archivedItems.push items[index]
    items[index..index] = []
)

.controller('DoneController', ($scope, items, archivedItems)->
  $scope.items = archivedItems

  $scope.restoreItem = (index)->
    items.push archivedItems[index]
    archivedItems[index..index] = []

  $scope.removeItem = (index)->
    archivedItems[index..index] = []
)

.factory('items', ->
  [] # of {name:}
)

.factory('archivedItems', ->
  [] # of {name:}
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
  )
  .when('/done',
    templateUrl: '/done.html'
    controller: 'DoneController'
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
