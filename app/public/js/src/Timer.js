/*jslint node: true */
"use strict";

function Timer() {
  this._currentTime = null;
}

Timer.prototype.setTimer = function(startTime) {
  this._currentTime = startTime;
};

Timer.prototype.getRemaining = function() {
  return this._currentTime;
};

Timer.prototype.reduceTime = function() {
  this._currentTime -= 1;
};
