let currentToken = null;
let ScratchAndWin = null;
let DiamondOpen = false;
let NumbersOpen = false;
let DiamondWin = false;
let DiamondCheck = false;
let NumbersCheck = false;

const audio = document.getElementById('audio');
let NumbersWin = null;

let DailyTime = null;
let WeekTime = null;
let WeekDraw = null;

var FirstDiamondTimeout = null;
var SecondDiamondTimeout = null;

const OpenDiamondGame = () => {
    window.$('.popup-card').removeClass('hinge');
    if (window.$('.popup--diamonds').hasClass('show')) {
        window.$('.popup--diamonds').removeClass('show');
    }
    setTimeout(() => {
        DiamondWin = false;
        DiamondCheck = false;
        DiamondOpen = true;
        clearTimeout(FirstDiamondTimeout);
        clearTimeout(SecondDiamondTimeout);
        window.$('.scratch-fields').html('');
        const chance = Math.random();
        if (chance <= (ScratchAndWin.DiamondParty.ChanceToWin / 100)) {
            DiamondWin = true;
            window.$('.scratch-fields').append(`
                <div class='scratch-field scratch-field--diamonds winner'></div>
                <div class='scratch-field scratch-field--diamonds winner'></div>
                <div class='scratch-field scratch-field--diamonds winner'></div>
                <div class='scratch-field scratch-field--diamonds winner'></div>
            `);
        } else {
            let random = Math.floor(Math.random() * 4);
            window.$('.scratch-fields').append(`
                <div class='scratch-field scratch-field--diamonds ${random == 0 ? 'blank' : 'winner'}'></div>
                <div class='scratch-field scratch-field--diamonds ${random == 1 ? 'blank' : 'winner'}'></div>
                <div class='scratch-field scratch-field--diamonds ${random == 2 ? 'blank' : 'winner'}'></div>
                <div class='scratch-field scratch-field--diamonds ${random == 3 ? 'blank' : 'winner'}'></div>
            `);
        }
        const diamondsScratchFields = window.$('.scratch-field--diamonds');
        const diamondsScratchFieldsBlank = window.$('.scratch-field--diamonds.blank');
        const diamondsScratchFieldsWinner = window.$('.scratch-field--diamonds.winner');
        diamondsScratchFieldsWinner.wScratchPad({
            width: diamondsScratchFields.outerWidth(),
            height: diamondsScratchFields.outerHeight(),
            size: 15,
            radius: 6,
            image: './assets/svgs/diamonds.svg',
            scratchUp: function (e, percent) {
                audio.currentTime = 0;
                audio.play();
                e.target.closest('.scratch-field').setAttribute('is-scratched', true);
            }
        });
        diamondsScratchFieldsBlank.wScratchPad({
            width: $('.scratch-field--diamonds').outerWidth(),
            height: $('.scratch-field--diamonds').outerHeight(),
            size: 15,
            radius: 6,
            image: './assets/svgs/crosses.svg',
            scratchUp: function (e, percent) {
                audio.currentTime = 0;
                audio.play();
                e.target.closest('.scratch-field').setAttribute('is-scratched', true);
                if (percent > 5) {
                    window.$.post(`https://${GetParentResourceName()}/lose`, JSON.stringify({ }));
                    e.target.closest('.popup-card').classList.add('hinge');
                    FirstDiamondTimeout = setTimeout(() => {
                        window.$('.forge-lottery').css('display', 'block');
                        e.target.closest('.popup').classList.remove('show');
                    }, 2000);
                    SecondDiamondTimeout = setTimeout(() => {
                        diamondsScratchFields.wScratchPad('reset');
                        e.target.closest('.popup-card').classList.remove('hinge');
                    }, 3000);
                }
            }
        });
        window.$('.forge-lottery').css('display', 'none');
        window.$('.popup--diamonds').addClass('show');
    }, 100);
};

const OpenNumbersGame = () => {
    NumbersWin = null;
    NumbersCheck = false;
    NumbersOpen = true;
    window.$('.desired-number').html('');
    const random1 = GetRadnomNumber(1, 99), random2 = GetRadnomNumber(1, 99), random3 = GetRadnomNumber(1, 99);
    window.$('.desired-number').append(`
        <span>${random1}</span>
        <span>${random2}</span>
        <span>${random3}</span>
    `);
    window.$('.scratch-fields').html('');
    let chance = Math.random();
    if (chance <= (ScratchAndWin.KingOfNumbers.Prizes[3].Chance / 100)) {
        NumbersWin = 3;
        let random = Math.floor(Math.random() * 6);
        let rnd2 = GetRandomNumber1(random);
        let rnd3 = GetRandomNumber2(random, rnd2);
        window.$('.scratch-fields').append(`
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 0 ? random1 : rnd2 == 0 ? random2 : rnd3 == 0 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 1 ? random1 : rnd2 == 1 ? random2 : rnd3 == 1 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 2 ? random1 : rnd2 == 2 ? random2 : rnd3 == 2 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 3 ? random1 : rnd2 == 3 ? random2 : rnd3 == 3 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 4 ? random1 : rnd2 == 4 ? random2 : rnd3 == 4 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 5 ? random1 : rnd2 == 5 ? random2 : rnd3 == 5 ? random3 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
        `);
    } else if (chance <= (ScratchAndWin.KingOfNumbers.Prizes[2].Chance / 100)) {
        NumbersWin = 2;
        let random = Math.floor(Math.random() * 6);
        let rnd2 = GetRandomNumber1(random);
        window.$('.scratch-fields').append(`
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 0 ? random1 : rnd2 == 0 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 1 ? random1 : rnd2 == 1 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 2 ? random1 : rnd2 == 2 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 3 ? random1 : rnd2 == 3 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 4 ? random1 : rnd2 == 4 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 5 ? random1 : rnd2 == 5 ? random2 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
        `);
    } else if (chance <= (ScratchAndWin.KingOfNumbers.Prizes[1].Chance / 100)) {
        NumbersWin = 1;
        let random = Math.floor(Math.random() * 6);
        window.$('.scratch-fields').append(`
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 0 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 1 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 2 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 3 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 4 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${random == 5 ? random1 : GetRandomNumber3(random1, random2, random3)}</div>
            </div>
        `);
    } else if (chance <= (ScratchAndWin.KingOfNumbers.Prizes[0].Chance / 100)) {
        NumbersWin = 0;
        window.$('.scratch-fields').append(`
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
        `);
    } else {
        NumbersWin = 0;
        window.$('.scratch-fields').append(`
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
            <div class='scratch-field scratch-field--numbers'>
                <div class='scratch-field-value'>${GetRandomNumber3(random1, random2, random3)}</div>
            </div>
        `);
    }
    const numbersScratchFields = $('.scratch-field--numbers');
    numbersScratchFields.wScratchPad({
        width: numbersScratchFields.outerWidth(),
        height: numbersScratchFields.outerHeight(),
        size: 15,
        radius: '50%',
        scratchUp: function (e, percent) {
            audio.currentTime = 0;
            audio.play();
            e.target.closest('.scratch-field').setAttribute('is-scratched', true);
        },
    });
    window.$('.forge-lottery').css('display', 'none');
    window.$('.popup--numbers').addClass('show');
};

const ToDataUrl = (url, callback) => {
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        var reader = new FileReader();
        reader.onloadend = function() {
            callback(reader.result);
        }
        reader.readAsDataURL(xhr.response);
    };
    xhr.open('GET', url);
    xhr.responseType = 'blob';
    xhr.send();
};

window.addEventListener('message', (event) => {
    switch (event.data.action) {
        case 'open':
            ScratchAndWin = event.data.scratch;
            window.$('.forge-lottery').addClass('show');
            document.documentElement.style.setProperty('--primary-color', event.data.ui.primaryColor);
            document.documentElement.style.setProperty('--red', event.data.ui.red);
            document.documentElement.style.setProperty('--border-color', event.data.ui.borderColor);
            Object.keys(event.data.ui.translation).forEach((key) => {
                let text = event.data.ui.translation[key];
                window.$(`#${key}`).html(text);
            });
            window.$('.forge-lottery-user-image').attr('src', event.data.mug.base64);
            break;
        case 'updateDaily':
            DailyTime = event.data.time;
            if (event.data.time != null) {
                window.$('.forge-lottery-free-scratch').addClass('disabled');
            } else {
                window.$('.forge-lottery-free-scratch').removeClass('disabled');
            }
            break;
            case 'openGame':
                console.log('Token recibido:', event.data.token); // Debug
                currentToken = event.data.token;
                switch (event.data.game) {
                    case 'diamond':
                        OpenDiamondGame();
                        break;
                    case 'numbers':
                        OpenNumbersGame();
                        break;
                }
                break;
            case 'setOtherData':
                window.$('.forge-lottery-user-name').html(event.data.data.fullname);
                window.$('.forge-lottery-user-winning').html(`Winnings: <em>$</em>${event.data.data.winnings}`);
                window.$('#lastwinner').html(event.data.data.lastwin);
                window.$('.forge-lottery-leaderboard-list').html('');
                // Sort the leaderboard from highest to lowest
                const leaderboard = event.data.data.leaderboard.sort((a, b) => (a.amount < b.amount) ? 1 : ((b.amount < a.amount) ? -1 : 0));
                for (let idx = 0; idx < 5; idx++) {
                    if (leaderboard[idx]) {
                        window.$('.forge-lottery-leaderboard-list').append(`
                            <div class="forge-lottery-leaderboard-item">
                                <span><em>${idx + 1}.</em></span>
                                <span>${leaderboard[idx].name}</span>
                                <span><em>$</em>${leaderboard[idx].amount}</span>
                            </div>
                        `);
                    }
                }
                break;    
        case 'updateWeek':
            WeekTime = event.data.time;
            WeekDraw = event.data.draw;
            break;
        case 'getMug':
            ToDataUrl(event.data.img, (base64) => {
                window.$.post(`https://${GetParentResourceName()}/mugshot`, JSON.stringify({
                    base64: base64,
                    handle: event.data.handle,
                    id: event.data.id
                }));
            });
            break;
    };
});

const SecondsToString = (secs) => {
    let secNum = parseInt(secs, 10);
    let hours = Math.floor(secNum / 3600);
    let minutes = Math.floor(secNum / 60) % 60;
    return [ hours, minutes ];
};

setInterval(() => {
    if (DailyTime != null) {
        DailyTime = DailyTime + 1;
        const diff = 86400 - DailyTime;
        if (diff <= 0) {
            DailyTime = null;
            window.$('.forge-lottery-free-scratch').removeClass('disabled');
            window.$('.forge-lottery-free-scratch-timeros-countdown').html(`
                <div class="forge-lottery-free-scratch-timeros-hours">
                    00
                </div>
                :
                <div class="forge-lottery-free-scratch-timeros-minutes">
                    00
                </div>
                <small>H</small>
            `);
        } else {
            const [ hours, minutes ] = SecondsToString(diff);
            window.$('.forge-lottery-free-scratch-timeros-countdown').html(`
                <div class="forge-lottery-free-scratch-timeros-hours">
                    ${hours > 10 ? hours : '0'+hours}
                </div>
                :
                <div class="forge-lottery-free-scratch-timeros-minutes">
                    ${minutes > 10 ? minutes : '0'+minutes}
                </div>
                <small>H</small>
            `);
        }
    }
}, 1000);

setInterval(() => {
    if (WeekTime != null) {
        WeekTime = WeekTime + 1;
        const diff = WeekDraw - WeekTime;
        if (diff <= 0) {
            window.$('.forge-lottery-winner-timer').html(`
                <div class="forge-lottery-winner-timer-hours">
                    00
                </div>
                :
                <div class="forge-lottery-winner-timer-minutes">
                    00
                </div>
                <small>H</small>
            `);
        } else {
            const [ hours, minutes ] = SecondsToString(diff);
            window.$('.forge-lottery-winner-timer').html(`
                <div class="forge-lottery-winner-timer-hours">
                    ${hours > 10 ? hours : '0'+hours}
                </div>
                :
                <div class="forge-lottery-winner-timer-minutes">
                    ${minutes > 10 ? minutes : '0'+minutes}
                </div>
                <small>H</small>
            `);
        }
    }
}, 1000);

window.$('.forge-lottery-close').on('click', () => {
    window.$('.forge-lottery').removeClass('show');
    window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({ }));
});

window.$('#diamond-card').on('click', () => {
    window.$('#number-card').removeClass('active');
    window.$('#number-card-info').removeClass('active');
    window.$('#diamond-card').addClass('active');
    window.$('#diamond-card-info').addClass('active');
});

window.$('#number-card').on('click', () => {
    window.$('#diamond-card').removeClass('active');
    window.$('#diamond-card-info').removeClass('active');
    window.$('#number-card').addClass('active');
    window.$('#number-card-info').addClass('active');
});

// Modificar botón de diamantes
window.$('#diamonds-card-btn').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyCard`, JSON.stringify({
        type: 'diamond'
    }), (response) => {
        if (response.success) {
            currentToken = response.token;
            OpenDiamondGame();
        }
    });
});

window.$('#diamonds-check-btn').on('click', () => {
    let areAllFieldsScratched = true;
    if (!DiamondWin) return;
    if (DiamondCheck) return;
    const diamondsScratchFields = window.$('.scratch-field--diamonds');
    diamondsScratchFields.each(function() {
        const element = window.$(this);
        if (element.attr('is-scratched') != null && !element.attr('is-scratched')) {
            areAllFieldsScratched = false
        }
    });
    if (areAllFieldsScratched) {
        DiamondCheck = true;
        // console.log('Pre-envío:', currentToken); // Debug 1
        diamondsScratchFields.wScratchPad('clear');
        window.$.post(`https://${GetParentResourceName()}/giveReward`, JSON.stringify({
            token: currentToken, // Incluir el token recibido previamente
            cType: 'diamond',
            win: DiamondWin
        }));
        // console.log('Token:', currentToken, 'Type:', 'diamond');
        setTimeout(() => {
            DiamondOpen = false;
            window.$('.popup--diamonds').removeClass('show');
            window.$('.forge-lottery').css('display', 'block');
        }, 1000);
    }
});

const GetRadnomNumber = (min, max) => {
    const minCeiled = Math.ceil(min);
    const maxFloored = Math.floor(max);
    return Math.floor(Math.random() * (maxFloored - minCeiled) + minCeiled);
};

const GetRandomNumber3 = (not1, not2, not3) => {
    const random = GetRadnomNumber(1, 99);
    if (random == not1 || random == not2 || random == not3) return GetRandomNumber3(not1, not2, not3);
    return random;
};

const GetRandomNumber1 = (not) => {
    const random = Math.floor(Math.random() * 6);
    if (random == not) return GetRandomNumber1(not);
    return random;
};

const GetRandomNumber2 = (not1, not2) => {
    const random = Math.floor(Math.random() * 6);
    if (random == not1 || random == not2) return GetRandomNumber2(not1, not2);
    return random;
};

// Modificar botón de números
window.$('#numbers-card-btn').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyCard`, JSON.stringify({
        type: 'numbers'
    }), (response) => {
        if (response.success) {
            currentToken = response.token;
            OpenNumbersGame();
        }
    });
});

window.$('#numbers-check-btn').on('click', () => {
    let areAllFieldsScratched = true;
    if (NumbersCheck) return;
    const numbersScratchFields = $('.scratch-field--numbers');
    numbersScratchFields.each(function () {
        const element = window.$(this);
        if (element.attr('is-scratched') != null && !element.attr('is-scratched')) {
            areAllFieldsScratched = false;
        }
    });
    if (areAllFieldsScratched) {
        NumbersCheck = true;
        numbersScratchFields.wScratchPad('clear');
        window.$.post(`https://${GetParentResourceName()}/giveReward`, JSON.stringify({
            token: currentToken, // Incluir el token recibido previamente
            cType: 'numbers',
            win: NumbersWin
        }));
        setTimeout(() => {
            NumbersOpen = false;
            window.$('.popup--numbers').removeClass('show');
            window.$('.forge-lottery').css('display', 'block');
        }, 1000);
    }
});

const navBtns = document.querySelectorAll('.forge-lottery-nav-button');
const panels = document.querySelectorAll('.forge-lottery-panel');

navBtns.forEach((btn, index) => {
    btn.addEventListener('click', () => {
        navBtns.forEach((btn) => btn.classList.remove('active'));
        panels.forEach((panel) => panel.classList.remove('active'));
        btn.classList.add('active');
        panels[index].classList.add('active');
    });
});

const ticketsImagesSwiper = new Swiper('.swiper--tickets-images', {
    allowTouchMove: false,
    initialSlide: 1,
    speed: 500,
    centeredSlides: true,
    slidesPerView: 3,
    navigation: {
        prevEl: '.swiper--tickets-images .swiper-button-prev',
        nextEl: '.swiper--tickets-images .swiper-button-next'
    }
});

const ticketsInfoSwiper = new Swiper('.swiper--tickets-info', {
    allowTouchMove: false,
    initialSlide: 1,
    speed: 500
});

ticketsImagesSwiper.on('slideChange', (e) => {
    ticketsInfoSwiper.slideTo(e.activeIndex);
});

const wheelSwiper = new Swiper('.swiper--wheel', {
    allowTouchMove: false,
    initialSlide: 4,
    centeredSlides: true,
    speed: 1500,
    slidesPerView: 5
});

let WheelNumber = null;

document.querySelector('#wheel-btn').addEventListener('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyCard`, JSON.stringify({
        type: 'wheel'
    }), (response) => {
        if (response.success) {
            currentToken = response.token; // Usar variable global
            WheelNumber = Math.floor(Math.random() * 10);
            wheelSwiper.slideTo(WheelNumber);
        }
    });
});

wheelSwiper.on('slideChangeTransitionEnd', () => {
    window.$.post(`https://${GetParentResourceName()}/giveReward`, JSON.stringify({
        token: currentToken, // Incluir el token recibido previamente
        cType: 'wheel',
        win: WheelNumber
    }));
});

document.addEventListener('keydown', (event) => {
    if (event.keyCode == 27) {
        if (!DiamondOpen && !NumbersOpen) {
            window.$('.forge-lottery').removeClass('show');
            window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({ }));
        }
    }
});

window.$('#free-scratch-btn').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/takeDaily`, JSON.stringify({ }));
});

window.$('#checkprize').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/checkPrize`, JSON.stringify({ }));
});

window.$('#buybronze').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyTicket`, JSON.stringify({ type: 'Bronze' }));
});

window.$('#buysilver').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyTicket`, JSON.stringify({ type: 'Silver' }));
});

window.$('#buygold').on('click', () => {
    window.$.post(`https://${GetParentResourceName()}/buyTicket`, JSON.stringify({ type: 'Gold' }));
});