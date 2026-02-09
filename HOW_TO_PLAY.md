# 🎮 How to Play Quantum Mus

Welcome to Quantum Mus! This guide will get you playing in just a few minutes.

## 🚀 Quick Start (3 Steps)

### Step 1: Start the Server

Choose your platform:

#### **🐧 Linux/Mac:**
```bash
chmod +x scripts/run.sh
./scripts/run.sh
```

#### **🪟 Windows:**
```cmd
scripts\run.bat
```

#### **📝 Manual Start:**
```bash
# Install dependencies
pip install -r requirements.txt

# Start server
cd backend
python server.py
```

**Expected Output:**
```
========================================
  Quantum Mus Backend Server
========================================
...
Starting server on http://localhost:5000
```

### Step 2: Open Your Browser

Open your web browser and navigate to:
```
http://localhost:5000
```

You should see the Quantum Mus game interface with quantum gates and the "JUGAR" (Play) button.

### Step 3: Start Playing!

1. **Click "JUGAR"** - This opens the main menu
2. **Choose an option:**
   - **Crear partida** (Create Game) - Host a new game room
   - **Unirse a partida** (Join Game) - Join an existing room with a code

3. **Wait for players** - The game needs 4 players total to start
4. **Play the game!**

---

## 🎲 Game Overview

Quantum Mus is a 4-player card game (2v2 teams) with quantum mechanics:

- **Players:** 4 players in 2 teams (Team 1 vs Team 2)
- **Goal:** First team to reach 40 points wins
- **Cards:** Spanish deck with quantum superposition effects
- **Rounds:** MUS → GRANDE → CHICA → PARES → JUEGO

### Basic Game Flow

1. **MUS Phase** - Decide to keep or change cards
   - Say "MUS" to change cards
   - Say "PASO" to keep your cards and continue

2. **GRANDE Phase** - Bet on who has higher cards
   - Choose: PASO, ENVIDO (bet 5 points), or ORDAGO (all points)

3. **CHICA Phase** - Bet on who has lower cards
   - Same betting options as GRANDE

4. **PARES & JUEGO** - Special combinations (if you have them)

---

## 🎯 Testing Your Setup

### Option 1: Open Multiple Browser Windows

1. Start the server: `./scripts/run.sh`
2. Open 4 browser tabs to `http://localhost:5000`
3. Have the first player create a room
4. Share the room code with other tabs
5. Play!

### Option 2: Use Test Client

```bash
cd tests
python test_client.py
```

This connects a test player to simulate gameplay.

### Option 3: Check Server Health

Visit: `http://localhost:5000/health`

You should see: `{"status": "healthy"}`

---

## 🎮 Game Controls

### In the Browser Interface:

- **Quantum Gates** - Interactive buttons on the cover screen
- **Create Room** - Start a new game lobby
- **Join Room** - Enter with a room code
- **Game Actions** - Click buttons during gameplay:
  - MUS / PASO
  - ENVIDO / ORDAGO
  - Discard cards (click to select)

### Keyboard Shortcuts (if implemented):
- `M` - MUS
- `P` - PASO
- `E` - ENVIDO
- `O` - ORDAGO

---

## 🐛 Troubleshooting

### Server won't start?

**Check Python version:**
```bash
python --version  # Should be 3.8 or higher
```

**Install missing dependencies:**
```bash
pip install -r requirements.txt
```

**Check if port 5000 is in use:**
```bash
# Linux/Mac
lsof -i :5000

# Windows
netstat -ano | findstr :5000
```

### Can't connect to server?

1. Make sure server is running (check terminal output)
2. Verify URL is `http://localhost:5000` (not https)
3. Check browser console for errors (F12 → Console)
4. Try a different browser

### Game not loading?

1. Clear browser cache (Ctrl+Shift+R or Cmd+Shift+R)
2. Check browser console for JavaScript errors
3. Verify files exist in `frontend/` directory:
   - `frontend/index.html`
   - `frontend/js/game.js`
   - `frontend/css/styles.css`

### Need 4 players but testing alone?

Use the test client to simulate players:

```bash
# Terminal 1 - Start server
./scripts/run.sh

# Terminal 2 - Test client 1
cd tests && python test_client.py

# Terminal 3 - Test client 2
cd tests && python test_client.py

# ... repeat for 4 players
```

---

## 📚 Learn More

- **Game Rules:** See `docs/QUICKSTART.md` for detailed Mus rules
- **API Documentation:** See `docs/SOCKET_PROTOCOL.md` for WebSocket events
- **Backend Structure:** See `docs/BACKEND_STRUCTURE.md` for code architecture
- **Deployment:** See `docs/DEPLOYMENT.md` for production deployment

---

## 🎊 Ready to Play!

That's it! You're ready to experience quantum card gaming.

**Quick Recap:**
1. Run `./scripts/run.sh` (or `scripts\run.bat` on Windows)
2. Open `http://localhost:5000` in your browser
3. Click "JUGAR" and create/join a game
4. Wait for 4 players and start playing!

Enjoy Quantum Mus! 🎴✨

---

## 💡 Tips for First-Time Players

- **Teams:** Players 0 & 2 vs Players 1 & 3
- **Communication:** In real Mus, teammates use secret signals (winks, gestures). Here, you can chat!
- **Quantum Cards:** Cards exist in superposition until observed - they may change!
- **Betting Strategy:** Start conservative, learn when to bet big
- **MUS Phase:** If you have bad cards, say MUS to get new ones

Have fun! 🚀
