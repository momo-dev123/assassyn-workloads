FROM continuumio/miniconda3

ENV PYTHON_VERSION=3.12
ENV CONDA_ENV=myenv

WORKDIR /app

RUN apt-get update && apt-get install -y \
    zsh \
    curl \
    git \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y --default-toolchain 1.84.1

ENV PATH="/root/.cargo/bin:$PATH"

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && chsh -s /bin/zsh

COPY . /app

RUN if [ -f environment.yml ]; then \
        conda env create -n ${CONDA_ENV} -f environment.yml; \
    else \
        conda create -n ${CONDA_ENV} python=${PYTHON_VERSION} -y; \
    fi

SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

CMD ["zsh"]