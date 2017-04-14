/*jslint node: true */
"use strict";

function Answer(questionData) {
  this._questionData = questionData;
  this._correctAnswer = questionData.correct_answer;
}

Answer.prototype.validate = function (submission) {
  return (this._correctAnswer === submission) ? true : false;
};
