#error handling in shell script
#!/bin/bash

create_directory(){
        mkdir demo
}
if ! create_directory; then
        echo "the code is being exited as the directory already exists"
        exit 1
fi

echo "this should not work because the code is interrupted"
# this line will not be printed because the code is exited in the function
# the code will exit in the function because the directory already exists


#!/bin/bash

# Deploy a Django app and handle errors

# Function to clone the Django app code
code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists. Skipping clone."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Uncomment the following lines if needed:
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}

# Function to deploy the Django app
deploy() {
    echo "Building and deploying the Django app..."
    docker build -t notes-app . && docker-compose up -d || { #docker compose will let you run multiple times
        echo "Failed to build and deploy the app."
        return 1
    }
}

# Main deployment script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
if ! code_clone; then
    cd django-notes-app || exit 1
fi

# Install dependencies
if ! install_requirements; then
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"
# This script will deploy a Django app by cloning the code, installing dependencies, performing required restarts, and deploying the app using Docker. It includes error handling to handle failures at each step and exit the script if any step fails. The script also includes a final message indicating the completion of the deployment process.