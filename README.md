# ng-todo-list

play ng, make a todo list

# build

    bundle
    ruby app.rb

# notes

### 2 styles of DI

the array style, can change names

    ['foo', '$bar',  (myFoo, myBar)->]

the function style, then `toString()` will be used to extract the injected props (may bahave bad after compression?)

    (foo, $bar)->

### inject into root scope

    .run ($rootScope, bar)->
      $rootScope.foo = bar

### share props with DI

    .factory('items', ->
      []
    )

### custom filter

filter is just a special type of injected property

note: should wrap one more function

    .filter('foo', ->
      (firstArgIsPassedThroughPipe)->
        ...
    )

### inline templates

stubs the "/todo.html" call and put it into template cache

    script type="text/ng-template" id="/todo.html"

### routing

1. load `angular-route.js` and add `ngRoute` to module dependency first

2. `ng-view` is required to display views

3. config routing (so we bind controller with `when()` instead of `ng-controller` attribute)

        .config(($routeProvider, $locationProvider)->
          $routeProvider
          .when('/todo',
            templateUrl: '/todo.html'
            controller: 'TodoController'
          )
          .when('/',
            redirectTo: '/todo'
          )
          $locationProvider.html5Mode(true)
        )

### on coffee

add `()` in top level chain calls, so the `.` on beginning of line won't be confused

### model: connect input value with properties

    input ng-model="newItem.content"

### eliminating `$scope`: controller as

See also

http://toddmotto.com/digging-into-angulars-controller-as-syntax/

First, turn a controller into a class and the function into the initializer

    class TodoController
      constructor: (injectedFoo, injectedBar)->
        @foo = ...
        @bar = ...

Then, use controllerAs:

- if in template, `TodoController as self`
- if in router, `controllerAs: 'self'`

Then, in view we use `self` to access `@foo` and `@bar`

names other than `self` is also ok, but `self` just looks better

### notes on debug

See also

https://www.ng-book.com/p/Debugging-AngularJS/

    e = angular.element(document.querySelector('html'))
    e.controller()
    e.injector().get('SomeService')
    e.inheritedData()
