addressBooks

.controller('listCtrl', ['$scope', 'apiResource', 'addressResource', function($scope, apiResource, addressResource) {
  $scope.config = {
    page: 1,
    rows: 50,
  };

  apiResource.list(
    { page: $scope.config.page, rows: $scope.config.rows },
    function(data) {
      $scope.data = data;
    }
  );

  $scope.addressDelete = function(id) {
    addressResource.delete(
      { addressId: id },
      function(data) {
        console.log(data);
      }
    )
  };

}])

;
