const maxTimeDifference = 2;

function sendMessage(name, params) {
    return fetch(`https://nass_musicplayer/${name}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(params)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Assuming the response is JSON
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        return null;
    });
}

function removeRadioFilter(player) {
    // Make sure the context and source exist
    if (!player.audioContext || !player.audioSource) {
        return;
    }

    // Disconnect everything in the chain
    if (player.splitter) player.splitter.disconnect();
    if (player.merger)   player.merger.disconnect();
    if (player.gainNode) player.gainNode.disconnect();
    if (player.lowpass)  player.lowpass.disconnect();
    if (player.highpass) player.highpass.disconnect();
    if (player.lowMidBoost) player.lowMidBoost.disconnect();
    if (player.trebleCut) player.trebleCut.disconnect();

    // Disconnect the audio source
    player.audioSource.disconnect();

    // Now connect directly to the output
    player.audioSource.connect(player.audioContext.destination);

    // Clear out references to filter nodes (optional)
    player.splitter     = null;
    player.merger       = null;
    player.gainNode     = null;
    player.lowpass      = null;
    player.highpass     = null;
    player.lowMidBoost  = null;
    player.trebleCut    = null;
    
    // Mark that the filter is removed
    player.nass.filterAdded = false;
}


function applyRadioFilter(player) {
    // 1) Create or reuse the AudioContext
    if (!player.audioContext) {
        player.audioContext = new (window.AudioContext || window.webkitAudioContext)();
    }
    const context = player.audioContext;

    // 2) Create or reuse the MediaElementSourceNode
    if (!player.audioSource) {
        let mediaElement;
        if (player.youTubeApi) {
            mediaElement = player.youTubeApi
                .getIframe()
                .contentWindow.document.querySelector('.html5-main-video');
        } else if (player.hlsPlayer) {
            mediaElement = player.hlsPlayer.media;
        } else if (player.originalNode) {
            mediaElement = player.originalNode;
        } else {
            mediaElement = player; // <video> or <audio> element
        }
        if (!mediaElement) return;

        player.audioSource = context.createMediaElementSource(mediaElement);
    }

    // 3) Remove any existing filter chain
    removeRadioFilter(player);

    // 4) Build the muffled car door effect chain
    const splitter = context.createChannelSplitter(2);
    const merger   = context.createChannelMerger(2);

    // Main lowpass filter: Cut everything above 2.5 kHz for more muffled effect
    const lowpass = context.createBiquadFilter();
    lowpass.type = 'lowpass';
    lowpass.frequency.value = 2500; // 2.5 kHz cutoff for more muffled sound
    lowpass.Q.value = 0.8;          // Sharper slope for more treble removal

    // Highpass filter: Remove all bass frequencies completely
    const highpass = context.createBiquadFilter();
    highpass.type = 'highpass';
    highpass.frequency.value = 250;  // Remove all bass frequencies (100% bass removal)
    highpass.Q.value = 0.7;          // Sharper slope for complete bass cutoff

    // EQ for low-mid boost (200-400 Hz): Add warmth and thickness
    const lowMidBoost = context.createBiquadFilter();
    lowMidBoost.type = 'peaking';
    lowMidBoost.frequency.value = 300;  // Center of 200-400 Hz range
    lowMidBoost.Q.value = 1.0;          // Moderate Q for natural boost
    lowMidBoost.gain.value = 3;         // +3 dB boost for warmth

    // EQ for treble reduction (2-4 kHz): Reduce harshness more aggressively
    const trebleCut = context.createBiquadFilter();
    trebleCut.type = 'peaking';
    trebleCut.frequency.value = 3000;   // Center of 2-4 kHz range
    trebleCut.Q.value = 1.2;            // Higher Q for more focused cut
    trebleCut.gain.value = -10;         // -10 dB cut for more muffled effect

    // Overall gain adjustment for muffled effect
    const gainNode = context.createGain();
    gainNode.gain.value = 0.65;  // Lower volume for muffled effect

    // Connect the audio chain
    player.audioSource.connect(splitter);
    splitter.connect(merger, 0, 0);
    splitter.connect(merger, 1, 0);
    splitter.connect(merger, 0, 1);
    splitter.connect(merger, 1, 1);

    merger.connect(highpass);
    highpass.connect(lowMidBoost);
    lowMidBoost.connect(trebleCut);
    trebleCut.connect(lowpass);
    lowpass.connect(gainNode);
    gainNode.connect(context.destination);

    // Store references for cleanup
    player.splitter    = splitter;
    player.merger      = merger;
    player.gainNode    = gainNode;
    player.highpass    = highpass;
    player.lowpass     = lowpass;
    player.lowMidBoost = lowMidBoost;
    player.trebleCut   = trebleCut;

    player.nass.filterAdded = true;
}


function initPlayer(id, handle, options) {
    var player = document.createElement('video');
    player.id = id;
    player.src = options.url;
    document.body.appendChild(player);


    new MediaElement(id, {
        error: function(media) {
            media.remove();
        },
        success: function(media, domNode) {
            media.className = 'player';

            media.nass = {};
            media.nass.initialized = false;
            media.nass.volumeFactor = options.diffRoomVolume;

            media.volume = 0;

            media.addEventListener('error', event => {
                if (!media.nass.initialized) {
                    media.remove();
                }
            });

            media.addEventListener('canplay', () => {
                if (media.nass.initialized) {
                    return;
                }

                if (
                    media.duration == NaN ||
                    media.duration == Infinity ||
                    media.duration == 0 ||
                    media.hlsPlayer
                ) {
                    options.offset = 0;
                    options.duration = false;
                    options.loop = false;
                } else {
                    options.duration = media.duration;
                }

                if (media.youTubeApi) {
                    options.title = media.youTubeApi.getVideoData().title;
                    media.videoTracks = {length: 1};
                } else if (media.hlsPlayer) {
                    media.videoTracks = media.hlsPlayer.videoTracks;
                } else if (media.twitchPlayer) {
                    // Auto-click Twitch mature content warning button
                    let button = media.twitchPlayer._iframe.contentWindow.document.querySelector(
                        'button[data-a-target="player-overlay-mature-accept"]'
                    );
                    if (button) {
                        button.click();
                    }
                } else {
                    media.videoTracks = media.originalNode.videoTracks;
                }

                options.video = true;

                /*sendMessage('init', {
                    handle: handle,
                    options: options
                });*/

                media.nass.initialized = true;
                media.play();
            });

            media.addEventListener('playing', () => {
                if (options.filter && !media.nass.filterAdded) {
                    applyRadioFilter(media);
                    media.nass.filterAdded = true;
                }
            });

            media.play();
        }
    });
}

function getPlayer(handle, options) {
    if (handle === undefined) {
        return;
    }

    var id = 'player_' + handle.toString();
    var player = document.getElementById(id);

    if (!player && options && options.url) {
        player = initPlayer(id, handle, options);
    }
    return player;
}

function parseTimecode(timecode) {
    if (typeof timecode !== 'string') {
        return timecode;
    } else if (timecode.includes(':')) {
        var a = timecode.split(':');
        return parseInt(a[0]) * 3600 + parseInt(a[1]) * 60 + parseInt(a[2]);
    } else {
        return parseInt(timecode);
    }
}

function init(data) {
    if (data.url === '') {
        return;
    }
    data.options.offset = parseTimecode(data.options.offset);
    if (!data.options.title) {
        data.options.title = data.options.url;
    }
    getPlayer(data.handle, data.options);
}

function play(handle) {
    var player = getPlayer(handle);
}

function stop(handle) {
    var player = getPlayer(handle);
    if (player) {
        var noise = document.getElementById(player.id + '_noise');
        if (noise) {
            noise.remove();
        }
        player.remove();
    }
}

function setVolumeFactor(player, target) {
    if (player.nass.volumeFactor > target) {
        player.nass.volumeFactor -= 0.01;
    } else {
        player.nass.volumeFactor += 0.01;
    }
}

function setVolume(player, target) {
    if (Math.abs(player.volume - target) > 0.1) {
        if (player.volume > target) {
            player.volume -= 0.05;
        } else {
            player.volume += 0.05;
        }
    }
}

function update(data) {
    var player = getPlayer(data.handle, data.options);
    if (!player) {
        return;
    }

    // Pause if out of range or explicitly paused
    if (data.options.paused || data.distance < 0 || data.distance > data.options.range) {
        if (!player.paused) {
            player.pause();
        }
    } else {
        // In range & not paused
        if (data.sameRoom) {
            setVolumeFactor(player, 1.0);
        } else {
            setVolumeFactor(player, data.options.diffRoomVolume);
        }

        if (player.readyState > 0) {
            // Manage filter
			
            if (data.options.filter && !player.nass.filterAdded) {
				// Apply if the filter is requested and not active
				applyRadioFilter(player);
			} else if (!data.options.filter && player.nass.filterAdded) {
				// Remove if the filter is no longer requested
				removeRadioFilter(player);
			}
			

            // Calculate volume based on distance
            let volume;
            if (data.options.muted || data.volume === 0) {
                volume = 0;
            } else {
                const distanceFactor = Math.max(0, (data.options.range - data.distance) / data.options.range);
                volume = (distanceFactor * player.nass.volumeFactor) * (data.volume / 100);


                //volume = (((100 - data.distance * 7) / 100)* player.nass.volumeFactor) * (data.volume / 100);
            }

            if (volume > 0) {
                if (data.distance > 100) {
                    setVolume(player, volume);
                } else {
                    player.volume = volume;
                }
            } else {
                player.volume = 0;
            }

            // Adjust time if there's a big offset mismatch
            if (data.options.duration) {
                var currentTime = data.options.offset % player.duration;
                if (Math.abs(currentTime - player.currentTime) > maxTimeDifference) {
                    player.currentTime = currentTime;
                }
            }

            if (player.paused) {
                player.play();
            }
        }
    }
}

window.addEventListener('message', event => {
    switch (event.data.type) {
        case 'init':
            init(event.data);
            break;
        case 'play':
            play(event.data.handle);
            break;
        case 'stop':
            stop(event.data.handle);
            break;
        case 'update':
            update(event.data);
            break;
        case 'DuiBrowser:init':
            sendMessage('DuiBrowser:initDone', {handle: event.data.handle});
            break;
    }
});
