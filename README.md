# Protocheck toolchain

Если у вас twirp сервер, то вам просто необходимо вставить следующий шаг в ваш circleci.yaml рядом с тестами.

# Локальный запуск

Идёте в каталог где у вас лежат исходники вашего сервиса и выполняете:

```sh

$ docker run --rm -v $(pwd):/protos/protos reg.talenttechlab.org/library/protocheck
```

Все проверки запускаюся по умолчанию, если ошибки будут - вы узнаете, если нет - тоже :)

# Встраивание в github actions

Управление protocheck action осуществляется с помощью terraform (infra/tf/github/)

Сам action находится в infra/tf/github/gh_files/protocheck.yaml

Для добавления action нужно добавить репу в variables.tf, в секцию repositories, по аналогии с остальными (предварительно нужно импортировать репу для terraform)

```
terraform import 'github_repository.managed_repositories["repo-name"]' 'repo-name'
```
