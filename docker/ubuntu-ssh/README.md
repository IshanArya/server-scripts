# Ubuntu SSH


## Debugging

```bash
docker run -d \
    --name test-ssh \
    -e USERNAME=myuser \
    -e PASSWORD=mypassword \
    -p 2222:22 \
    ubuntu-ssh
```

```bash
docker run --rm -it --entrypoint /bin/bash ubuntu-ssh
```

```bash
docker inspect test-ssh | grep IPAddress
```
