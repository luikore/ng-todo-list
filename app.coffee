angular.module('todo', []).controller 'TodoController', ($scope)->
  $scope.title = 'a todo list with ng'
  $scope.items = [{checked: false, name: 'The very first item'}]

  $scope.addItem = (newName)->
    $scope.items.push {checked: false, name: newName}
    $scope.newItem = ''
    return

  $scope.removeItem = (index)->
    $scope.items[index..index] = []
    return

  $scope.checkItem = (index)->
    $scope.items[index].checked = true

elem = document.querySelector '#wrap'
angular.element(elem).ready ->
  angular.bootstrap elem, ['todo']
  return
