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

    $scope.showTransition = function(addressId) {
      $window.location.href = AddressLogic.showUrl(addressId);
    };

    $scope.editTransition = function(addressId) {
      $window.location.href = AddressLogic.editUrl(addressId);
    };

    $scope.init = function() {
      $scope.getAddressList();
    };
    $scope.init();
}])



.controller('createCtrl', ['$scope', 'AddressResource', 'UtilDate',
  function($scope, AddressResource, UtilDate) {
    $scope.address = {};
    $scope.config = {
      title: "登録",
    };

    $scope.getAllPrefectures = function() {
      AddressResource.prefectures( {}, function(data) {
        $scope.prefectures = data.prefectures;
      })
    };

    $scope.submitAddress = function() {
      var address = $scope.address;
      $scope.address.birthday = UtilDate.toDate(new Date(address.year, address.month, address.day));
      address.prefecture_id = address.prefecture.prefecture_id;
      console.log(address);
      AddressResource.create(
        $.param(address),
        function(data) {
          console.log(data);
        }
      );
    };

    $scope.init = function() {
      $scope.getAllPrefectures();
    };
    $scope.init();
}])



.controller('showCtrl', ['$scope', 'AddressResource', 'AddressLogic',
  function($scope, AddressResource, AddressLogic) {
    $scope.address = {};
    $scope.config = {
      title: "確認",
      addressId: AddressLogic.getPathId(),
    };

    $scope.getAddress = function() {
      AddressResource.get({ addressId: $scope.config.addressId }, function(data) {
        console.log(data);
        $scope.address = data.address_book;
        $scope.address.prefecture = { prefecture_id: data.address_book.prefecture_id };
      });
    };

    $scope.init = function() {
      $scope.getAddress();
    };
    $scope.init();
}])



.controller('editCtrl', ['$scope', 'AddressResource', 'UtilDate', 'AddressLogic',
  function($scope, AddressResource, UtilDate, AddressLogic) {
    $scope.address = {};
    $scope.config = {
      title: "編集",
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
