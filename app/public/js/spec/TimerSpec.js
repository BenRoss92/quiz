describe("Timer", function() {

  var timer;
  var startTime;

  beforeEach(function() {
    timer = new Timer();
    startTime = 10;
    timer.setRemaining(startTime);
  });

  it("returns the remaining seconds", function() {
    expect(timer.getRemaining()).toEqual(10);
  });

  it("reduces remaining seconds by one", function() {
    timer.reduceTime();
    expect(timer.getRemaining()).toEqual(9);
  });

  it("stops reducing seconds after 0", function() {
    timer.setRemaining(1);
    timer.reduceTime();
    expect(function(){ timer.reduceTime();}).toThrowError(
      "remaining time cannot be less than 0");
  });

});
