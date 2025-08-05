# Indian Blogging Platform

Hey there! 👋 This is my internship project - a mini blogging platform I built using Ruby on Rails. It's got all the basic features you'd expect from a blog, plus some cool extras I added for fun.

## What I Built

### The Basics
- **User stuff** - people can sign up, log in, and manage their profiles using Devise
- **Posts** - users can write posts, save them as drafts, or publish them right away
- **Comments** - logged-in users can comment on posts
- **Search** - you can search posts and filter them by date or author
- **Dashboard** - users get their own dashboard to see their posts and recent activity

### The Cool Extras
- **Background jobs** - when someone publishes a post, it triggers a notification (using Sidekiq)
- **API** - I added some JSON endpoints so you can access posts programmatically
- **Admin panel** - there's a simple admin area to manage everything (username: admin, password: admin123)

## Tech Stuff I Used

- **Rails 7.1.5** - the main framework
- **PostgreSQL** - for the database
- **Devise** - handles all the user authentication
- **FriendlyId** - makes nice URLs like `/posts/my-awesome-post` instead of `/posts/123`
- **Ransack** - powers the search and filtering
- **Sidekiq** - handles background jobs
- **Bootstrap 5** - makes it look decent

## Getting Started

### Prerequisites
You'll need:
- Ruby 3.3.5
- PostgreSQL installed and running
- Redis (for the background jobs)

### Setup Steps

1. **Clone and install stuff**
```bash
git clone <your-repo-url>
cd blogging
bundle install
```

2. **Set up the database**
```bash
rails db:create
rails db:migrate
rails db:seed
```

3. **Start everything up**
```bash
# Start the Rails server
rails server

# In another terminal, start Sidekiq for background jobs
bundle exec sidekiq
```

4. **Check it out**
- Main app: http://localhost:3000
- API: http://localhost:3000/api/posts

## Test Users

I added some sample users with Indian names (since I'm from India!):

- **priya@example.com** / password123
- **rajesh@example.com** / password123
- **meera@example.com** / password123

## API Stuff

If you want to play with the API:

```bash
# Get all published posts
curl http://localhost:3000/api/posts

# Get a specific post
curl http://localhost:3000/api/posts/traditional-indian-cooking

# With auth (just needs any token for now)
curl -H "Authorization: Bearer whatever" http://localhost:3000/api/posts/1
```

## How I Built It

### Database Design
I kept it simple but functional:
- **Users table** - handles all the user stuff with Devise
- **Posts table** - stores the blog posts with slugs for nice URLs
- **Comments table** - nested under posts, linked to users
- **Notifications table** - logs when posts get published

### Security Stuff
- Users can only edit their own posts and comments
- API only shows published posts
- CSRF protection is on for web requests
- Admin panel has hardcoded credentials (not great for production, but works for this project)

### Performance
- Used eager loading to avoid N+1 queries
- Added some database indexes
- Background jobs handle the heavy lifting

## Project Structure

Here's how I organized the code:

```
app/
├── controllers/
│   ├── posts_controller.rb      # handles all the post stuff
│   ├── comments_controller.rb   # comment creation/deletion
│   ├── dashboard_controller.rb  # user dashboard
│   └── api/posts_controller.rb  # JSON API endpoints
├── models/
│   ├── user.rb                  # Devise user model
│   ├── post.rb                  # Post model with friendly_id
│   ├── comment.rb               # Comment model
│   └── notification.rb          # Notification model
├── views/
│   ├── posts/                   # all the post views
│   ├── dashboard/               # dashboard views
│   └── layouts/                 # main layout
└── jobs/
    └── post_notification_job.rb # background job for notifications
```

## Deployment

I deployed this to Heroku. Here's what I did:

1. Created a Heroku app
2. Added the cheapest PostgreSQL database (Essential 0 plan)
3. Set up the environment variables
4. Pushed the code

The live app is at: [your-heroku-url]

## What I Learned

This project taught me a lot about:
- Building a complete Rails app from scratch
- Working with different gems (Devise, FriendlyId, Ransack)
- Setting up background jobs
- Creating API endpoints
- Deploying to Heroku
- Managing database relationships

## Challenges I Faced

- Getting the admin panel authentication working properly
- Making sure all the delete buttons worked with Rails 7 Turbo
- Setting up the background jobs correctly
- Getting the search and filtering to work smoothly

## Future Improvements

If I had more time, I'd add:
- Better error handling
- More comprehensive tests
- User avatars and profiles
- Rich text editing for posts
- Email notifications
- Better admin interface

## Running Tests

```bash
rails test
```

## License

This was built for my internship assignment. Feel free to use it for learning purposes!

---

**Note**: This is a learning project I built for my internship. It's functional but not production-ready. For a real app, you'd want better security, more testing, and proper error handling.

*Built with ❤️ using Ruby on Rails*
