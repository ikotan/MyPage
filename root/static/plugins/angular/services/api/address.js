addressBooks

.factory('addressApi', ['$resource', function($resource) {
  return $resource('/api/address', null, {
    list: { method: 'GET', url: '/api/address/list', params: { page: '@page' } }
  });
}]);
