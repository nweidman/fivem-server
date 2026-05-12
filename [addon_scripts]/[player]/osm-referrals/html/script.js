window.addEventListener('message', (event) => {
  if (event.data.type == "openreferral") {
      $("#code").text(event.data.code)
      $("#container").css("display", "flex");
    } else  {
      $("#container").hide()
  }
});

// $(document).keyup((e) => {
//   if (e.key === "Escape") {
//     $("#container").slideUp();
//     setTimeout(() => {
//             $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
//     }, 100);
//   }
// });


$("#pay-btn").click(() => {
  var entcode = document.getElementById("entcode");
  var reason = document.getElementById("reason");
  $("#container").slideUp();
  setTimeout(() => {
          $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
  }, 100);

  var enteredcode = $("#entcode").val()
  if (enteredcode === null) {
    enteredcode = 'NULL'
  }
  $.post(`https://${GetParentResourceName()}/sumbit`, JSON.stringify({
    code: enteredcode,     
    reason: $("#reason").val(),
  })
  );
});