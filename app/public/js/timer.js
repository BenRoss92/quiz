var limit = document.getElementById('timer').innerHTML;

var startTimer = setInterval(function() {
  decrease();
}, 1000);

var stopTimer = function() {
  window.clearInterval(startTimer);
};

var decrease = function() {
  if (limit > 0) {
    limit -= 1
    document.getElementById('timer').innerHTML = limit
  }
};
