addressBooks.factory('addressApi', ['$resource', function($resource) {
  return $resource('/api/address/list', null, {
    query: { method:'GET', isArray:true }
  });
}]);

