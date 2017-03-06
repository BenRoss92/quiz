describe("Timer", function() {

  var timer;
  var startTime;

  beforeEach(function() {
    timer = new Timer();
    startTime = 10;
    timer.setTimer(startTime);
  });

  it("returns the remaining seconds", function() {
    expect(timer.getRemaining()).toEqual(10);
  });

  it("reduces remaining seconds by one", function() {
    timer.reduceTime();
    expect(timer.getRemaining()).toEqual(9);
  });

});
