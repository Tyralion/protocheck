# Protocheck toolchain

Если у вас twirp сервер, то вам просто необходимо вставить следующий шаг в ваш circleci.yaml рядом с тестами.

# Локальный запуск

Идёте в каталог где у вас лежат исходники вашего сервиса и выполняете:

```sh

$ docker run --rm -v $(pwd):/protos/protos reg.talenttechlab.org/library/protocheck
```

Все проверки запускаюся по умолчанию, если ошибки будут - вы узнаете, если нет - тоже :)

# Встраивание в CI

Обычно у вас есть job под названием ext_tools если у вас его нет, то нужно его сделать. Выглядит он следующим образом:

```yaml
ext_tools:
  working_directory: ~/src
  machine: true
  steps:
    - attach_workspace:
      at: ~/src
    - run:
      name: Validate proto files
      command: docker run -v $(pwd)/src:/protos/protos reg.talenttechlab.org/library/protocheck
```

Этоа job'а должна запускаться до job'ы с тестами (не тратье своё время на тесты), но после init'а. Выглядит это примерно вот так:

```yaml
workflows:
  version: 2
  app:
    jobs:
      - init:
          filters:
            tags:
              only: /.*/
      - ext_tools:
          requires:
            - init
          filters:
            tags:
              only: /.*/
      - tests:
          requires:
            - ext_tools
          filters:
            tags:
              only: /.*/
```
