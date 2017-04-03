describe("Answer", function() {

  var submission;
  var answer;
  var questionObject;

  beforeEach(function() {
    submission = 'Willibrord';
    questionObject = {
      "time_limit":"10",
      "text":"Who was the legendary Benedictine monk who invented champagne?",
      "correct_answer":"Dom Perignon",
      "option_2":"Ansgar",
      "option_3":"Willibrord"
    };
    answer = new Answer(submission, questionObject);
  });

  it("has a correct answer", function() {
    expect(answer.correctAnswer).toEqual('Dom Perignon');
  });

  it("has a submission", function() {
    expect(answer.submission).toEqual('Willibrord');
  });

});
