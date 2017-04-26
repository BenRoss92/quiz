window.onload = function() {

  // ===  Answer functions ===

  function getQuestionData(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.onload = function() {
      if(xhr.readyState === 4 && xhr.status === 200) {
        callback(JSON.parse(xhr.responseText));
      }
    };
    xhr.send(null);
  }

  document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault();
    getQuestionData('/api/questions/1', function(data) {
      answer = new Answer(data);
      submitAnswer();
    });
  });

  function submitAnswer() {
    var submission = document.querySelector('input[name = "answer"]:checked').value;
    if (submission !== null) {
      printVerdict(submission);
    }
  }

  function printVerdict(submission) {
    var result = answer.validate(submission);
    var verdict = (result === true) ? ("Correct") : ("Incorrect");
    document.getElementById('verdict').innerHTML = verdict;
  }

  // === Timer functions ===

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
