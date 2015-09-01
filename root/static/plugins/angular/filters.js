addressBooks

.filter('genderDiscrimination', function() {
  return function(sexCode) {
    return ( Number(sexCode) === 1 ) ? "男性" : "女性";
  }
})
