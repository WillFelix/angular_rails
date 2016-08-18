angular.module('angular-rails').controller 'UsersCtrl', [
  '$scope'
  '$location'
  '$mdToast'
  'users'
  'user'
  ($scope, $location, $mdToast, users, user) ->
    if user != null and $location.$$path.indexOf('edit') > 0
      user.birthdate = new Date(user.birthdate)
    $scope.user = user
    $scope.users = users.users

    $scope.remove = (user) ->
      users.destroy user
      $location.path '/users'
      $mdToast.show $mdToast.simple().textContent('Removed successfully!').position('bottom right').hideDelay(3000)
      return

    $scope.save = (userForm) ->
      path = '/users'
      msg = 'Saved successfully!'
      id = userForm.id
      obj =
        name: userForm.name
        email: userForm.email
        gender: userForm.gender
        birthdate: userForm.birthdate

      if id != undefined
        path = '/user/' + id
        msg = 'Updated successfully!'
        obj.id = id
        users.update user: obj
      else
        users.create user: obj

      $mdToast.show $mdToast.simple().textContent(msg).position('bottom right').hideDelay(3000)
      $location.path path

      return

    return
]
