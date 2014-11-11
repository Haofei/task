$(function() {
    //monitor if user is idle or not
    $(document).idleTimer(5000);
        
    var pageName = $(document.body).data("controller") + "#" + $(document.body).data("action");
    
    //user start to view the page
    $.post("/activities/create", {activities: {status: "active", time: new Date()}, pageName: pageName})
    
    var updateTime = function (data) {
      var number = $("#active_time span");
      if(data.active_time != parseInt(number.text())) {
        number.html(Math.floor(data.active_time/60));
        number.effect("highlight", {color: "lightgreen"}, 3000);
      }
    }
    
    //user is idle
    $(document).on( "idle.idleTimer", function(event, elem, obj){
      //TODO
      //put the event into a queue
      $.post("/activities/create", {activities: {status: "idle", time: new Date()}, pageName: pageName}, updateTime)
      $("#status").html("user is idle :-(");
      $("#status").toggleClass("active idle")
    });

    //user is active again
    $(document).on( "active.idleTimer", function(event, elem, obj, triggerevent){
       $.post("/activities/create", {activities: {status: "active", time: new Date()}, pageName: pageName})
       $("#status").html("user is active :-)");
       $("#status").toggleClass("active idle")
    });
    
    //user close the page
    $(window).unload(function() {
       $.post("/activities/create", {activities: {status: "close", time: new Date()}, pageName: pageName})
    });
    
    //the most easy way to track online user is using heartbeat. or use socket.io and node.js for realtime tracking.
    setInterval(function() {
      var still_alive = {status: "still_alive", time: new Date()};
      $.post("/activities/create", {activities: still_alive, pageName: pageName}, updateTime);
    }, 10000);
});