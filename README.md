# Quantum Mus

A multiplayer quantum card game using Flask, Socket.IO, and Qiskit. This project features real-time WebSocket communication and quantum mechanics in card gameplay.

> **🎮 Want to start playing right now?** See **[HOW_TO_PLAY.md](HOW_TO_PLAY.md)** for a quick 3-step guide!

## 📁 Project Structure

```
├── backend/                    # Backend Python server
│   ├── server.py              # Main Flask + Socket.IO server
│   ├── game_manager.py        # Manages active game instances
│   ├── room_manager.py        # Manages game rooms/lobbies
│   ├── game_logic.py          # Main game state and logic
│   ├── round_handlers.py      # Round-specific logic (MUS, GRANDE, CHICA)
│   ├── card_deck.py           # Quantum card and deck management
│   ├── models.py              # Database models
│   └── quantum/               # Quantum logic module
│       ├── baraja.py          # Quantum deck
│       ├── cartas.py          # Quantum cards
│       ├── dealer.py          # Dealer logic
│       ├── efecto_tunel.py    # Tunnel effect
│       └── jugador.py         # Player logic
│
├── frontend/                   # Frontend HTML/JS/CSS
│   ├── index.html             # Main game interface
│   ├── schrodinger-timer.html # Timer interface
│   ├── test-probabilities.html # Testing interface
│   ├── js/                    # JavaScript files
│   │   ├── game.js            # Main game logic
│   │   ├── navigation.js      # Navigation handling
│   │   ├── config.js          # Configuration
│   │   └── ...
│   ├── css/                   # Stylesheets
│   │   ├── styles.css         # Main styles
│   │   └── navigation-styles.css
│   └── assets/                # Static assets
│       └── generate-cards.js
│
├── tests/                      # Test files
│   ├── test_client.py
│   ├── test_auto_client2.py
│   ├── test_collapse_determinism.py
│   └── test_grande_phase.py
│
├── docs/                       # Documentation
│   ├── QUICKSTART.md          # Quick start guide
│   ├── BACKEND_STRUCTURE.md   # Backend documentation
│   ├── DEPLOYMENT.md          # Deployment guide
│   └── ...                    # Additional documentation
│
├── scripts/                    # Utility scripts
│   ├── run.sh                 # Unix run script
│   └── run.bat                # Windows run script
│
├── requirements.txt            # Python dependencies
├── Procfile                   # Deployment configuration
└── README.md                  # This file
```

## Features

- **Real-time multiplayer** using WebSocket (Socket.IO)
- **Room management** for game lobbies
- **Complete game logic** for Mus rounds (MUS, GRANDE, CHICA, PARES, JUEGO)
- **Quantum card mechanics** (entanglement, superposition)
- **Team-based gameplay** (2v2)
- **SQLite database** for game history and statistics
- **RESTful API** endpoints

## 🚀 Quick Start

### Using the run scripts (recommended)

**Unix/Linux/Mac:**
```bash
./scripts/run.sh
```

**Windows:**
```batch
scripts\run.bat
```

### Manual installation

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

2. Run the server:
```bash
cd backend
python server.py
```

The server will start on `http://localhost:5000` and serve the frontend from the `frontend/` directory.

3. Open your browser and navigate to `http://localhost:5000` to play the game.

## API Endpoints

### HTTP Endpoints

- `GET /health` - Health check
- `GET /api/rooms` - List available rooms
- `POST /api/rooms` - Create a new room
- `GET /api/stats` - Get game statistics

### WebSocket Events

#### Client → Server

- `connect` - Connect to server
- `create_room` - Create a game room
- `join_room` - Join a room
- `leave_room` - Leave a room
- `start_game` - Start the game (when 4 players ready)
- `player_action` - Make a game action (MUS, PASO, ENVIDO, ORDAGO)
- `discard_cards` - Discard cards during MUS phase
- `get_game_state` - Request current game state

#### Server → Client

- `connected` - Connection confirmed
- `room_created` - Room created successfully
- `joined_room` - Successfully joined room
- `left_room` - Left room
- `room_updated` - Room state changed
- `game_started` - Game has started
- `game_update` - Game state updated
- `cards_discarded` - Cards were discarded
- `new_cards_dealt` - New cards dealt
- `round_ended` - Round finished
- `game_ended` - Game finished
- `game_error` - Error occurred

## Architecture

The project follows a clean separation between backend and frontend:

- **Backend** (`backend/`): Flask + Socket.IO server handling game logic, room management, and WebSocket communication
- **Frontend** (`frontend/`): HTML/CSS/JavaScript client for the game interface
- **Tests** (`tests/`): Test files for validating game functionality
- **Docs** (`docs/`): Comprehensive documentation for the project
- **Scripts** (`scripts/`): Helper scripts for running the application

## Game Flow

1. **Lobby Phase**
   - Players create or join rooms
   - Wait for 4 players
   - Start game when ready

2. **MUS Round**
   - Players choose: MUS, PASO, ENVIDO, ORDAGO
   - If all choose MUS: discard phase (simultaneous)
   - New cards dealt, repeat
   - When someone passes: move to GRANDE

3. **GRANDE Round** (Higher cards win)
   - Betting: PASO, ENVIDO, ORDAGO
   - Team responses
   - Card reveal and scoring

4. **CHICA Round** (Lower cards win)
   - Same betting mechanics

5. **PARES & JUEGO Rounds**
   - To be implemented

6. **New Hand**
   - After all rounds, new hand starts
   - Mano rotates
   - First to 40 points wins

## Database Schema

### Players
- username, games_played, games_won, total_points

### Games
- room_id, game_mode, status, winner_team, scores

### GameHistory
- Events and actions during games

## Configuration

Edit `backend/server.py` to configure:
- Database URI
- Secret key
- CORS settings
- Port number

## Development

Run in debug mode:
```bash
cd backend
python server.py
```

The server will auto-reload on code changes.

## Testing

Run the tests:
```bash
cd tests
python test_client.py
```

Test WebSocket connection:
```javascript
const socket = io('http://localhost:5000');

socket.on('connect', () => {
  console.log('Connected!');
  
  // Create a room
  socket.emit('create_room', {
    name: 'Test Room',
    game_mode: '4'
  });
});
```

## 📚 Documentation

For more detailed information, see the documentation in the `docs/` directory:
- [QUICKSTART.md](docs/QUICKSTART.md) - Quick start guide
- [BACKEND_STRUCTURE.md](docs/BACKEND_STRUCTURE.md) - Backend architecture
- [DEPLOYMENT.md](docs/DEPLOYMENT.md) - Deployment instructions
- [SOCKET_PROTOCOL.md](docs/SOCKET_PROTOCOL.md) - WebSocket protocol documentation
