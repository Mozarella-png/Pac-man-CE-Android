# Pac-Man CE para Android (en construcción)

Port de Pac-Man Championship Edition a Android, con controles táctiles (sin botones: deslizar para mover,
tocar en los menús), pantalla ultrawide sin estirar, compilado con GitHub Actions.

Base: el port de PC Pacman-CE-PC-Recomp y el SDK
[ReXGlue](https://github.com/rexglue/rexglue-sdk) en el commit `bd833a2a`, con los parches de `patches/rexglue-sdk/`.

## Estado

- [x] Estructura Gradle/CMake de la app "Pac-Man CE" (minSdk 29, arm64-v8a).
- [x] Script `scripts/fetch_sdk.sh`: clona el SDK en el commit fijado y aplica los 10 parches.
- [x] Workflow `.github/workflows/build-apk.yml` (Ubuntu, NDK 27.2, Gradle 8.10.2).
- [ ] Capa de plataforma Android del SDK (sin esto no hay juego): archivos de ventana, superficie,
      input, fibers, memoria y filesystem para Android. El SDK fijado no los trae; se portarán desde
      la copia del SDK del fork Liberty Recompiled (licencia BSD-3, se conserva el aviso).
- [ ] Puerto de la app del PC (`pacman_app.h`, `main.cpp`, etc.), que hoy usa `windows.h`.
- [ ] Entrada táctil: deslizar para la dirección de Pac-Man, tocar para elegir en menús.
- [ ] Ultrawide con letterbox (la imagen 16:9 sin estirar).
- [ ] Importación de los datos del juego desde el teléfono.

Hoy el APK solo instala y registra un aviso: el código aún no está compilado ni probado.

## Compilar

```
bash scripts/fetch_sdk.sh          # trae el SDK con los parches
gradle assembleDebug               # APK en app/build/outputs/apk/debug/
```

En GitHub, el workflow compila el APK en cada push a `main` (o a mano desde Actions).

## Licencia

Código propio: MIT No Attribution (archivo `LICENSE`, igual que el port de PC). El SDK ReXGlue es BSD-3 y
conserva su aviso en los archivos que se copien. No se copia código GPL-3 de otros forks: el fork Liberty
Recompiled se usa solo como referencia de estructura.

## Decisiones de diseño

- **CI en GitHub Actions, en Ubuntu.** El codegen de ReXGlue necesita binario Linux, y el runner Ubuntu es más
  barato y rápido que Windows.
- **SDK base: `bd833a2a` + parches.** Mantiene el código del juego ya generado y el build de PC sin cambios. La
  capa Android se porta desde la copia BSD-3 del SDK del fork Liberty.
- **Renderer: el Xenos del SDK.** Solo si Pac-Man usa memexport hace falta otra solución (renderer propio).
  Parche 0010: el arranque ya no exige `vertexPipelineStoresAndAtomics`.
- **Entrada: gestos.** Deslizar para la dirección de Pac-Man y tocar en los menús. Sin botones en pantalla.
- **Primer hito: el APK arranca hasta la pantalla de título en el POCO X8 Pro Max.** Lo demás viene después.
- **Paquete `com.m4candcheese.pacmanced`.** Se puede cambiar, pero no después de publicar.
