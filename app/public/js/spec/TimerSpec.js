describe("Timer", function() {

  var timer;
  var startTime;
  var count;

  describe("Timer is set to 10", function() {

    beforeEach(function() {
      startTime = 10;
      timer = new Timer(startTime);
      jasmine.clock().install();
    });

    afterEach(function() {
      jasmine.clock().uninstall();
    });

    it("returns the remaining seconds", function() {
      expect(timer.getRemaining()).toEqual(startTime);
    });

    it("reduces remaining seconds by one", function() {
      timer.reduceTime();
      expect(timer.getRemaining()).toEqual(startTime - 1);
    });

    it("counts down after one second", function() {
      timer.count();
      jasmine.clock().tick(1000);
      expect(timer.getRemaining()).toEqual(9);
    });

  });

  describe("When timer is set to 0", function() {

    beforeEach(function() {
      startTime = 0;
      timer = new Timer(startTime);
    });

    it("stops reducing seconds after 0", function() {
      expect(function(){ timer.reduceTime();}).toThrowError(
        "remaining time cannot be less than 0");
    });

    it("notifies user when timer is finished", function() {
      expect(timer.isFinished()).toEqual("Time's up!");
    });

  });

});
