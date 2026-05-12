        let gameConfig = {};
        let gameState = {
            isPlaying: false,
            currentWord: '',
            seenWords: [],
            currentWordIndex: 0,
            errors: 0,
            timeLeft: 0,
            timer: null,
            wordPool: [],
            isWordSeen: false
        };

        const elements = {
            gameContainer: document.getElementById('gameContainer'),
            gameScreen: document.getElementById('gameScreen'),
            resultScreen: document.getElementById('resultScreen'),
            wordDisplay: document.getElementById('wordDisplay'),
            gameButtons: document.getElementById('gameButtons'),
            timeLeft: document.getElementById('timeLeft'),
            wordCount: document.getElementById('wordCount'),
            totalWords: document.getElementById('totalWords'),
            errors: document.getElementById('errors'),
            maxErrors: document.getElementById('maxErrors'),
            progressBar: document.getElementById('progressBar'),
            resultTitle: document.getElementById('resultTitle'),
            resultStats: document.getElementById('resultStats'),
            btnSeen: document.getElementById('btnSeen'),
            btnNew: document.getElementById('btnNew'),
            btnClose: document.getElementById('btnClose')
        };

        elements.btnSeen.addEventListener('click', () => answerSeen());
        elements.btnNew.addEventListener('click', () => answerNew());

        window.addEventListener('message', function(event) {
            if (event.data.action === 'startGame') {
                gameConfig = event.data.config;
                startGame();
            }
        });

        function startGame() {
            resetGame();
            elements.gameContainer.style.display = 'block';
            
            gameState.timer = setInterval(() => {
                gameState.timeLeft--;
                updateUI();
                
                if (gameState.timeLeft <= 0) {
                    endGame(false, 'Time is UP!');
                }
            }, 1000);

            setTimeout(() => {
                showNextWord();
            }, 1000);
        }

        function resetGame() {
            gameState.isPlaying = true;
            gameState.currentWord = '';
            gameState.seenWords = [];
            gameState.currentWordIndex = 0;
            gameState.errors = 0;
            gameState.timeLeft = gameConfig.timeLimit;
            gameState.wordPool = [...gameConfig.words];
            elements.wordDisplay.textContent = 'Starting...';

            if (gameState.timer) {
                clearInterval(gameState.timer);
            }

            elements.gameScreen.style.display = 'block';
            elements.resultScreen.style.display = 'none';
            updateUI();
        }

        function showNextWord() {
            if (gameState.currentWordIndex >= gameConfig.totalWords) {
                endGame(true, 'Complimenti!');
                return;
            }

            const showSeenWord = gameState.seenWords.length > 0 && Math.random() < 0.5;
            
            if (showSeenWord) {
                gameState.currentWord = gameState.seenWords[Math.floor(Math.random() * gameState.seenWords.length)];
                gameState.isWordSeen = true;
            } else {
                if (gameState.wordPool.length === 0) {
                    gameState.currentWord = gameState.seenWords[Math.floor(Math.random() * gameState.seenWords.length)];
                    gameState.isWordSeen = true;
                } else {
                    const randomIndex = Math.floor(Math.random() * gameState.wordPool.length);
                    gameState.currentWord = gameState.wordPool[randomIndex];
                    gameState.wordPool.splice(randomIndex, 1);
                    gameState.seenWords.push(gameState.currentWord);
                    gameState.isWordSeen = false;
                }
            }

            elements.wordDisplay.textContent = gameState.currentWord;
            gameState.currentWordIndex++;
            updateUI();
        }

        function answerSeen() {
            checkAnswer(true);
        }

        function answerNew() {
            checkAnswer(false);
        }

        function checkAnswer(userSaidSeen) {
            if (!gameState.isPlaying) return;
            
            const correct = userSaidSeen === gameState.isWordSeen;
            
            if (!correct) {
                gameState.errors++;
                if (gameState.errors >= gameConfig.maxErrors) {
                    endGame(false, 'Troppi errori!');
                    return;
                }
            }

            showNextWord();
        }

        function endGame(success, message) {
            gameState.isPlaying = false;
            clearInterval(gameState.timer);

            elements.gameScreen.style.display = 'none';
            elements.resultScreen.style.display = 'block';

            let finalMessage = success ? 'YOU WON THE MINIGAME!' : 
                (gameState.timeLeft <= 0 ? 'TIME IS UP' : 'MINIGAME FAILED');
                elements.resultTitle.textContent = finalMessage;
                elements.resultTitle.className = `result-title ${success ? 'success' : 'failure'}`;
                elements.resultStats.innerHTML = '';
                setTimeout(() => {
                    closeGame();
                }, 2000);

            fetch('https://hh_wordmemory/gameResult', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    success: success,
                    wordsCompleted: gameState.currentWordIndex - 1,
                    totalWords: gameConfig.totalWords,
                    errors: gameState.errors,
                    maxErrors: gameConfig.maxErrors,
                    timeLeft: gameState.timeLeft,
                    reason: message
                })
            });
        }

        function closeGame() {
            elements.gameContainer.style.display = 'none';
            fetch('https://hh_wordmemory/closeGame', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        }

        function updateUI() {
            elements.timeLeft.textContent = gameState.timeLeft;
            elements.wordCount.textContent = gameState.currentWordIndex - 1;
            elements.totalWords.textContent = gameConfig.totalWords;
            elements.errors.textContent = gameState.errors;
            elements.maxErrors.textContent = gameConfig.maxErrors;
            
            const progress = ((gameState.currentWordIndex - 1) / gameConfig.totalWords) * 100;
            elements.progressBar.style.width = `${Math.max(0, progress)}%`;
        }