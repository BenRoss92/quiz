describe("Api", function() {

  var api;
  var url;
  var response;

  beforeEach(function() {
    api = new Api();
    url = '/api/questions/1';
    response = {
      "time_limit":"10",
      "text":"Who was the legendary Benedictine monk who invented champagne?",
      "correct_answer":"Dom Perignon",
      "option_2":"Ansgar",
      "option_3":"Willibrord"
    };
    spyOn(api, 'getQuestionData').and.returnValue(response);
  });

  describe("#getQuestionData", function() {
    it("returns question data from AJAX call", function() {
      expect(api.getQuestionData(url)).toEqual(response);
    });
  });

  describe("#returnData", function() {
    it("returns the response data given", function() {
      expect(api.returnData(response)).toEqual(response);
    });
  });

});
