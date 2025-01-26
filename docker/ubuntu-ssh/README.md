# Ubuntu SSH


## Debugging

```bash
docker run -d \
    --name test-ssh \
    -e USERNAME=myuser \
    -e PASSWORD=mypassword \
    -e PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRgCIiqWsaGjGyvjstWfYqFf7SYjLd1x2fu4LZX6BH6 nyx@nyx" \
    -p 2222:22 \
    ubuntu-ssh
```

```bash
docker run --rm -it --entrypoint /bin/bash ubuntu-ssh
```

```bash
docker inspect test-ssh | grep IPAddress
```
