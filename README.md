# 🚀 Neovim Portable Suite: The Ultimate Windows Dev Environment

Este proyecto es una distribución de **Neovim** totalmente portable y autónoma para Windows. Ha sido diseñada para ser 100% independiente del sistema operativo, permitiéndote llevar todo tu entorno de desarrollo en un pendrive o una carpeta en la nube.

## 🌟 Características Principales

- **Portabilidad Total**: Todo se guarda dentro de la carpeta raíz. Nada se escribe en AppData o carpetas del sistema.
- **LazyVim Starter**: Basado en la configuración moderna y rápida de [LazyVim](https://www.lazyvim.org/).
- **Terminal Integrada**: Incluye **WezTerm** configurado para lanzarse directamente en el entorno portable.
- **Baterías Incluidas**: Runtimes de lenguajes y compiladores pre-instalados y configurados.

---

## 🛠️ Componentes y Configuración (El "Por qué")

Para lograr una independencia total, hemos realizado los siguientes cambios específicos:

### 1. Gestión de Entorno (XDG)
Neovim por defecto busca la configuración en `%LOCALAPPDATA%`. Hemos "hackeado" este comportamiento mediante el script `nvim.bat`, que establece variables de entorno `XDG` locales:
- `XDG_CONFIG_HOME`: Apunta a la carpeta raíz, donde vive la carpeta `nvim/`.
- `XDG_DATA_HOME`, `XDG_STATE_HOME`, `XDG_CACHE_HOME`: Redirigidos a subcarpetas locales para que los plugins y el historial no toquen tu PC.

### 2. Compilador de C "Invisible" (Zig)
Muchos plugins (como **Treesitter**) requieren compilar archivos C. En Windows esto suele ser un dolor de cabeza.
- **Solución**: Incluimos **Zig v0.13.0**.
- **Cambio**: Creamos alias (`gcc.bat`, `cc.bat`, `clang.bat`) que redirigen a `zig cc`. Neovim cree que tenés instalado un compilador profesional, pero en realidad usa el binario portable de Zig.

### 3. Runtimes de Lenguajes Privados
- **Node.js**: Necesario para la mayoría de los LSPs (servidores de lenguaje).
- **Python 3.12**: Versión "embebida" configurada con `pip` activado. Esto permite que Neovim use herramientas basadas en Python sin que lo instales en Windows.
- **Go 1.26**: Runtime completo para desarrollo y herramientas de alto rendimiento.
- **LuaRocks**: Gestor de paquetes de Lua pre-configurado para que LazyVim pueda extenderse.

### 4. Herramientas de búsqueda y utilidades
Para que el buscador de archivos (`Telescope`) sea instantáneo, incluimos:
- `ripgrep` (rg): Búsqueda de texto ultra-rápida.
- `fd-find` (fd): Localización de archivos por nombre.
- `BusyBox`: Nos provee `unzip`, `wget` y `gzip` en un solo binario liviano para que **Mason** pueda descargar nuevos LSPs.
- `7zip`: Herramienta de compresión para gestión de archivos.

### 5. Estética y Fuentes
- **WezTerm** está configurado para cargar automáticamente **JetBrains Mono Nerd Font** desde la carpeta `fonts/` local. Verás íconos perfectos sin instalar ninguna fuente en el sistema.

---

## 📂 Estructura de la Carpeta

```text
neovim/
├── nvim/            # Tu configuración (Lua)
├── nvim-bin/        # Binarios oficiales de Neovim
├── nvim-data/       # Plugins instalados y compilados
├── tools/           # La "caja de herramientas" (Node, Python, Zig, Go, etc.)
├── fonts/           # Fuentes Nerd Font (JetBrains Mono)
├── nvim.bat         # El cerebro que configura el entorno
└── INICIAR_NEOVIM.bat # TU ACCESO DIRECTO
```

---

## 🚀 Cómo usar este Vim

1.  Descarga el archivo `.7z` desde la sección de **Releases** (o clona este repo).
2.  Extrae la carpeta en cualquier lugar.
3.  Doble clic en **`INICIAR_NEOVIM.bat`**.

> [!NOTE]
> La primera vez que lo abras, verás una pantalla de carga donde **LazyVim** descargará y compilará los plugins. Esto solo ocurre una vez.

## 🔒 Confianza y Seguridad
Todos los binarios incluidos han sido descargados directamente de sus fuentes oficiales (GitHub, Go.dev, Nodejs.org). El uso de un entorno portable garantiza que no se ejecuten procesos en segundo plano ni se altere el registro de Windows.
