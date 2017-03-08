/*jslint node: true */
"use strict";

function Timer(startTime) {
  this._remainingTime = startTime;
}

Timer.prototype.getRemaining = function() {
  return this._remainingTime;
};

Timer.prototype.reduceTime = function() {
  if(this._remainingTime <= 0)  {
    throw new Error("remaining time cannot be less than 0");
  }
  return (this._remainingTime -= 1);
};

Timer.prototype.count = function() {
  this.getRemaining();
  var self = this;
  var interval = setInterval(function() {
    if (self.getRemaining() <= 1) {clearInterval(interval);}
    self.reduceTime();
  }, 1000);
};
