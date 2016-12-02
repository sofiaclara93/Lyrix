$(document).ready(function() {
  $("button#song-like").on("click", function() {
    var like = 1;
    var songId = $(this).parent().parent("div").attr("id");
    var url = "/songs/" + songId + "/likes"
    $.ajax({
      url: url,
      method: "post",
      data: {"type": "Song", "like": like}
    }).done(function(response){
       $("div#" + songId).find(".likes span").text(response['likes'] + "like(s)");
    })
  });

  $("button#user-like").on("click", function() {
    var like = 1;
    var userId = $(this).parent().parent("div").attr("id");
    var url = "/users/" + userId + "/likes"
    $.ajax({
      url: url,
      method: "post",
      data: {"type": "User", "like": like}
    }).done(function(response){
       $("div#" + userId).find(".likes span").text(response['likes'] + " like(s)");
    })
  });
});
