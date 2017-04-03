describe("Answer", function() {

  var submission;
  var answer;
  var questionObject;

  describe("When submission is incorrect", function() {

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

    it("has a submission", function() {
      expect(answer.submission).toEqual('Willibrord');
    });

    it("validates a user's submission", function() {
      expect(answer.validate()).toEqual(false);
    });

  });

  describe("When submission is correct", function() {

    beforeEach(function() {
      submission = 'Dom Perignon';
      questionObject = {
        "time_limit":"10",
        "text":"Who was the legendary Benedictine monk who invented champagne?",
        "correct_answer":"Dom Perignon",
        "option_2":"Ansgar",
        "option_3":"Willibrord"
      };
      answer = new Answer(submission, questionObject);
    });

    it("validates as true", function() {
      expect(answer.validate()).toEqual(true);
    });
    
  });

});
