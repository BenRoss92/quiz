describe("Timer", function() {

  var timer;
  var startTime;

  beforeEach(function() {
    timer = new Timer();
    startTime = 10;
  });

  it("should have a start time", function() {
    timer.setTimer(startTime);
    expect(timer._currentTime).toEqual(startTime);
  });

});
