# Railway Booking System 🚂

A full-stack web application for booking railway tickets with real-time seat availability tracking and user management. The project uses React for the frontend, Express.js for the backend, and MySQL for the database.
![1](https://github.com/user-attachments/assets/aa06bfa6-9e25-44af-8129-40875aff467a)

## 🌟 Live Demo

- Live Web-App: [Railway Booking App](https://railway-booking.netlify.app/)
## ✨ Features

- 🔐 User authentication (Register/Login)
- 🎫 Real-time train search
- 💺 Seat availability checking
- 🎟️ Multiple coach types (Sleeper, AC1, AC2, AC3, etc.)
- 📱 Responsive design
- 🎫 Ticket booking and confirmation
- 👥 User profile management
- 🧾 Transaction History

## 🛠️ Tech Stack

### Frontend
- React.js
- Vite
- CSS3
- JavaScript (ES6+)
- Axios for API calls

### Backend
- Node.js
- Express.js
- MySQL2
- CORS
- Dotenv

### Database
- MySQL

## 🚀 Deployment

### Frontend (Netlify)
1. Connected to GitHub repository
2. Build settings:
   - Base directory: `frontend`
   - Build command: `npm run build`
   - Publish directory: `dist`
3. Environment variables set in Netlify dashboard

### Backend (Railway)
1. Deployed using Railway platform
2. Auto-deploys enabled with GitHub integration
3. Environment variables configured in Railway dashboard

### Database (FreeSQLDatabase)
- Hosted on FreeSQLDatabase platform
- Connection details securely stored in backend environment variables

## 💻 Local Development Setup

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn
- MySQL

### Frontend Setup
```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Create .env file
cp .env.example .env

# Start development server
npm run dev
```

### Backend Setup
```bash
# Navigate to backend directory
cd backend

# Install dependencies
npm install

# Create .env file
cp .env.example .env

# Start server
npm run dev
```

### Environment Variables

#### Frontend (.env)
```env
VITE_API_URL=your_backend_url
```

#### Backend (.env)
```env
DB_HOST=your_db_host
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=your_db_name
DB_PORT=your_db_port
PORT=5000
```

## 📝 API Endpoints

### Authentication
- POST `/register` - Register new user
- POST `/login` - User login

### Trains
- POST `/form` - Search trains
- GET `/search` - Get available trains

### Transactions
- POST `/transaction` - Get user's booking history
- GET `/get_booking` - Get latest booking details

## 🔐 Database Schema

### Tables
1. `customers` - User information
2. `train` - Train details
3. `coaches` - Coach availability
4. `berth` - Berth allocation
5. `transaction` - Booking history tracking

### Database Setup

You can use the `railway_schema.sql` file located in the repository to create the necessary tables and insert data into your local or online MySQL database. Simply execute the SQL script in your database management tool (e.g., MySQL Workbench, phpMyAdmin, or via the command line) to set up the required schema and populate the data.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Authors

- Aditya Parida - [GitHub Profile](https://github.com/adityaparida21)

## 🙏 Acknowledgments

- Thanks to Netlify for hosting the frontend
- Thanks to Railway for hosting the backend
- Thanks to FreeSQLDatabase for providing the database hosting
