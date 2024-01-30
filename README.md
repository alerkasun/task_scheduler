# Task Scheduler

## Requirements

Before starting with the application, make sure you have the following software installed:

-   Ruby (3.2.0)
-   Rails (~> 7.1.2)
-   PostgreSQL

## Setup

### Cloning the Repository

First, clone the repository to your computer:

`git clone https://example.com/your-repo.git cd your-repo`

### Installing Dependencies

Install the required Ruby gems:

`bundle install`

If you are using Node.js and Yarn to manage JavaScript packages:

`yarn install`

### Database Configuration

Create and set up the database:


`rails db:create`
`rails db:migrate`
`rails db:seed`

### Configuration Files

Add all necessary configuration files, such as `config/database.yml` for database settings.

## Running the Application

Start the Rails server:

`rails server`

Open http://localhost:3000 in your browser to view the application.