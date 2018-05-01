# hardware/privatebin

![](https://i.imgur.com/uReSURN.png)

### What is this ?

PrivateBin is a minimalist, open source online pastebin where the server has zero knowledge of pasted data. Data is encrypted/decrypted in the browser using 256bit AES in Galois Counter mode. More details on the [official website](https://privatebin.info/).

### Features

- Lightweight & secure image (no root process)
- Based on Alpine
- Latest PrivateBin version (1.1.1)
- With Nginx and PHP7

### Build-time variables

- **VERSION** : version of Privatebin
- **GPG_FINGERPRINT** : fingerprint of signing key
- **SHA256_HASH** : SHA256 hash of Privatebin archive

### Ports

- **8888**

### Environment variables

| Variable | Description | Type | Default value |
| -------- | ----------- | ---- | ------------- |
| **UID** | privatebin user id | *optional* | 991
| **GID** | privatebin group id | *optional* | 991

### Volumes

- **/privatebin/cfg** : configuration folder
- **/privatebin/data** : data folder

### Docker-compose.yml

```yml
privatebin:
  image: hardware/privatebin
  container_name: privatebin
  volumes:
    - /mnt/docker/privatebin/cfg:/privatebin/cfg
    - /mnt/docker/privatebin/data:/privatebin/data
```

### Configuration

https://github.com/PrivateBin/PrivateBin/wiki/Configuration
