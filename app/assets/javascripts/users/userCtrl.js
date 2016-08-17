angular.module("angular-rails").controller('UsersCtrl', [
  '$scope',
  '$location',
  '$mdToast',
  'users',
  'user',
  function($scope, $location, $mdToast, users, user){
    if (user != null && $location.$$path.indexOf('edit') > 0) {
      user.birthdate = new Date(user.birthdate);
    }
    $scope.user = user;
    $scope.users = users.users;

    $scope.edit = function(user) {
      $location.path( '/user/' + user.id + '/edit' );
    }

    $scope.show = function(user) {
      $location.path( '/user/' + user.id );
    }

    $scope.remove = function(user) {
      users.destroy(user);
      $location.path( '/users' );

      $mdToast.show(
        $mdToast.simple()
          .textContent("Removed successfully!")
          .position("bottom right")
          .hideDelay(3000)
      );
    }

    $scope.save = function(userForm){

      var msg = "Saved successfully!";
      var id = userForm.id;
      if (userForm.id != null) {

        msg = "Updated successfully!";
        users.update({
          user: {
            id: userForm.id,
            name: userForm.name,
            email: userForm.email,
            gender: userForm.gender,
            birthdate: userForm.birthdate
          }
        });

      } else {

        users.create({
          user: {
            name: userForm.name,
            email: userForm.email,
            gender: userForm.gender,
            birthdate: userForm.birthdate
          }
        });

      }

      $mdToast.show(
        $mdToast.simple()
          .textContent(msg)
          .position("bottom right")
          .hideDelay(3000)
      );

      if (id != null) {
        $location.path( '/user/' + id );
      } else {
        $location.path( '/users' );
      }
    };

  }
]);
