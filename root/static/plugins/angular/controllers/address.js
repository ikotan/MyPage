addressBooks

.controller('listCtrl', ['$scope', '$window', 'AddressResource', 'AddressLogic',
  function($scope, $window, AddressResource, AddressLogic) {
    $scope.config = {
      page: 1,
      rows: 50
    };

    $scope.getAddressList = function() {
      AddressResource.list(
        { page: $scope.config.page, rows: $scope.config.rows },
        function(data) {
          console.log(data);
          $scope.data = data;
        }
      );
    };

    $scope.addressDelete = function(id) {
      AddressResource.destroy( { addressId: id }, function(data) {
        console.log(data);
        $scope.getAddressList();
      })
    };

    $scope.editTransition = function(id) {
      $window.location.href = AddressLogic.editUrl(id);
    };

    $scope.init = function() {
      $scope.getAddressList();
    };
    $scope.init();
}])



.controller('createCtrl', ['$scope', 'AddressResource', 'UtilDate',
  function($scope, AddressResource, UtilDate) {
    $scope.address = {};

    $scope.getAllPrefectures = function() {
      AddressResource.prefectures( {}, function(data) {
        $scope.prefectures = data.prefectures;
      })
    };

    $scope.submitAddress = function() {
      var address = $scope.address;
      console.log(address);
      $scope.address.birthday = UtilDate.toDate(new Date(address.year, address.month, address.day));
      AddressResource.create(
        $.param(address),
        function(data) {
          console.log(data);
        }
      );
    };

    $scope.defaultAddress = function() {
      $scope.address = {
        full_name: "田中太郎",
        sex_code: 0,
        year: 1955,
        month: 10,
        day: 5,
        postal_code: "333-3333",
        prefecture: {
          prefecture_id: 25
        },
        city: "太田市",
        address: "１－１－１"
      };
    };

    $scope.init = function() {
      $scope.getAllPrefectures();
      $scope.defaultAddress();
    };
    $scope.init();
}])



.controller('editCtrl', ['$scope', '$window', 'AddressResource', 'UtilDate', 'AddressLogic',
  function($scope, $window, AddressResource, UtilDate, AddressLogic) {
    $scope.address = {};
    $scope.config = {
      addressId: AddressLogic.getPathId(),
    };

    $scope.getAddress = function() {
      AddressResource.get({ addressId: $scope.config.addressId }, function(data) {
        console.log(data);
        $scope.address = data.address_book;
        $scope.address.prefecture = { prefecture_id: data.address_book.prefecture_id };
      });
    };

    $scope.getAllPrefectures = function() {
      AddressResource.prefectures( {}, function(data) {
        console.log(data);
        $scope.prefectures = data.prefectures;
      })
    };

    $scope.submitAddress = function() {
      var address = $scope.address;
      console.log(address);
      $scope.address.birthday = UtilDate.toDate(new Date(address.year, address.month, address.day));
      address.prefecture_id = address.prefecture.prefecture_id;
      AddressResource.update(
        { addressId: $scope.config.addressId },
        $.param(address),
        function(data) {
          console.log(data);
        }
      );
    };

    $scope.init = function() {
      $scope.getAddress();
      $scope.getAllPrefectures();
    };
    $scope.init();
}])

;
