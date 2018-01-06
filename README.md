# Gitdocs

Gitdocs commits any file change within a git repository and pushes
them to the configured remote.

## Example via Docker Compose

Save this to `docker-compose.yml`:

```yml
gitdocs:
  build: leocgit/gitdocs
  tty: true
  environment:
    GIT_USER_NAME: "Hans Maulwurf"
    GIT_USER_EMAIL: "hans@maulwurf.de"
    # You can define a custom remote name with custom hostname.
    # Upon start the container will scan the ssh keys from `GIT_REMOTE_HOSTNAME`.
    # GIT_REMOTE_NAME: repo
    # GIT_REMOTE_HOSTNAME: private.repo.dyndns.org
    # GIT_REMOTE_USERNAME: arthur
  volumes:
    - /path/to/my/repo:/repos/repo
    - ./id_rsa:/root/.ssh/id_rsa
```

Adjust the values for git user name, email and the volumes for the
private key and the git repository. You can add multiple repositories
within the `/repos` directory. Upon start the container will add all
repositories within `/repos` to the gitdocs config.

Then run:

```sh
docker-compose up -d
```
