window.onload = function() {

  var startTime = document.getElementById('timer').innerHTML;
  var timer = new Timer(startTime);

  function updateTime() {
    document.getElementById('timer').innerHTML = timer.getRemaining();
  }

  var count = setInterval(function(){
    startTimer();
    if (timer.getRemaining() <= 0) {
      stopTimer();
    }
  }, 1000);

  function stopTimer() {
    clearInterval(count);
  }

  function startTimer() {
    timer.reduceTime();
    updateTime();
  }

};
