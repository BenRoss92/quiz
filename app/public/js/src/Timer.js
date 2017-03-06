'use strict';

function Timer() {
  this._currentTime = null
}

Timer.prototype.setTimer = function(startTime) {
  this._currentTime = startTime;
};

Timer.prototype.getRemaining = function() {
  return this._currentTime;
};
