var handleId;
var Locales;
let state;

function updatePrimaryColor(color, sent) {
  let colorPicker = document.getElementById("primaryColorPicker");
  
  if (color.isTrusted) {
    color = colorPicker.value;
  } else {
    colorPicker.value = color;
  }

  document.querySelector(".square").style.backgroundColor = color;

  if (sent == null) {
    $.post(`https://nass_musicplayer/saveKVP`, JSON.stringify({ event: "nass_musicplayer:primaryColor", data: color}));
  }
  
}

function updateSecondaryColor(color, sent) {
  let colorPicker = document.getElementById("secondaryColorPicker");
  
  if (color.isTrusted) {
    color = colorPicker.value;
  } else {
    colorPicker.value = color;
  }
  
  document.querySelector(".leftBar").style.backgroundColor = color;
  document.querySelector(".playlists").style.backgroundColor = color;
  document.querySelector(".recentlyplayed").style.backgroundColor = color;
  document.querySelector(".nextup").style.backgroundColor = color;
  document.querySelector(".songinput").style.backgroundColor = color;
  document.querySelector(".createplaylist").style.backgroundColor = color;

  
  if (sent == null) {
    $.post(`https://nass_musicplayer/saveKVP`, JSON.stringify({ event: "nass_musicplayer:secondaryColor", data: color}));
  }
}

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("primaryColorPicker").addEventListener("input", updatePrimaryColor);
  document.getElementById("secondaryColorPicker").addEventListener("input", updateSecondaryColor);


  const musicPlayer = document.querySelector(".musicPlayer");
  let offsetX, offsetY, isDragging = false;

  musicPlayer.addEventListener("dragstart", (e) => e.preventDefault());


  musicPlayer.addEventListener("mousedown", (e) => {
      isDragging = true;
      offsetX = e.clientX - musicPlayer.getBoundingClientRect().left;
      offsetY = e.clientY - musicPlayer.getBoundingClientRect().top;
      musicPlayer.style.cursor = "grabbing";
  });


  document.addEventListener("mousemove", (e) => {
      if (!isDragging) return;

      let left = e.clientX - offsetX;
      let top = e.clientY - offsetY;

      // Get viewport width & height
      let maxWidth = window.innerWidth - musicPlayer.offsetWidth;
      let maxHeight = window.innerHeight - musicPlayer.offsetHeight;

      // Constrain values to stay within screen bounds
      left = Math.max(0, Math.min(left, maxWidth));
      top = Math.max(0, Math.min(top, maxHeight));

      musicPlayer.style.left = `${left}px`;
      musicPlayer.style.top = `${top}px`;
  });



  document.addEventListener("mouseup", () => {
    if (isDragging) {
        let left = parseInt(musicPlayer.style.left, 10);
        let top = parseInt(musicPlayer.style.top, 10);

        $.post(`https://nass_musicplayer/saveKVP`, JSON.stringify({ event: "nass_musicplayer:miniplayerposition", data: {left, top }}));
    }
    isDragging = false;
    musicPlayer.style.cursor = "grab";
  });

  
  $.post(`https://nass_musicplayer/getlocale`, JSON.stringify({}), function (data) {
    Locales = data;
  });

  const progressbar = document.getElementById("duration");
  // Event listener for input on the progress bar
  progressbar.addEventListener("input", function () {
    progressbar.disabled = true; // Disable the progress bar immediately on input
    const newClick = progressbar.value;

    // Send the new time to the server
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "setTimeStamp",
        time: newClick,
        handle: handleId,
      })
    );

    // Re-enable the progress bar after 1 second
    setTimeout(() => {
      progressbar.disabled = false;
    }, 1000);
  });

  var nextsongbutton = document.getElementById("nextsongbutton");
  var backwardsbutton = document.querySelector(".btn2");

  nextsongbutton.addEventListener("click", function () {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "nextSong",
        handle: handleId,
      })
    );
  });

  backwardsbutton.addEventListener("click", function () {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "prevSong",
        handle: handleId,
      })
    );
  });
  

  var loopButton = document.getElementById("loop");
  var shuffleButton = document.getElementById("shuffle");

  loopButton.addEventListener("click", function () {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "loop",
        handle: handleId,
      })
    );
  });

  shuffleButton.addEventListener("click", function () {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "shuffle",
        handle: handleId,
      })
    );
  });

  var back = document.getElementById("back");
  var homepage = document.querySelector(".spot-app")
  var librarypage = document.querySelector(".librarypage")

  back.addEventListener("click", function () {
    homepage.style.display = "block";
    librarypage.style.display = "none";
  });

  // view playlist 

  var viewPlaylist = document.getElementById("ViewPlaylists") 
  viewPlaylist.addEventListener("click", function () {
    homepage.style.display = "none";
    librarypage.style.display = "block";
  });


  $.post(`https://nass_musicplayer/getlocale`, JSON.stringify({}), function(data) {
    Locales = data
    $("#songname").html(data["nomedia_present"]);
    $("#songLabel").html(data["nosong_label"]);
    $("#homep").html(data["home"]);
    $(".libraryp").html(data["library"]);
    $(".playerp").html(data["player"]);
    $(".recenttext").html(data["recently_played"]);
    $("#backText").html(data["back_text"]);
    $(".liked-text").html(data["liked_text"]);
    $(".create-text").html(data["create_text"]);
    $("#yourPlaylist").html(data["your_playlist"]);
    $("#playlist-title").html(data["playlist_title"]);
    $("#playlist-description").html(data["playlist_description"]);
    $(".add-button").html(data["add_button"]);
    $("#list-2").html(data["list_title"]);
    $("#list-3").html(data["date_added"]);
    $("#deleteSongBTN").html(data["delete_song"]);
    $("#addSongBTN").html(data["add_song"]);
    $("#editDetails").html(data["edit_details"]);
    $(".save-settings").html(data["save_settings"]);
    $("#playlistDeleteText").html(data["delete_playlist"]);
    $("#del-confirm").html(data["delete_confirm"]);
    $("#del-cancel").html(data["delete_cancel"]);
    $(".add-song").attr('placeholder', data["enter_link"])
    $(".pl-image").attr('placeholder', data["image_link"])
    $(".pl-description").attr('placeholder', data["pl_description"])
    $(".pl-title").attr('placeholder', data["pl_title"])

    document.getElementById("primColor").innerHTML = data["primaryColor"];
    document.getElementById("secColor").innerHTML = data["secondaryColor"];
  });

  //Volume

  //       document.querySelector('.volume-pill').style.height = `${(item.vol*100)}%`;
  const volumePill = document.querySelector(".volume-pill");
  const volumePillBar = document.querySelector(".volume-pill-bar");

  function setVolume(event) {
    const boundingRect = volumePillBar.getBoundingClientRect();
    const mouseY = boundingRect.bottom - event.clientY;
    const volume = (mouseY / boundingRect.height) * 100;
    volumePill.style.height = `${volume}%`;
    volumePill.style.bottom = `0%`;

    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "setVolume",
        volume: volume,
        handle: handleId,
      })
    );
  }

  volumePillBar.addEventListener("click", setVolume);

  const volumenbtn = document.querySelector(".volumenbtn");
  const volumebtnmute = document.querySelector(".volumebtnmute");
  const volumeIcon = document.querySelector(".volumebtns i");
  const volumeBtns = document.querySelector(".volumebtns");

  volumenbtn.addEventListener("click", function () {
    if (this.classList.contains("volumenbtn")) {
      this.classList.remove("volumenbtn");
      this.classList.add("volumebtnmute");
      volumeIcon.classList.remove("fa-volume-up");
      volumeIcon.classList.add("fa-volume-off");

      volumePill.style.height = `${0}%`;
      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "setVolume",
          volume: 0,
          handle: handleId,
        })
      );
    } else if (this.classList.contains("volumebtnmute")) {
      this.classList.remove("volumebtnmute");
      this.classList.add("volumenbtn");
      volumeIcon.classList.remove("fa-volume-off");
      volumeIcon.classList.add("fa-volume-up");
      volumePill.style.height = `${50}%`;

      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "setVolume",
          volume: 50,
          handle: handleId,
        })
      );
    }
  });
});



function updateCurrentVolume(newVolume){
  var volumePill = document.querySelector(".volume-pill");
  const volumeIcon = document.querySelector(".volumebtns i");

  if (newVolume == 0) {
      volumeIcon.classList.remove("fa-volume-up");
      volumeIcon.classList.add("fa-volume-off");
      volumePill.style.height = `0%`;
  } else {
      volumeIcon.classList.remove("fa-volume-off");
      volumeIcon.classList.add("fa-volume-up");
      volumePill.style.height = `${newVolume}%`;
      volumePill.style.bottom = `0%`;
  }
}

window.addEventListener("message", function (event) {
  var item = event.data;
  if (item.event == "openMusicPlayer") {
    handleId = item.handle
    var userName = document.getElementById("username")
    userName.textContent = Locales['introduction'] + item.name;

    visuallyPause(item.isPaused);
    if (item.playlists){
      loadUserPlaylists(item.playlists);
    }
    if (item.recent) {
      loadRecentlyPlayed(item.recent)
    }
    updateCurrentVolume(item.volume);
    if (item.currentSong) {
      setCurrentSong(item.currentSong.url, item.currentSong.thumbnail, item.currentSong.title, item.currentSong.author);
    }
    if (item.queue) {
      queuePlaylist(item.queue);
    }
    if (item.loop) {
      setLoop(item.loop);
    }

    $.post(`https://nass_musicplayer/getKVP`, JSON.stringify({event: "nass_musicplayer:primaryColor"}), 
      function (data) {
        if(data){
          updatePrimaryColor(data, true)
        }
    });

    $.post(`https://nass_musicplayer/getKVP`, JSON.stringify({event: "nass_musicplayer:secondaryColor"}), 
      function (data) {
        if(data){
          updateSecondaryColor(data, true)
        }
    });

    
    const mainContainer = document.getElementById("maincontainer");
    mainContainer.style.display = "block";
    mainContainer.style.opacity = "0";
    mainContainer.style.transform = "scale(0.8)";
    mainContainer.style.transition = "none";
    setTimeout(() => {
      mainContainer.style.transition = "all 0.5s ease-in-out";
      mainContainer.style.opacity = "1";
      mainContainer.style.transform = "scale(1)";
    }, 100);
  } else if (item.event == "updateSoundHandle") {
    handleId = item.handle
  } else if (item.event == "updateMiniPlayer") {
    if(item.display && item.currentSong){
      //Show player &
      //item.currentSong
      var musicPlayer = document.querySelector(".musicPlayer");
      var image = document.getElementById("musicplayer-img");
      var title = document.getElementById("info-title");
      var author = document.getElementById("info-author");
      var musicAnimation;

      $.post(`https://nass_musicplayer/getKVP`, JSON.stringify({event: "nass_musicplayer:miniplayerposition"}), 
        function (data) {
          if (data) {
            musicPlayer.style.left = `${data.left}px`;
            musicPlayer.style.top = `${data.top}px`;
            musicPlayer.style.right = "";
            musicPlayer.style.bottom = "";
            musicPlayer.classList.add("animate__animated", "animate__fadeInDown");
            musicAnimation = "animate__animated", "animate__fadeInDown"
          }else if (item.position == "bottomRight") {
            musicPlayer.style.right = "20px";
            musicPlayer.classList.add("animate__animated", "animate__fadeInRight");
    
            musicAnimation = "animate__animated", "animate__fadeInRight"
          } else if (item.position == "bottomLeft") {
            musicPlayer.style.left = "20px";
            musicPlayer.classList.add("animate__animated", "animate__fadeInLeft");
            musicAnimation = "animate__animated", "animate__fadeInLeft"
          } else if (item.position == "topRight") {
            musicPlayer.style.right = "20px";
            musicPlayer.style.bottom = "";
            musicPlayer.classList.add("animate__animated", "animate__fadeInRight");
            musicAnimation = "animate__animated", "animate__fadeInRight"
            musicPlayer.style.top = "20px";
          } else if (item.position == "topLeft") {
            musicPlayer.style.left = "20px";
            musicPlayer.style.bottom = "";
            musicPlayer.classList.add("animate__animated", "animate__fadeInLeft");
            musicAnimation = "animate__animated", "animate__fadeInLeft"
            musicPlayer.style.top = "20px";
          } else if (item.position == "topMiddle") {
            musicPlayer.style.left = "0";
            musicPlayer.style.right = "0";
            musicPlayer.style.marginLeft = "auto";
            musicPlayer.style.marginRight = "auto";
            musicPlayer.style.bottom = "";
            musicPlayer.classList.add("animate__animated", "animate__fadeInDown");
            musicAnimation = "animate__animated", "animate__fadeInDown"
            musicPlayer.style.top = "20px";
          }
          musicPlayer.style.display = "flex";

          image.src = item.currentSong.thumbnail;
          title.textContent = item.currentSong.title;
          author.textContent = item.currentSong.author;
          
          let truncatedTitle = title.textContent;

          if (title.textContent.length >= 50) {
              truncatedTitle = title.textContent.substring(0, 50) + "...";
          }
          
          title.textContent = truncatedTitle;
      });

      



    }else{
      //Hide MiniPlayer
      var musicPlayer = document.querySelector(".musicPlayer");
      musicPlayer.classList.add(musicAnimation);

      setTimeout(function() {
        musicPlayer.classList.remove(musicAnimation);
        musicPlayer.style.display = "none";
    }, 500);
    }
  } else if (item.event == "updatePlayer") {
    updateProgressBar(item.currentTimeStamp, item.maxTimeStamp);
    if(item.isPaused!=null){
      if(item.isPaused=="paused"){
        visuallyPause(true);
      }else if(item.isPaused=="playing"){
        visuallyPause(false);
      }
      
    }
    if (item.currentSong) {
      if(item.currentSong == "noSong") { 
        setCurrentSong(null, `images/emptyimg.jpg`, Locales["nomedia_present"], "");
        visuallyPause(true);
      }else{
        setCurrentSong(item.currentSong.url, item.currentSong.thumbnail, item.currentSong.title, item.currentSong.author);
      }
    }
    if(item.volume){
      updateCurrentVolume(item.volume);
    } 
    if (item.queue) {
      queuePlaylist(item.queue);
    }
    if (item.loop != null) {
      setLoop(item.loop);
    }
  }

  
});

$(document).keyup(function (event) {
  if (event.which == 27) {
    closeMenu();
    return;
  }
});

function setLoop(isLooped){
  const loopButton = document.getElementById("loop");
  if (isLooped) {
    loopButton.style.color = "white";
  }else{
    loopButton.style.color = "rgb(176, 176, 176)";
  }
}

function queuePlaylist(songs) {
  var player = document.querySelector(".musicplayerscreen");
  var creator = document.querySelector(".playlist-creator");
  var queue = document.querySelector(".song-list");
  var spotapp = document.querySelector(".spot-app");
  var libraryPage = document.querySelector(".librarypage");
  spotapp.style.display = "none";
  creator.style.display = "none";
  var settings = document.getElementById("settingsPage");
  settings.style.display = "none";
  player.style.display = "block";
  libraryPage.style.display = "none";
  playerReturn("home");

  queue.innerHTML = "";

  songs.forEach(function (songData, index) {
    var song = document.createElement("li");
    song.setAttribute("draggable", "true");

    song.innerHTML = `<p>${songData?.title || songData?.options?.title}</p>`;
    song.addEventListener("click", function () {
      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "selectFromQueue",
          index: index,
          handle: handleId,
        })
      );
    });

    queue.append(song);
  });
}

function updateProgressBar(currentTime, maxTime) {
  let formattedMinutes;
  let formattedSeconds;
  let formattedTime;
  let remainingSeconds;

  const progressbar = document.getElementById("duration");
  const currentTimeElement = document.querySelector(".current-time");
  const songlength = document.querySelector(".song-length");

  var formattedMinutesMax = Math.floor(maxTime / 60);
  var remainingSecondsMax = maxTime % 60;
  var formattedSecondsMax = (remainingSecondsMax < 10 ? "0" : "") + remainingSecondsMax;
  var formattedTimeMax = formattedMinutesMax + ":" + formattedSecondsMax;

  songlength.textContent = formattedTimeMax;

  progressbar.setAttribute("max", maxTime);

  // Update progress bar and current time display
  progressbar.value = currentTime;

  formattedMinutes = Math.floor(currentTime / 60);
  remainingSeconds = currentTime % 60;
  formattedSeconds = (remainingSeconds < 10 ? "0" : "") + remainingSeconds;
  formattedTime = formattedMinutes + ":" + formattedSeconds;
  currentTimeElement.textContent = formattedTime;
}



function setCurrentSong(url, thumbnail, title, author) {
  const imageThumb = document.getElementById("musicthumbanil");
  const songName = document.getElementById("songname");
  const byAuthor = document.getElementById("author");
  
  imageThumb.src = `${thumbnail}`;
  songName.textContent = title;
  byAuthor.textContent = author;
}

function pauseHandler() {
  visuallyPause(true)

  $.post(`https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "pause",
      handle: handleId,
    })
  );
}

function playHandler() {
  visuallyPause(false)

  $.post(`https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "resume",
      handle: handleId,
    })
  );
}

function visuallyPause(isPaused) {
  var pauseBtn = document.querySelector(".btn3");
  var playBtn = document.querySelector(".btn");
  if (isPaused) {
    pauseBtn.style.display = "none";
    playBtn.style.display = "block";
  } else {
    pauseBtn.style.display = "block";
    playBtn.style.display = "none";
  }
}

function closeMenu() {
  var songList = document.querySelector(".nextcontainer .song-list");
  var settings = document.getElementById("settingsPage");

  // If settings are open, close them instead of the entire menu
  if (window.getComputedStyle(settings).display !== "none") {
    var back = document.getElementById("backToHome");
    if (back) {
      back.click();
    }
    return;
  }

  while (songList.hasChildNodes()) {
    songList.removeChild(songList.firstChild);
  }

  $.post(`https://nass_musicplayer/closeMenu`);
  const mainContainer = document.getElementById("maincontainer");
  mainContainer.style.transition = "all 0.5s ease-out";
  mainContainer.style.opacity = "0";
  mainContainer.style.transform = "scale(0.8)";

  setTimeout(() => {
    mainContainer.style.display = "none";
  }, 500);
  currentSoundId = null;
}

function changePage(e) {
  var page = e.target.id;
  //var clickedpage = document.getElementById(`${page}`);
  var spotapp = document.querySelector(".spot-app");
  var library = document.getElementById("librarypage");
  var playerscreen = document.querySelector(".musicplayerscreen");
  var libraryp = document.querySelector(".libraryp");
  var libraryicon = document.querySelector(".fa-book");
  var settings = document.getElementById("settingsPage");
  settings.style.display = "none";
  var homep = document.getElementById("homep");
  var homeicon = document.getElementById("home");

  var back = document.getElementById("back");

  if (window.getComputedStyle(spotapp).display !== "none" && page === "yourlibrary") {
    spotapp.style.display = "none";
    library.style.display = "block";


    //loadUserPlaylists();
  } else if (window.getComputedStyle(library).display !== "none" && page === "home") {
    spotapp.style.display = "block";
    library.style.display = "none";

    libraryp.style.color = "";
    libraryicon.style.color = "";

    homep.style.color = "rgb(102, 178, 240)";
    homeicon.style.color = "rgb(102, 178, 240)";
  } else if (window.getComputedStyle(spotapp).display !== "none" && page === "player") {
    playerscreen.style.display = "block";
    spotapp.style.display = "none";
    playerReturn("home");
  }
  

  // Remove existing event listener to prevent duplicates
  back.removeEventListener("click", handleBackFromLibrary);
  
  function handleBackFromLibrary() {
    spotapp.style.display = "block";
    library.style.display = "none";

    libraryp.style.color = "";
    libraryicon.style.color = "";

    homep.style.color = "rgb(102, 178, 240)";
    homeicon.style.color = "rgb(102, 178, 240)";
  }
  
  back.addEventListener("click", handleBackFromLibrary);
}

function openSettings(e) {
  var page = e.target.id;
  //var clickedpage = document.getElementById(`${page}`);
  var spotapp = document.querySelector(".spot-app");
  var library = document.getElementById("librarypage");
  var settings = document.getElementById("settingsPage");
  var playerscreen = document.querySelector(".musicplayerscreen");
  var libraryp = document.querySelector(".libraryp");
  var libraryicon = document.querySelector(".fa-book");
  var homep = document.getElementById("homep");
  var homeicon = document.getElementById("home");
  var back = document.getElementById("backToHome");
  var playlistCreator = document.querySelector(".playlist-creator");

  var currentPage;
  var currentIcon;
  var currentp;

  // Remove any existing event listeners to prevent duplicates
  back.removeEventListener("click", handleBackClick);

  if(window.getComputedStyle(spotapp).display !== "none"){
    currentPage = spotapp;
    currentIcon = homeicon
    currentp = homep
  }else if(window.getComputedStyle(library).display !== "none"){
    currentPage = library;
    currentIcon = libraryicon
    currentp = libraryp
  }else if(window.getComputedStyle(playerscreen).display !== "none"){
    currentPage = playerscreen;
  }else if(window.getComputedStyle(playlistCreator).display !== "none"){
    currentPage = playlistCreator;
  }else{
    // Default to home if no page is visible
    currentPage = spotapp;
    currentIcon = homeicon;
    currentp = homep;
  }

  // Hide all pages and show settings
  spotapp.style.display = "none";
  library.style.display = "none";
  playerscreen.style.display = "none";
  playlistCreator.style.display = "none";
  settings.style.display = "block";

  // Reset all icon colors
  libraryp.style.color = "";
  libraryicon.style.color = "";
  homep.style.color = "";
  homeicon.style.color = "";
  

  function handleBackClick() {
    if (currentPage) {
      currentPage.style.display = "block";
    }
    
    settings.style.display = "none";

    if (currentp) {
        currentp.style.color = "rgb(102, 178, 240)";
        currentIcon.style.color = "rgb(102, 178, 240)";
    }
    back.removeEventListener("click", handleBackClick);
  }
  back.addEventListener("click", handleBackClick);
}

function createPlaylist() {
  var playlistcreator = document.querySelector(".playlist-creator");
  var library = document.getElementById("librarypage");
  playlistcreator.style.display = "block";
  library.style.display = "none";
  var playlistSongs = document.querySelector(".playlist-songs-list");

  var orginalImage = document.querySelector(".playlist-image");
  orginalImage.style.backgroundImage = `url(images/emptyimg.jpg)`;

  playlistSongs.innerHTML = "";

  $("#playlist-title").html(Locales["new_playlist_name"]);
  $("#playlist-description").html(Locales["new_playlist_description"]);

  var playlisttitle = document.getElementById("playlist-title").value;
  var playlistdesc = document.getElementById("playlist-description").value;

  var playlistImageElement = document.querySelector(".playlist-image");
  var playlistimage =
    window.getComputedStyle(playlistImageElement).backgroundImage;
  var backgroundImageURL = playlistimage.replace(
    /url\(['"]?(.*?)['"]?\)/i,
    "$1"
  );

  var goBack = document.getElementById("playlist-back");
  var SpotApp = document.querySelector(".spot-app");

  goBack.addEventListener("click", function () {
    playlistcreator.style.display = "none";
    SpotApp.style.display = "none";
    library.style.display = "block";
    $.post(`https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "getPlaylists",
      }),
      function (data) {
        loadUserPlaylists(data)
      }
    );
    var inputbox = document.querySelector(".add-song");
    var inputbutton = document.querySelector(".add-button");
  
    inputbutton.removeEventListener("click", handleClick);
  
    if (state) {
      inputbox.style.width = "0px";
      inputbox.style.paddingLeft = "0px";
      inputbutton.style.opacity = "0";
      state = false;
    }
  
    inputbutton.addEventListener("click", handleClick);
  });

  $.post(
    `https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "createPlaylist",
      title: playlisttitle,
      description: playlistdesc,
      image: backgroundImageURL,
    }),
    function (data) {
      playlistcreator.setAttribute("playlist-id", data);
    }
  );

  //var optionlistid = document.querySelector(`.options[data-lobby-id="${lobbyid}"]`);
}

function editPlaylist() {
  var playlistsettings = document.querySelector(".edit-popup");
  var playlistcreator = document.querySelector(".playlist-creator");
  var playlistId = playlistcreator.getAttribute("playlist-id");
  var playlistelemid = document.querySelector(
    `.playlist-creator[playlist-id="${playlistId}"]`
  );

  var xmark = document.getElementById("close-edit-popup");
  var playlistpage = document.getElementById("createpage");
  var save = document.querySelector(".save-settings");

  xmark.removeEventListener("click", closeEditPopup);
  save.removeEventListener("click", function () {
    saveSettings(playlistId);
  });

  // set previous inputs before opening menu

  var playlisttitle =
    playlistelemid.querySelector("#playlist-title").textContent;
  var playlistdesc = playlistelemid.querySelector(
    "#playlist-description"
  ).textContent;

  // image src grabber & formatter
  var playlistImageElement = playlistelemid.querySelector(".playlist-image");
  var playlistimage =
    window.getComputedStyle(playlistImageElement).backgroundImage;
  var backgroundImageURL = playlistimage.replace(
    /url\(['"]?(.*?)['"]?\)/i,
    "$1"
  );

  // popup values (settings popup values)
  var title = document.querySelector(".pl-title");
  var image = document.querySelector(".pl-image");
  var desc = document.querySelector(".pl-description");

  title.value = playlisttitle;
  desc.value = playlistdesc;
  image.value = backgroundImageURL;

  // displaying edit playlist popup
  playlistsettings.style.display = "block";
  playlistcreator.style.opacity = "0.40";
  playlistpage.style.pointerEvents = "none";

  xmark.addEventListener("click", closeEditPopup);
  save.addEventListener("click", function () {
    saveSettings(playlistId);
  });

}

function closeEditPopup() {
  var playlistpage = document.getElementById("createpage");
  var playlistsettings = document.querySelector(".edit-popup");
  var playlistcreator = document.querySelector(".playlist-creator");

  playlistsettings.style.display = "none";
  playlistcreator.style.opacity = "1";
  playlistpage.style.pointerEvents = "auto";
}

function saveSettings(playlistId) {
  var playlistsettings = document.querySelector(".edit-popup");
  var playlistcreator = document.querySelector(".playlist-creator");
  var playlistId = playlistcreator.getAttribute("playlist-id");
  var playlistelemid = document.querySelector(
    `.playlist-creator[playlist-id="${playlistId}"]`
  );
  var title = document.querySelector(".pl-title").value;
  var description = document.querySelector(".pl-description").value;
  var image = document.querySelector(".pl-image").value;
  var playlisttitle = playlistelemid.querySelector("#playlist-title");
  var playlistdesc = playlistelemid.querySelector("#playlist-description");
  var playlistimage = playlistelemid.querySelector(".playlist-image");
  var playlistpage = document.getElementById("createpage");

  playlistsettings.style.display = "none";
  playlistcreator.style.opacity = "1";
  playlistpage.style.pointerEvents = "auto";

  playlisttitle.textContent = title;
  playlistdesc.textContent = description;
  playlistimage.style.backgroundImage = `url(${image})`;

  $.post(
    `https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "editPlaylist",
      id: playlistId,
      title: title,
      description: description,
      image: image,
    })
  );
}


var likedSongsListenerAdded = false;
function loadUserPlaylists(data) {
  var userPlaylists = document.querySelector(".user-playlists");
  userPlaylists.innerHTML = "";
  userPlaylists.removeAttribute("playlist-id");

  var likedSongs = document.querySelector(".likedsongs")
  if (!likedSongsListenerAdded) {
    likedSongsListenerAdded = true
    likedSongs.addEventListener("click", function() {
        $.post(`https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "getLikedSongs",
        }),
        function (data) {
          loadLikedSongs(data)
        }
      );
    });
  }

  data.forEach(function (element) {
    // create elements
    var listItem = document.createElement("li");
    var title = document.createElement("h1");

    // add data
    title.classList.add("user-playlist-title");
    listItem.style.backgroundImage = `url(${element.data.image})`;
    title.textContent = `${element.data.title}`;

    let truncatedTitle = title.textContent;

    if (title.textContent.length >= 30) {
      truncatedTitle = title.textContent.substring(0, 27) + "...";
    }

    title.textContent = truncatedTitle;
    // set id for each playlist for eventlistener
    userPlaylists.setAttribute("playlist-id", element.id);

    listItem.addEventListener("click", function () {
      openPlaylist(element);
    });

    // append title and playlist
    listItem.append(title);
    userPlaylists.appendChild(listItem);
  });

  // load playlists in home screen
  var homePlaylists = document.querySelector(".userplaylists");
  var home = document.querySelector(".spot-app");
  homePlaylists.innerHTML = "";
  homePlaylists.removeAttribute("playlist-id");

  data.forEach(function (playlist) {
    var listItem = document.createElement("li");
    var title = document.createElement("h1");

    title.classList.add("home-playlist-title");
    listItem.style.backgroundImage = `url(${playlist.data.image})`;
    title.textContent = `${playlist.data.title}`;

    let truncatedTitle = title.textContent;

    if (title.textContent.length >= 13) {
      truncatedTitle = title.textContent.substring(0, 13) + "...";
    }

    title.textContent = truncatedTitle;
    // set id for each playlist for eventlistener
    homePlaylists.setAttribute("playlist-id", playlist.id);

    listItem.addEventListener("click", function () {
      openPlaylist(playlist, "home");
      home.style.display = "none";
    });

    // append title and playlist
    listItem.append(title);
    homePlaylists.appendChild(listItem);
  });
}

function loadRecentlyPlayed(data) {
  var recentlyplayed = document.querySelector(".recentlyPlayedList");
  recentlyplayed.innerHTML = "";

  data[0].data.forEach(function (songData) {
    var listItem = document.createElement("li");
    var title = document.createElement("h1");

    title.classList.add("recently-title");
    listItem.style.backgroundImage = `url(${songData.thumbnail})`;
    title.textContent = `${songData.title}`;
    
    let truncatedTitle = title.textContent;

    if (title.textContent.length >= 30) {
      truncatedTitle = title.textContent.substring(0, 30) + "...";
    }

    title.textContent = truncatedTitle;

    listItem.addEventListener("click", function () {
      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "playSong",
          url: songData.url,
          duration: songData.duration,
          thumbnail: songData.thumbnail,
          title: songData.title,
          author: songData.author,
          handle: handleId, 
          recent: true,
        })
      );
    });

    // append title and playlist
    listItem.append(title);
    recentlyplayed.appendChild(listItem);
  });
}


function openPlaylist(data, home) {
  var playlistCreator = document.querySelector(".playlist-creator");
  playlistCreator.style.display = "block";
  var library = document.getElementById("librarypage");
  var spotapp = document.querySelector(".spot-app")

  var addtoplay = document.getElementById("addtoplay");
  var deleteplay = document.getElementById("deletePlaylist");
  var pen = document.getElementById("editpen")
  addtoplay.style.display = "block";
  deleteplay.style.display = "block";
  pen.style.display = "block";

  var addliked = document.getElementById("addSongBTN");
  addliked.style.display = "block";

  playlistCreator.removeAttribute("playlist-id");
  playlistCreator.setAttribute("playlist-id", data.id);


  


  playlistListener(data)

  // set playlist to display block
  // clear playlist songs before opening
  var playlistSongs = document.querySelector(".playlist-songs-list");
  playlistSongs.innerHTML = "";

  loadSongs(data); // load all songs from database table

  library.style.display = "none";
  spotapp.style.display = "none"

  var playlistTitle = document.querySelector("#playlist-title");
  var playlistDescription = document.querySelector("#playlist-description");
  var playlistImage = document.querySelector(".playlist-image");

  playlistTitle.textContent = `${data.data.title}`;
  playlistDescription.textContent = `${data.data.description}`;
  playlistImage.style.backgroundImage = `url(${data.data.image})`;

  var goBack = document.getElementById("playlist-back");


  goBack.addEventListener("click", function () {
    if (home == "home") {
      library.style.display = "none";
      playlistCreator.style.display = "none";
      spotapp.style.display = "block"
      playlistCreator.removeAttribute("playlist-id");
    } else {
      playlistCreator.style.display = "none";
      library.style.display = "block";
      spotapp.style.display = "none"
      playlistCreator.removeAttribute("playlist-id");
    }
    var inputbox = document.querySelector(".add-song");
    var inputbutton = document.querySelector(".add-button");
  
    inputbutton.removeEventListener("click", handleClick);
  
    if (state) {
      inputbox.style.width = "0px";
      inputbox.style.paddingLeft = "0px";
      inputbutton.style.opacity = "0";
      state = false;
    }
  
    inputbutton.addEventListener("click", handleClick);
    //loadUserPlaylists();
  });

}


function playlistListener(data) {


  if (!$._data($('.playbutton')[0], 'events')) {
    // If not attached, attach the event handler
    $('.playbutton').on('click', clickHandler);
}



  // Define the event listener function
  function clickHandler() {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "queuePlaylist",
        playlistId: data.id,
        handle: handleId,
      }),
    );
  }

  $('.playbutton').off('click').on('click', clickHandler);




}



function addSong() {
  var inputbox = document.querySelector(".add-song");
  var inputbutton = document.querySelector(".add-button");

  inputbutton.removeEventListener("click", handleClick);

  if (state) {
    inputbox.style.width = "0px";
    inputbox.style.paddingLeft = "0px";
    inputbutton.style.opacity = "0";
    state = false;
  } else {
    inputbox.style.width = "140px";
    inputbox.style.paddingLeft = "5px";
    inputbutton.style.opacity = "1";
    state = true;
  }

  inputbutton.addEventListener("click", handleClick);
}

function handleClick() {
  var videoBox = document.querySelector(".add-song");

  var playlistcreator = document.querySelector(".playlist-creator");
  var playlistId = playlistcreator.getAttribute("playlist-id");
  var videoId = videoBox.value;
  const date = new Date();
  let dateAdded = `${Locales["date_months"][date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`;

  $.post(
    `https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "editPlaylist", 
      id: playlistId,
      song: {
        url : videoId,
        dateAdded : dateAdded,
      },
    }),
    function (data_) {
      setTimeout(() => {
        loadSongs(data_)
      }, 1000);
      
    }
  );

  disableButtonForOneSecond();
  videoBox.value = "";
}

function disableButtonForOneSecond() {
  var inputbutton = document.querySelector(".add-button");
  inputbutton.disabled = true;
  setTimeout(function () {
    inputbutton.disabled = false;
  }, 1000);
}

function loadLikedSongs(data) {
  var playlistCreator = document.querySelector(".playlist-creator");
  playlistCreator.style.display = "block";
  var library = document.getElementById("librarypage");
  var spotapp = document.querySelector(".spot-app")
  var addtoPlaylist = document.getElementById("addtoplay");
  var addinput = document.querySelector(".add-song");
  var deleteplay = document.getElementById("deletePlaylist");
  var addliked = document.getElementById("addSongBTN");
  var pen = document.getElementById("editpen")

  playlistCreator.removeAttribute("playlist-id");
  playlistCreator.setAttribute("playlist-id", data.id);

  var startPlaylist = document.querySelector(".playbutton");

  /*startPlaylist.removeEventListener("click", function () {
    queuePlaylist(data);
  });*/


  // set playlist to display block
  addtoPlaylist.style.display = "none";
  addinput.style.width = "0px";
  deleteplay.style.display = "none";
  pen.style.display = "none"

  addliked.style.display = "none"
  // clear playlist songs before opening
  var playlistSongs = document.querySelector(".playlist-songs-list");
  playlistSongs.innerHTML = "";
 // load all songs from database table

  library.style.display = "none";
  spotapp.style.display = "none"

  loadSongs(data, "liked");
  LikedSongsListener(data)

  var playlistTitle = document.querySelector("#playlist-title");
  var playlistDescription = document.querySelector("#playlist-description");
  var playlistImage = document.querySelector(".playlist-image");

  playlistImage.style.backgroundImage = `url(images/likedsongs.jpg)`;
  playlistTitle.textContent = "Liked Songs"
  playlistDescription.textContent = "All your liked songs";
  //playlistImage.style.backgroundImage = `url(${data.data.image})`;

  var goBack = document.getElementById("playlist-back");


  function handleGoBackClick() {
    playlistCreator.style.display = "none";
    spotapp.style.display = "none";
    library.style.display = "block";
    playlistCreator.removeAttribute("playlist-id");
  
    // Remove the event listeners
    goBack.removeEventListener("click", handleGoBackClick);
    startPlaylist.removeEventListener("click", handleStartPlaylistClick);
    var inputbox = document.querySelector(".add-song");
    var inputbutton = document.querySelector(".add-button");

    inputbutton.removeEventListener("click", handleClick);

    if (state) {
      inputbox.style.width = "0px";
      inputbox.style.paddingLeft = "0px";
      inputbutton.style.opacity = "0";
      state = false;
    }

    inputbutton.addEventListener("click", handleClick);
  }
  
  function handleStartPlaylistClick() {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "getLikedSongs",
      })
    );
  }
  
  // Attach the event listeners
  goBack.addEventListener("click", handleGoBackClick);
  startPlaylist.addEventListener("click", handleStartPlaylistClick);
  
}

function LikedSongsListener(data) {


  if (!$._data($('.playbutton')[0], 'events')) {
    // If not attached, attach the event handler
    $('.playbutton').on('click', clickHandler);
}



  // Define the event listener function
  function clickHandler() {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "queuePlaylist",
        playlistId: data.id,
        liked: true,
        handle: handleId,
      }),
    );
  }

  $('.playbutton').off('click').on('click', clickHandler);




}

function loadSongs(data, type) {
  if(!data.data.songs){
    data.data = JSON.parse(data.data)
  }

  var playlistId = data.id
  
  if (data.data.songs.length > 0) {
    var playlistSongs = document.querySelector(".playlist-songs-list");

    playlistSongs.innerHTML = '';

    data.data.songs.forEach(function(songData, index) {
      var song = document.createElement("li");
      //song.setAttribute("song-link", songData.songId);

      let truncatedTitle = songData.title;

      if (songData.title.length >= 50) {
        truncatedTitle = songData.title.substring(0, 47) + "...";
      }
      song.addEventListener("click", function () {
          $.post(
            `https://nass_musicplayer/callback`,
            JSON.stringify({
              event: "playSong",
              url: songData.videoId,
              thumbnail: songData.thumbnail,
              title: songData.title,
              author: songData.author,
              duration: songData.duration,
              handle: handleId,
            }),
          function (songs) {
            songs.forEach(function (song) {
              setCurrentSong(null, song.thumbnail, song.title, song.author);
            });
          }
        );

        var player = document.querySelector(".musicplayerscreen");
        var creator = document.querySelector(".playlist-creator");
        var spotapp = document.querySelector(".spot-app");
        creator.style.display = "none";
        player.style.display = "block";

        playerReturn("home");

        spotapp.style.display = "none";
      });

      song.addEventListener("contextmenu", function(event) {
        event.preventDefault();
        var dropdown = document.getElementById("dropdown");
        var creator = document.querySelector(".playlist-creator")
        var listItemRect = this.getBoundingClientRect(); 
        var screen = creator.getBoundingClientRect(); 

        var listItemX = listItemRect.left + window.scrollY;
        var listItemY = screen.top + (listItemRect.top/1.9) + creator.scrollTop;

        var clickX = event.clientX - listItemX;
        var clickY = event.clientY - listItemY;
    
        
        var x = Math.min(
            Math.max(clickX - dropdown.offsetWidth / 2, 0), 
            listItemRect.width - dropdown.offsetWidth
        );
        var y = Math.min(
            Math.max(clickY - dropdown.offsetHeight / 2, 0), 
            listItemRect.height - dropdown.offsetHeight
        );
    
        dropdown.style.left = x + 150 + "px";
        dropdown.style.top = (listItemY) + "px";
        dropdown.style.display = "block";

        var deletesong = document.getElementById("deleteSongBTN");
        deletesong.onclick = null;
        deletesong.onclick = function() {
          deleteSong(index, playlistId, type);
          dropdown.style.display = "none";
        };
        
        var addliked = document.getElementById("addSongBTN");
        addliked.onclick = null;
        addliked.onclick = function() {
          $.post(
            `https://nass_musicplayer/callback`,
            JSON.stringify({
              event: "addLikedSong",
              song: songData,
            })
          );
          dropdown.style.display = "none";
        };

        document.addEventListener("click", function(e) {
          if (!song.contains(e.target) && !dropdown.contains(e.target)) {
              dropdown.style.display = "none";
          }
      });
    });
    
    
    //      <i class="fa-solid fa-circle-minus" id="deletesong" onClick="deleteSong(event)"></i>
      song.innerHTML = `
      <img src="${songData.thumbnail}">
      <div id="listdiv">
        <p id="title">${truncatedTitle}</p>
        <p id="author">${songData.author}</p>
      </div>
      <p id="dateAdded">${songData.dateAdded}</p>
      <p id="length">${songData.durationFormatted}</p>
      `;

     /* var deleteButton = song.querySelector("#deletesong");
      deleteButton.setAttribute("song-id", count);*/

      playlistSongs.append(song);

    });
  }
}

function inputSongPlayer() {
  var element = document.querySelector(".song-input");
  var songId = element.value;
  element.value = "";

  $.post(
    `https://nass_musicplayer/callback`,
    JSON.stringify({
      event: "playSong",
      url: songId,
      handle: handleId,
    })
  );
}

function deletePlaylist() {
  var playlistcreator = document.querySelector(".playlist-creator");
  var playlistId = playlistcreator.getAttribute("playlist-id");
  var playlistpage = document.getElementById("createpage");
  var popup = document.querySelector(".delete-popup");
  var confirm = document.querySelector("#del-confirm");
  var cancel = document.querySelector("#del-cancel");

  popup.style.display = "block";
  playlistcreator.style.opacity = "0.40";
  playlistpage.style.pointerEvents = "none";

  cancel.addEventListener("click", function () {
    popup.style.display = "none";
    playlistcreator.style.opacity = "1";
    playlistpage.style.pointerEvents = "auto";
  });

  confirm.addEventListener("click", function () {
    popup.style.display = "none";
    playlistcreator.style.opacity = "1";
    playlistpage.style.pointerEvents = "auto";

    var library = document.getElementById("librarypage");

    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "deletePlaylist",
        id: playlistId,
      })
    );

    

    setTimeout(function () {
      $.post(`https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "getPlaylists",
        }),
        function (data) {
          loadUserPlaylists(data)
        }
      );

      playlistcreator.style.display = "none";
      library.style.display = "block";
      playlistcreator.removeAttribute("playlist-id");
    }, 100);
  });
}

function deleteSong(videoId, playlistId, type) {
  var playlistcreator = document.querySelector(".playlist-creator");
  var playlistId = playlistcreator.getAttribute("playlist-id");
  //var songId = event.target.getAttribute("song-id");
  var playlistSongs = document.querySelector(".playlist-songs-list");
  if (type == "liked") {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "deleteLikedSong",
        id: playlistId,
        songId: videoId,
      })
    );
  } else {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "deleteSong",
        id: playlistId,
        songId: videoId,
      })
    );
  }


  // clear songs

  playlistSongs.innerHTML = "";

  //reload songs

  setTimeout(function () {
    if (type == "liked") {
      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "getLikedSongs",
        }),
        function (data) {
          loadSongs(data, type);
        }
      );
    } else {
      $.post(
        `https://nass_musicplayer/callback`,
        JSON.stringify({
          event: "refreshData",
          id: playlistId,
        }),
        function (data) {
          loadSongs(data[0]);
          loadUserPlaylists(data[1]);
        }
      );
    }
  }, 100);


  /*setTimeout(function () {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "getPlaylist",
        id: playlistId,
      }),
      function (data) {
        loadSongs(data);
      }
    );
  }, 100);

      $.post(`https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "getPlaylists",
      }),
      function (data) {
        loadUserPlaylists(data);
      }
    );*/
}

function playerReturn(prevPage) {
  var backArrow = document.getElementById("backPlayer");
  var homePage = document.querySelector(".spot-app");
  var creator = document.querySelector(".playlist-creator");
  var playerPage = document.querySelector(".musicplayerscreen");

  // Remove existing event listener to prevent duplicates
  backArrow.removeEventListener("click", handlePlayerBackClick);
  
  function handlePlayerBackClick() {
    if (prevPage == "playlist") {
      creator.style.display = "block";
      playerPage.style.display = "none";
      homePage.style.display = "none";
      prevPage = "";
    } else if (prevPage == "home") {
      homePage.style.display = "block";
      playerPage.style.display = "none";
      prevPage = "";
    }
  }
  
  backArrow.addEventListener("click", handlePlayerBackClick);
}

function fetchSongData(url) {
  return new Promise((resolve, reject) => {
    $.post(
      `https://nass_musicplayer/callback`,
      JSON.stringify({
        event: "getSongData",
        url: url,
      }),
      function (data) {
        try {
          resolve({
            title: data.title,
            author: data.author,
            thumbnail: data.thumbnail,
            duration: data.duration,
            videoId: data.videoId,
          });
        } catch (error) {
          reject(new Error("Error parsing song data: " + error.message));
        }
      }
    ).fail((jqXHR, textStatus, errorThrown) => {
      reject(new Error(`POST request failed: ${textStatus} - ${errorThrown}`));
    });
  });
}
