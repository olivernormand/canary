FROM node:18-alpine

# Install Python for scripts
RUN apk add --no-cache python3 py3-pip

WORKDIR /app

# Copy application files
COPY multi-website-builder/ ./

# Install dependencies
RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi
RUN if [ -f package.json ]; then npm install; fi

# Start scripts
CMD sh -c "npm start 2>/dev/null || python3 *.py 2>/dev/null || sh *.sh 2>/dev/null || echo 'No scripts found'"

