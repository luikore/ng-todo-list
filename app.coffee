angular.module('todo', []).controller 'TodoController', ($scope)->
  $scope.title = 'a todo list with ng'
  return

elem = document.querySelector '#wrap'
angular.element(elem).ready ->
  angular.bootstrap elem, ['todo']
  return
