var socket, host;
host = "ws://" + window.location.host + "/api/v1/ws";

function connect() {
  try {
    socket = new WebSocket(host);

    addMessage("Socket State: " + socket.readyState);

    socket.onopen = function() {
      addMessage("Socket Status: " + socket.readyState + " (open)");
    }

    socket.onclose = function() {
      addMessage("Socket Status: " + socket.readyState + " (closed)");
    }

    socket.onmessage = function(msg) {
      var message = JSON.parse(msg.data)
      var myNotification = new Notify(message.title, { body: message.message });
      myNotification.show();
    }
  } catch(exception) {
    addMessage("Error: " + exception);
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

