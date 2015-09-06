addressBooks

.controller('listCtrl', ['$scope', 'addressResource', function($scope, addressResource) {
  $scope.config = {
    page: 1,
    rows: 50
  };

  addressResource.list(
    { page: $scope.config.page, rows: $scope.config.rows },
    function(data) {
      console.log(data);
      $scope.data = data;
    }
  );

  $scope.addressDelete = function(id) {
    addressResource.delete( { addressId: id }, function(data) {
      console.log(data);
    })
  };

}])

.controller('createCtrl', ['$scope', 'addressResource', function($scope, addressResource) {
  $scope.address = {};

  addressResource.prefectures( {}, function(data) {
    $scope.prefectures = data.prefectures;
    $scope.prefecture;
  })

  $scope.newAddress = function() {

  };

}])

;
