$(document).ready(function() {

  var limit = document.getElementById('timer').innerHTML;

  (function start() {
    window.setInterval(decrease, 1000);
  })();

  function decrease() {
    if (limit > 0) {
      limit -= 1
      document.getElementById('timer').innerHTML = limit
    }
  };

});
