# build_nspawn_container

systemd-nsapwn向けに, アプリケーションを含んだ配布可能なrootfsを作成する

## Debianで動かす

```sh
./setup_machine.sh
./build.sh
```

## macOSで動かす

- Vagrantが必要
- `./app` がサンプルのアプリケーション.

```sh
./build_on_mac.sh
```

`./build`に`rootfs.tar.gz`ができるはず.

## メモ

- alpine使おうかと思ってたけどalpineではsystemd一切動かないと考えたほうがよさそう
- minideb を試してみる
  - よくわからなかった

```sh
# パッケージのサイズの一覧
((xargs -IXXX dpkg-query -W -f '${Installed-Size}\t${Package}\n' XXX) < list) 2>/dev/null | sort -nr | head -n 20
```

- mmdebstrapを試してみた, よさそう
  - https://qiita.com/miminashi/private/957ed5eea73b31aba1f4
