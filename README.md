# Requirement

## Docker `17.04.0+`

- [Get Docker CE for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Get Docker CE for Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
- [Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
- [Get Docker CE for Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)

## docker-compose `1.18.0+`

[Install Docker Compose](https://docs.docker.com/compose/install/#install-compose)

# How To Use

## Config

Create `.env` file

```
$ cp .env.example .env
```

### shadowsocks-libev config

> For a detailed and complete list of all supported arguments:
>
>[https://github.com/shadowsocks/shadowsocks-libev#usage](https://github.com/shadowsocks/shadowsocks-libev#usage)

* `SHADOWSOCKS_TAG`
    
    docker image tag

* `SHADOWSOCKS_KEY`

    password of your remote server

* `SHADOWSOCKS_METHOD`

    encrypt method

* `SHADOWSOCKS_PORT`

    port number of your remote server

### kcptun config

> For a detailed and complete list of all supported arguments:
>
>[https://github.com/xtaci/kcptun#usage](https://github.com/xtaci/kcptun#usage)

* `KCPTUN_TAG`

    docker image tag

* `KCPTUN_PORT`

    port number of your remote server

* `KCPTUN_KEY`

    pre-shared secret between client and server

* `KCPTUN_CRYPT`

    aes, aes-128, aes-192, salsa20, blowfish, twofish, cast5, 3des, tea, xtea, xor, none (default: "aes")

* `KCPTUN_MODE`

    profiles: fast3, fast2, fast, normal (default: "fast")

* `KCPTUN_MTU`

    set maximum transmission unit for UDP packets (default: 1350)

* `KCPTUN_SND`

    set send window size(num of packets) (default: 1024)

* `KCPTUN_RCV`

    set receive window size(num of packets) (default: 1024)

* `KCPTUN_DS`

    set reed-solomon erasure coding - datashard (default: 10)

* `KCPTUN_PS`

    set reed-solomon erasure coding - parityshard (default: 3)

* `KCPTUN_DSCP`

    set DSCP(6bit) (default: 0)

## Run

```
$ chmod +x start.sh
$ ./start.sh
```