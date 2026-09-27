# Развёртывание Unity/FishNet-сервера

## Содержимое образа

В Docker-образ попадает готовый Linux Dedicated Server из `Build/LinuxServer`:

```text
Build.x86_64
Build_Data/
UnityPlayer.so
FishNet.SDK.Id
```

Исходники Unity и Unity Editor в образ не включаются.

Сервер запускается командой:

```text
/app/Build.x86_64 -batchmode -nographics -logFile -
```

FishNet настроен на автозапуск в headless-сборке и транспорт Tugboat на UDP-порту `7770`.

## Локальная проверка

```cmd
docker build -t location-scene-server:local .
docker run --rm --name location-scene-server -p 7770:7770/udp location-scene-server:local
```

После запуска подключите клиент Unity к адресу `127.0.0.1` и порту `7770`.

## Ограничение Amvera

`amvera.yml` указывает внутренний порт контейнера `7770`. Однако Tugboat работает по UDP, а документация Amvera для внешнего доступа описывает HTTP/HTTPS и ограниченный TCP, но не UDP.

Следовательно, образ можно собрать и запустить на Amvera, но внешний FishNet-клиент не сможет подключиться через Tugboat, пока Amvera не подтвердит и не включит проброс UDP-порта. Для публичного запуска нужно либо получить UDP-доступ от поддержки Amvera, либо заменить транспорт FishNet на совместимый с доступным у платформы протоколом.
