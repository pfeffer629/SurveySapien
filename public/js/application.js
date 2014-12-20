$(document).ready(function() {
  $('.delete-button').on('click', function(event){
    event.preventDefault();
    var deleteUrl = $(this).attr('action');
    $.ajax({
      type: 'DELETE',
      url: deleteUrl
    }).done(function(data){
      $("#"+data.id).remove();
    })
  });

  $('.remove_question').on('click', function(event){
    event.preventDefault();
    $(".question").last().remove();
    $("li").last().remove();
  })

  $('.add_question').on('click', function(event){
    event.preventDefault();
    var lastListItem = $
    $('<li>').appendTo('.question_list')
    $('<input>').attr({
      class: "question",
      type: "text",
      name: "questions[]",
      placeholder: "type question here"
    }).appendTo('li:last-child')
  })

  $('.vote-button').click(function(event){
    event.preventDefault();
    $target = $(event.target);
    $parent = $target.parent();
    $target.css("color", "green");

    $.ajax({
      type: 'GET',
      url: '/' + $parent.attr("id") + '/vote',
      dataType: "JSON"
    }).done(function(response){
      $target.css("color", "red")
      $parent.children('.points').html(response)
    })
  })


});
