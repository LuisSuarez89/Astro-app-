# Astro App

Aplicación móvil en Flutter para consultar un horóscopo diario con una estética mística. El flujo permite ingresar nombre, ciudad, fecha de nacimiento e intención del día para generar una predicción aleatoria y mostrar el signo zodiacal correspondiente.

## Características

- Interfaz oscura con ambientación cósmica.
- Cálculo automático del signo zodiacal según la fecha de nacimiento.
- Carga de predicciones desde `assets/data/horoscopes.json`.
- Navegación entre formulario inicial y pantalla de resultado.
- Pruebas unitarias para la lógica de signos zodiacales.
- Workflow de GitHub Actions preparado para análisis y pruebas con Flutter.

## Requisitos

- Flutter SDK `>=3.3.0 <4.0.0`
- Dart SDK incluido con Flutter

## Puesta en marcha

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Estructura principal

```text
lib/
  data/      # Acceso a predicciones
  models/    # Modelos de dominio
  screens/   # Pantallas principales
  utils/     # Lógica auxiliar (signos zodiacales)
  widgets/   # Componentes visuales reutilizables
assets/data/ # Predicciones en JSON
test/        # Pruebas automatizadas
```

## Etiquetas del repositorio

Se añadió la configuración de etiquetas en `.github/labels.yml` para facilitar la gestión del proyecto con categorías como:

- `feature`
- `bug`
- `docs`
- `tests`
- `ci`
- `ui`
- `maintenance`

## Automatización CI

El workflow `.github/workflows/flutter.yml` instala Flutter, resuelve dependencias, analiza el código y ejecuta las pruebas en cada push o pull request sobre `main`.
