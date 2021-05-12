# Protocheck toolchain

Если у вас twirp сервер, то вам просто необходимо добавить protocheck в github actions.

# Локальный запуск

Идёте в каталог где у вас лежат исходники вашего сервиса и выполняете:

```sh

$ docker run --rm -v $(pwd):/protos/protos reg.talenttechlab.org/library/protocheck
```

Все проверки запускаюся по умолчанию, если ошибки будут - вы узнаете, если нет - тоже :)

# Встраивание в github actions

Управление protocheck action осуществляется с помощью terraform (infra/tf/github/). По умолчанию работает на всех репозиториях, которые управляются из terraform.

Сам action находится в infra/tf/github/gh_files/protocheck.yaml
