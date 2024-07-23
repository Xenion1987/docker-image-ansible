ARG PYTHON_VERSION=3.12-slim-bookworm
FROM python:${PYTHON_VERSION}

# Set Variables
ARG LINUX_USER
ARG ANSIBLE_VERSION='<10.0.0'
ARG ANSIBLE_LINT_VERSION='>=24.0.0'

# Copy setup script
COPY ./scripts/setup-docker-container.sh /tmp/build-my-image/
COPY requirements.txt /tmp/build-my-image/

# Install all applications
RUN chmod +x /tmp/build-my-image/setup-docker-container.sh && \
    cd /tmp/build-my-image/ && \
    /tmp/build-my-image/setup-docker-container.sh install all ansible ${ANSIBLE_VERSION} ${ANSIBLE_LINT_VERSION}

RUN rm -rf /tmp/build-my-image/
