/*jslint node: true */
"use strict";

function Answer(submission, questionObject) {
  this.submission = submission;
  this._correctAnswer = questionObject.correct_answer;
}

Answer.prototype.validate = function () {
  return (this.submission === this._correctAnswer) ? true : false;
};
