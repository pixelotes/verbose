# Stage 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:3.34.0-0.0.pre AS build

WORKDIR /app

# Copy flutter project files
COPY . .

# Get dependencies and build web release
RUN flutter pub get
RUN flutter build web --release

# Stage 2: Serve with a lightweight web server (nginx)
FROM nginx:alpine

# Copy the built web files from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
