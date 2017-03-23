describe("Timer", function() {

  var timer;
  var startTime;
  var count;

  describe("When timer is set to 10", function() {

    beforeEach(function() {
      startTime = 10;
      timer = new Timer(startTime);
    });

    it("returns the remaining seconds", function() {
      expect(timer.getRemaining()).toEqual(startTime);
    });

    it("reduces remaining seconds by one", function() {
      timer.reduceTime();
      expect(timer.getRemaining()).toEqual(startTime - 1);
    });

  });

  describe("When starting time is hardcoded as 0", function() {

    beforeEach(function() {
      startTime = 0;
      timer = new Timer(startTime);
    });

    it("throws error if time remaining goes below 0", function() {
      expect(function(){ timer.reduceTime();}).toThrowError(
        "remaining time cannot be less than 0");
    });
  });

});
