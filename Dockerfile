FROM oven/bun:1-slim AS base
WORKDIR /app

# Install dependencies first for better caching
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

# Copy source
COPY . .

EXPOSE 3000
CMD ["bun", "run", "src/index.ts"]
