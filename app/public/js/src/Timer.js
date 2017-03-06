'use strict';

function Timer() {
  this._currentTime = null
}

Timer.prototype.setTimer = function(startTime) {
  this._currentTime = startTime;
};
