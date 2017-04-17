describe("Timer", function() {

  var positiveTimer;
  var zeroTimer;
  var positiveSeconds;
  var zeroSeconds;
  var count;

  beforeEach(function() {
    positiveSeconds = 10;
    zeroSeconds = 0;
    positiveTimer = new Timer(positiveSeconds);
    zeroTimer = new Timer(zeroSeconds);
  });

  describe("#getRemaining", function() {

    it("returns the remaining seconds", function() {
      expect(positiveTimer.getRemaining()).toEqual(positiveSeconds);
    });

  });

  describe("#reduceTime", function() {

    describe("When timer is given a positive starting time", function() {

      it("reduces remaining seconds by one", function() {
        positiveTimer.reduceTime();
        expect(positiveTimer.getRemaining()).toEqual(positiveSeconds - 1);
      });

    });

    describe("When timer has zero seconds remaining", function() {

      it("throws error if time remaining goes below 0", function() {
        expect(function(){ zeroTimer.reduceTime();}).toThrowError(
          "remaining time cannot be less than 0");
      });

    });

  });

});
