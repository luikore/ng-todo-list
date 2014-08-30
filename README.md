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
