/*jslint node: true */
"use strict";

function Answer(questionData) {
  this._correctAnswer = questionData.correct_answer;
}

Answer.prototype.validate = function (submission) {
  return (this._correctAnswer === submission) ? true : false;
};

Answer.prototype.printCorrection = function () {
  return this._correctAnswer;
};
