let editMode = false;
let box = document.getElementById("bodycam_ui");

window.addEventListener("DOMContentLoaded", () => {
    fetch(`https://${GetParentResourceName()}/uiReady`, {
        method: "POST",
        body: JSON.stringify({})
    });
    const offsetMinutes = new Date().getTimezoneOffset(); 
    const offsetHours = -(offsetMinutes / 60); // convert to +/-

    fetch(`https://${GetParentResourceName()}/sendTimezoneOffset`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ offset: offsetHours })
    });
});


// ---- Drag Logic ----
let offsetX = 0, offsetY = 0, isDown = false;

box.addEventListener("mousedown", function(e) {
    if (!editMode) return;
    isDown = true;
    offsetX = box.offsetLeft - e.clientX;
    offsetY = box.offsetTop - e.clientY;
});

document.addEventListener("mouseup", function() {
    if (isDown && editMode) {
        fetch(`https://${GetParentResourceName()}/finishEdit`, {
            method: "POST",
            body: JSON.stringify({
                x: box.offsetLeft,
                y: box.offsetTop
            })
        });
    }
    isDown = false;
});

document.addEventListener("keydown", function(e) {
    // ESC key pressed
    if (e.key === "Escape" && editMode) {

        editMode = false;

        // Disable draggable state
        box.style.pointerEvents = "none";
        box.style.cursor = "default";

        // Tell Lua we stopped editing (optional)
        fetch(`https://${GetParentResourceName()}/finishEdit`, {
            method: "POST",
            body: JSON.stringify({
                x: box.offsetLeft,
                y: box.offsetTop,
                done: true
            })
        });
    }
});


document.addEventListener("mousemove", function(e) {
    if (isDown && editMode) {
        box.style.left = `${e.clientX + offsetX}px`;
        box.style.top = `${e.clientY + offsetY}px`;
        box.style.position = "absolute";
    }
});


window.addEventListener("message", function (play) {
    if (play.data.action == "showbodycam") {

        $('.top-right-container').fadeIn();
        $(".top-right-container").css({"display":"flex"})
        document.getElementById("player").innerHTML = play.data.player
        document.getElementById("callsign").innerHTML = play.data.callsign
        document.getElementById("month").innerHTML = play.data.tarih
        document.getElementById("agency").innerHTML = play.data.dept

    }
    else if (event.data.action === "editMode") {
        editMode = event.data.enable;

        if (editMode) {
            box.style.pointerEvents = "auto";
            box.style.cursor = "move";
        } else {
            box.style.pointerEvents = "none";
            box.style.cursor = "default";
        }
    }
    else if(play.data.action == "hidebodycam") {
        $('.top-right-container').fadeOut(); 
    } 
    else if(play.data.action == "zamanguncelle") {
        document.getElementById("month").innerHTML = play.data.zaman
    }
    else if (event.data.action === "applyPosition") {
        box.style.left = `${event.data.x}px`;
        box.style.top = `${event.data.y}px`;
    }

});
