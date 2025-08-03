# Mini Blogging Platform

A complete mini blogging platform built with Ruby on Rails, featuring user authentication, post management, comments, search functionality, and API endpoints.

## 🚀 Features

### ✅ Core Features
- **User Authentication** (Devise)
  - User registration, login, logout
  - Profile management
  - Password recovery

- **Posts System**
  - Create, edit, delete posts
  - Draft and published status
  - Slug-based URLs (`/posts/traditional-indian-cooking`)
  - Rich text content

- **Comments System**
  - Authenticated users can comment
  - View comments with author and timestamp
  - Delete own comments

- **Search & Filtering**
  - Search posts by title/content
  - Filter by date range
  - Show only published posts
  - Show only own posts (for logged-in users)

- **User Dashboard**
  - Overview of user's posts
  - Post status (published/draft)
  - Comment count
  - Recent comments
  - Notifications

### 🎯 Bonus Features
- **Background Jobs** (Sidekiq)
  - Email notifications when posts are published
  - Notification logging

- **API Endpoints** (JSON)
  - `/api/posts` - List published posts
  - `/api/posts/:id` - Get specific post with comments
  - Basic token authentication

## 🛠 Tech Stack

- **Backend**: Ruby on Rails 7.1.5
- **Database**: PostgreSQL
- **Authentication**: Devise
- **Search**: Ransack
- **Slugs**: Friendly ID
- **Background Jobs**: Sidekiq
- **Frontend**: Bootstrap 5
- **API**: JSON responses with JWT support

## 📋 Prerequisites

- Ruby 3.3.5
- PostgreSQL
- Redis (for Sidekiq)

## 🚀 Setup Instructions

### 1. Clone and Install Dependencies
```bash
git clone <repository-url>
cd blogging
bundle install
```

### 2. Database Setup
```bash
# Create PostgreSQL databases
rails db:create

# Run migrations
rails db:migrate

# Seed with sample data
rails db:seed
```

### 3. Start the Application
```bash
# Start Rails server
rails server

# In another terminal, start Sidekiq (for background jobs)
bundle exec sidekiq
```

### 4. Access the Application
- **Main App**: http://localhost:3000
- **API Endpoints**:
  - http://localhost:3000/api/posts
  - http://localhost:3000/api/posts/:id

## 👥 Test Users

The application comes with pre-seeded test users with Indian names:

- **Email**: priya@example.com
- **Password**: password123

- **Email**: rajesh@example.com
- **Password**: password123

- **Email**: meera@example.com
- **Password**: password123

## 🔧 API Usage

### List Posts
```bash
curl http://localhost:3000/api/posts
```

### Get Specific Post
```bash
curl http://localhost:3000/api/posts/traditional-indian-cooking
```

### With Authentication
```bash
curl -H "Authorization: Bearer your-token" http://localhost:3000/api/posts/1
```

## 🏗 Architecture Decisions

### Database Design
- **Users**: Core user management with Devise
- **Posts**: Main content with slug-based URLs
- **Comments**: Nested under posts with user associations
- **Notifications**: Background job logging

### Security
- Authentication required for post creation/editing
- Users can only edit their own posts/comments
- API endpoints show only published posts
- CSRF protection enabled

### Performance
- Eager loading for associations
- Database indexes on frequently queried fields
- Background job processing for notifications

## 🧪 Testing

```bash
# Run all tests
rails test

# Run specific test files
rails test test/controllers/posts_controller_test.rb
```

## 📁 Project Structure

```
app/
├── controllers/
│   ├── posts_controller.rb      # Main post CRUD
│   ├── comments_controller.rb   # Comment management
│   ├── dashboard_controller.rb  # User dashboard
│   └── api/posts_controller.rb  # API endpoints
├── models/
│   ├── user.rb                  # Devise user model
│   ├── post.rb                  # Post with friendly_id
│   ├── comment.rb               # Comment model
│   └── notification.rb          # Notification model
├── views/
│   ├── posts/                   # Post views
│   ├── dashboard/               # Dashboard views
│   └── layouts/                 # Application layout
└── jobs/
    └── post_notification_job.rb # Background job
```

## 🚀 Deployment

### Environment Variables
```bash
DATABASE_URL=postgresql://user:password@host:port/database
REDIS_URL=redis://localhost:6379
```

### Production Setup
1. Set up PostgreSQL database
2. Configure Redis for Sidekiq
3. Set environment variables
4. Run `rails assets:precompile`
5. Start Rails server and Sidekiq

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is for educational purposes as part of an internship assignment.

---

**Note**: This is a mini blogging platform built for learning purposes. For production use, additional security measures, error handling, and testing would be recommended.
