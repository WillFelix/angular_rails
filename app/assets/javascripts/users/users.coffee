angular.module('angular-rails').factory 'users', [
  '$http'
  ($http) ->
    o = users: []

    o.find = (id) ->
      $http.get('/users/' + id + '.json').then (res) ->
        res.data

    o.all = ->
      $http.get('/users.json').success (data) ->
        angular.copy data, o.users
        return

    o.create = (user) ->
      $http.post('/users.json', user).success (data) ->
        o.users.push data
        return

    o.update = (obj) ->
      $http.put '/users/' + obj.user.id + '.json', obj

    o.destroy = (user) ->
      $http.delete '/users/' + user.id + '.json'

    o
]
