#!/usr/bin/env sh

echo "Scanning keys for ${GIT_REMOTE_HOSTNAME:-github.com} ..."
ssh-keyscan ${GIT_REMOTE_HOSTNAME:-github.com} >> ~/.ssh/known_hosts

echo "Setting git author name and mail ..."
git config --global user.name "${GIT_USER_NAME:-Gitdocs}"
git config --global user.email "${GIT_USER_EMAIL:-some@mail.com}"

if [ -z ${GIT_REMOTE_NAME} ]; then
    echo "No git remote name given for config..."
else
    echo "Defining ${GIT_REMOTE_NAME}"
    cat <<EOF > /root/.ssh/config
Host ${GIT_REMOTE_NAME}
  HostName ${GIT_REMOTE_HOSTNAME:-github.com}
  User ${GIT_REMOTE_USERNAME:-git}
EOF
fi

echo "Adding all repos from /repos ..."
for folder in /repos/*; do
    gitdocs add $folder
done

gitdocs start --foreground --verbose
