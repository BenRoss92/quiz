describe("Timer", function() {

  var timer;
  var startTime;

  beforeEach(function() {
    timer = new Timer();
    startTime = 10;
    timer.setTimer(startTime);
  });

  it("returns the remaining time", function() {
    expect(timer.getRemaining()).toEqual(10)
  });

});
