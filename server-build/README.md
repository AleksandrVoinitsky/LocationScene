# Подготовка сборки Unity-сервера

Этот каталог предназначен для исходников и артефактов Linux-сборки выделенного Unity/FishNet сервера перед упаковкой в Docker-образ.

## Планируемая структура

```text
server-build/
  luckhun/                 # репозиторий с серверной сборкой или исходниками
  README.md
```

## Исходный репозиторий

Предполагаемый адрес:

```text
https://git.msk0.amvera.ru/aleksandr12224411/luckhun.git
```

При подготовке каталога 29 августа 2026 года сервер Git вернул `repository not found`. Перед клонированием необходимо уточнить URL репозитория либо предоставить доступ к нему, если он приватный.

После получения доступа:

```cmd
git clone https://git.msk0.amvera.ru/aleksandr12224411/luckhun.git server-build\luckhun
```

Готовый Linux-билд Unity далее будет упакован Dockerfile без помещения в образ исходников Unity-проекта или Unity Editor. Базовая схема описана в [`../DOCKER_DEPLOY.md`](../DOCKER_DEPLOY.md).
