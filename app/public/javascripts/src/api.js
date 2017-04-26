/*jslint node: true */
"use strict";

function Api() {

}

Api.prototype.getQuestionData = function(url) {

  var http = new XMLHttpRequest();
  var that = this;
  http.onload = function() {
    if(http.readyState === 4 && http.status === 200) {
      that.returnData(JSON.parse(http.responseText));
    }
  };

  http.open("GET", url, true);
  http.send();
};

Api.prototype.returnData = function (response) {
  return response;
};
