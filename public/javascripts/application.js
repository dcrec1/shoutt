function updateShouttsTable() {
	$.get($("form")[0].attributes["action"].value + "/new", { }, updateShouttsContainer);
}

function updateShouttsContainer(shoutts) {
	$("#shouttsContainer").html(shoutts).effect("highlight", {}, 1000);
	$.timer.reset;
	updateLatestShouttId();
}

function updateLatestShouttId() {
	latestShouttId().val(newestShouttId());
}

function newestShouttId() {
	return $(".shoutt")[0].id;
}

function latestShouttId() {
	return $("#latest_shoutt_id");
}

function updateCounter() {
	textarea = $("textarea")[0];
	textarea.value = textarea.value.substring(0, 140);
	$("#counter").text(140 - textarea.value.length);
}

$(document).ready(function() {
  var interval = 30000;
  $.timer(interval, function (timer) {
    updateShouttsTable();
    timer.reset(interval);
  })
})

// jquery timer

jQuery.timer=function(interval,callback){var interval=interval||100;if(!callback)return false;_timer=function(interval,callback){this.stop=function(){clearInterval(self.id)};this.internalCallback=function(){callback(self)};this.reset=function(val){if(self.id)clearInterval(self.id);var val=val||100;this.id=setInterval(this.internalCallback,val)};this.interval=interval;this.id=setInterval(this.internalCallback,this.interval);var self=this};return new _timer(interval,callback)}
