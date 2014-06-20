var socket, host;
host = "ws://" + window.location.host + "/api/v1/ws";

function connect() {
  try {
    var jumbotron = $(".jumbotron")
    var resetState = function() {
      jumbotron.removeClass("connected");
      jumbotron.removeClass("closed");
      jumbotron.removeClass("error");
    }

    socket = new WebSocket(host);

    socket.onopen = function() {
      resetState();
      jumbotron.addClass("connected");

      jumbotron.find("#status").text("Connected!")
      // addMessage("Socket Status: " + socket.readyState + " (open)");
    }

    socket.onclose = function() {
      resetState();
      jumbotron.addClass("closed");

      jumbotron.find("#status").text("Closed!")
      // addMessage("Socket Status: " + socket.readyState + " (closed)");
    }

    socket.onmessage = function(msg) {
      var message = JSON.parse(msg.data)
      var myNotification = new Notify(message.title, { body: message.message });
      myNotification.show();
      $("#last-message").text(message.message)
    }
  } catch(exception) {
    resetState();
    jumbotron.addClass("error");
    jumbotron.find("#status").text("Error!")
  }
}

function addMessage(msg) {
  $("#chat-log").append("<p>" + msg + "</p>");
}


$(function() {
  connect();
});

$(document).ready(function() {
  $("#access-request").click(function(event) {
    Notify.requestPermission();
  });
});

