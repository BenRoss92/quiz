/*jslint node: true */
"use strict";

function Answer(submission, questionObject) {
  this.submission = submission;
  this.correctAnswer = questionObject.correct_answer;
}
