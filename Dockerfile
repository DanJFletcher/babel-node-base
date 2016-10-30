FROM node:boron

RUN apt update && apt upgrade -y && apt-get install -y sudo curl

# Add non-root user
RUN useradd --user-group --create-home --shell /bin/false app && usermod -aG sudo app
ENV HOME /home/app

# Create app directory
USER app
RUN cd $HOME && mkdir src
WORKDIR $HOME/src

# Install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

ENV PATH=$HOME/.yarn/bin:$PATH

# Install app dependencies
COPY package.json $HOME/src
RUN yarn

# Bundle app source
COPY . $HOME/src

ENV PORT 3000
EXPOSE 3000

CMD ["npm" , "run", "dev"]
