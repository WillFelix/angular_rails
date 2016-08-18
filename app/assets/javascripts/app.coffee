angular.module('angular-rails', [
  'ui.router'
  'ngMaterial'
  'ngMessages'
  'templates'
]).config [
  '$stateProvider'
  '$urlRouterProvider'

  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('users',
      url: '/users'
      templateUrl: '/views/users/index.html'
      controller: 'UsersCtrl'
      resolve:
        postPromise: [
          'users'
          (users) ->
            users.all()
        ]
        user: ->
    ).state('user',
      url: '/user/{id}'
      templateUrl: '/views/users/show.html'
      controller: 'UsersCtrl'
      resolve: user: ($stateParams, users) ->
        users.find $stateParams.id
    ).state('newUser',
      url: '/users/new'
      templateUrl: '/views/users/new.html'
      controller: 'UsersCtrl'
      resolve: user: ->
    ).state 'editUser',
      url: '/user/{id}/edit'
      templateUrl: '/views/users/edit.html'
      controller: 'UsersCtrl'
      resolve: user: ($stateParams, users) ->
        users.find $stateParams.id
    $urlRouterProvider.otherwise 'users'
    return
]
