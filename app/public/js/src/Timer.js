/*jslint node: true */
"use strict";

function Timer(startTime) {
  this._remainingTime = startTime;
}

Timer.prototype.getRemaining = function() {
  return this._remainingTime;
};

Timer.prototype.reduceTime = function() {
  if(this._remainingTime === 0)  {
    throw new Error("remaining time cannot be less than 0");
  }
  this._remainingTime -= 1;
};

Timer.prototype.isFinished = function() {
  if (this._remainingTime === 0) {
    return "Time's up!";
  }
};

Timer.prototype.count = function() {
  var self = this;
    setInterval(function() {
      self.reduceTime();
      self.getRemaining();
    }, 1000);
};
