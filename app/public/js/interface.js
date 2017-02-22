  $('#skip').prop("disabled", true);

  var enableSkipping = function() {
    $('#skip').prop("disabled", false);
  };

  var disableAnswering = function() {
    $('#submission').prop("disabled", true);
  };

  $( "#options" ).submit(function( event ) {
    event.preventDefault();
    var answer = $( "input[type=radio]:checked" ).val();
    validateFormat(answer);
  });

  var validateFormat = function(answer) {
    answer !== undefined ? validateAnswer(answer) : alert("Please select an option");
  };

  var validateAnswer = function(answer) {
    disableAnswering();
    $.ajax({
      type: "POST",
      url: "/questions",
      data: { answer: answer },
      success: function(response) {
        getVerdict(response);
        getCorrection(response);
        endQuestion();
      },
      error: function(jqXHR, errorType, exceptionObject) {
        throw(errorType);
      }
    });
  };

  var getCorrection = function (response) {
    var correction = response.result.correct || '';
    $("#correction").text(correction);
  };

  var getVerdict = function(response) {
    var verdict = response.result.verdict;
    $("#verdict").text(verdict);
  };

  var endQuestion = function() {
    disableAnswering();
    stopTimer();
    enableSkipping();
  };
