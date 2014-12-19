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
  })


  // $('.add_question').on('click', function(event){
  //   event.preventDefault();
  //   $()
  // })
});
