angular.module('angular-rails', ['ui.router', 'ngMaterial', 'templates'])
.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
    .state('users', {
      url: '/users',
      templateUrl: '/assets/users/views/index.html',
      controller: 'UsersCtrl',
      resolve: {
        postPromise: ['users', function(users) {
          return users.all();
        }],
        user: function(){}
      }
    })

    .state('user', {
      url: '/user/{id}',
      templateUrl: '/assets/users/views/show.html',
      controller: 'UsersCtrl',
      resolve: {
        user: function($stateParams, users) {
          return users.find($stateParams.id);
        }
      }
    })

    .state('newUser', {
      url: '/users/new',
      templateUrl: '/assets/users/views/new.html',
      controller: 'UsersCtrl',
      resolve: {
        user: function(){}
      }
    })

    .state('editUser', {
      url: '/user/{id}/edit',
      templateUrl: '/assets/users/views/edit.html',
      controller: 'UsersCtrl',
      resolve: {
        user: function($stateParams, users) {
          return users.find($stateParams.id);
        }
      }
    });

    $urlRouterProvider.otherwise('users');
  }
]);
