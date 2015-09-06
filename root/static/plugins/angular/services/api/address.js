addressBooks

.factory('AddressResource', ['$resource', function($resource) {
  return $resource('/api/address/:addressId', { addressId: '@id' }, {
    'create': { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' } },
    'destroy': { method: 'DELETE' },
    'list': { method: 'GET', url: '/api/address/list', params: { page: '@page', rows: '@rows' } },
    'prefectures': { method: 'GET', url: '/api/address/prefectures' },
  });
}])

;
