# =============================================================================
# Stage 1: Builder - Compile Backend and Frontend
# =============================================================================
FROM rust:1.85-slim as builder

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install WebAssembly target and Trunk (standard tool for Rust frontends)
RUN rustup target add wasm32-unknown-unknown
RUN cargo install --locked trunk

# Set working directory
WORKDIR /app

# Copy the workspace manifest files
COPY Cargo.toml Cargo.lock ./

# Copy all the workspace crates
COPY backend ./backend
COPY common ./common
COPY frontend ./frontend

# Build the frontend to WebAssembly
# (Trunk packages the WASM and index.html into a "dist" folder by default)
WORKDIR /app/frontend
RUN trunk build --release

# Build the backend server binary
# (Outputs to /app/target/release/backend)
WORKDIR /app
RUN cargo build --release -p backend

# =============================================================================
# Stage 2: Runtime - Minimal Image
# =============================================================================
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates openssl libssl3 && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN adduser --system --no-create-home --group appuser

# Copy the compiled backend binary (renaming it to live_chat for your compose setup)
COPY --from=builder /app/target/release/backend /usr/local/bin/live_chat

# Copy the compiled frontend WASM and HTML files to the static serving folder
COPY --from=builder /app/frontend/dist /opt/live_chat/static

# Set working directory
WORKDIR /opt/live_chat

# Run as non-root user
USER appuser

# Expose the application port
EXPOSE 3030

# Start the application
CMD ["/usr/local/bin/live_chat"]