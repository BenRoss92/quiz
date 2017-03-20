$(document).ready(function() {

  var startTime = document.getElementById("timer").innerHTML;
  var timer = new Timer(startTime);

  function updateTime() {
    $('#timer').text(timer.getRemaining());
  }

  updateTime();

});
