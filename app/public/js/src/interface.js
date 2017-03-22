window.onload = function() {

  var startTime = document.getElementById('timer').innerHTML;
  var timer = new Timer(startTime);

  function updateTime() {
    document.getElementById('timer').innerHTML = timer.getRemaining();
  }

  var count = setInterval(function() {
    if (timer.getRemaining() <= 1) {clearInterval(count);}
    timer.reduceTime();
    updateTime();
  }, 1000);

};
