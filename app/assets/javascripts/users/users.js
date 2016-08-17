angular.module('angular-rails').factory('users', [
  '$http',
  function($http){
    var o = {
      users: []
    };

    o.find = function(id) {
      return $http.get('/users/' + id + '.json').then(function(res){
        return res.data;
      });
    };

    o.all = function() {
      return $http.get('/users.json').success(function(data){
        angular.copy(data, o.users);
      });
    };

    o.create = function(user) {
      return $http.post('/users.json', user).success(function(data){
        o.users.push(data);
      });
    };

    o.update = function(obj) {
      return $http.put('/users/' + obj.user.id + '.json', obj);
    };

    o.destroy = function(user) {
      return $http.delete('/users/' + user.id + '.json');
    };

    return o;
  }
]);
