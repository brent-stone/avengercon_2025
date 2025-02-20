FROM kasmweb/ubuntu-jammy-desktop:1.16.0 AS workshop
USER root

ARG PYTHON_VERSION=3.13.2
ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
# "Always combine RUN apt-get update with apt-get install in the same RUN statement."
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    zlib1g \
    zlib1g-dev \
    libssl-dev \
    libbz2-dev \
    liblzma-dev \
    libsqlite3-dev \
    libncurses5-dev \
    libffi-dev \
    libreadline-dev \
    tk-dev

# Cleanup the apt cache to reduce image size
RUN apt-get purge -y --auto-remove
RUN rm -rf /var/lib/apt/lists/*

# Install Rust (pendulum, pydantic, and other Python packages are leveraging Rust now)
# https://rustup.rs/#
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && echo "installed rust"
RUN . "$HOME/.cargo/env" && echo "rust added to current shell"

# Install pyenv and add it to the path
# https://github.com/pyenv/pyenv?tab=readme-ov-file#installation
RUN curl -fsSL https://pyenv.run | bash && echo "installed pyenv"

ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
RUN eval "$(pyenv init - bash)"

# Install Python 3.13 and make it the global default Python interpreter
RUN pyenv install $PYTHON_VERSION && echo "Python ${PYTHON_VERSION} installed via pyenv"
RUN pyenv global $PYTHON_VERSION && echo "Python ${PYTHON_VERSION} set as global python interpreter"

# Copy the custom background to the image
# https://kasmweb.com/docs/latest/how_to/branding.html
COPY ./avengercon_ix_bg_gemini_imageFX.png /usr/share/backgrounds/bg_default.png

#COPY ./ $HOME/Desktop/avengercon_2025

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
