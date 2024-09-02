

## Local Development Setup
Clone the Repository
Clone the repository and navigate into the project directory:

```bash
    git clone <repository-url>
    cd <repository-directory>
```

Install Dependencies
Install the PHP dependencies using Composer:

```bash
    composer install
```

Environment Setup
Create a .env file based on .env.example and configure the necessary environment variables. This file should include configurations for your database, application key, and other environment-specific settings.

#Run Locally with Docker

Build and run the Docker container:

```bash
    docker build -t laravel-app:latest .
    docker run -p 8000:80 laravel-app:latest
```

Access the Application
Open your browser and go to http://localhost:8000.
