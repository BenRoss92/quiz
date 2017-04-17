describe("Answer", function() {

  var correctSubmission;
  var incorrectSubmission;
  var answer;
  var questionData;

  beforeEach(function() {
    questionData = {
      "time_limit":"10",
      "text":"Who was the legendary Benedictine monk who invented champagne?",
      "correct_answer":"Dom Perignon",
      "option_2":"Ansgar",
      "option_3":"Willibrord"
    };
    answer = new Answer(questionData);
    correctSubmission = 'Dom Perignon';
    incorrectSubmission = 'Willibrord';
  });

  describe("#validate", function() {

    describe("when given a correct submission", function() {

      it("returns true", function() {
        expect(answer.validate(correctSubmission)).toEqual(true);
      });

    });

    describe("when given an incorrect submission", function() {

      it("returns false", function() {
        expect(answer.validate(incorrectSubmission)).toEqual(false);
      });

    });

  });

});
