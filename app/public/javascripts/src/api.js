/*jslint node: true */
"use strict";

function Api() {

}

Api.prototype.getQuestionData = function(url) {

  var http = new XMLHttpRequest();
  var that = this;
  http.onreadystatechange = function() {
    if(http.readyState === 4 && http.status === 200) {
      that.returnData(http.response);
    }
  };

  http.open("GET", url, true);
  http.send();
};

Api.prototype.returnData = function (response) {
  return response;
};
