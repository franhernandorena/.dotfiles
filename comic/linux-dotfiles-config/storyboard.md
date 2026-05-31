# Storyboard - Linux Dotfiles Config

## Información General
- **Título**: Mi Configuración de Arch Linux
- **Estilo**: Ligne claire (Hergé/Tintín)
- **Tono**: Neutral, educativo
- **Idioma**: Español
- **Páginas**: 5 + portada
- **Aspect Ratio**: 3:4 (portrait)

---

## Página 0 - Portada

### "Mi Configuración de Arch Linux"
- **Escena**: Dibujo estilo ligne claire de una laptop mostrando una configuración de escritorio Linux con Hyprland. En primer plano, una carpeta ".dotfiles" abierta con archivos flotando.
- **Personajes**: 
  - Un personaje (el usuario, estilo Tintín) sosteniendo un martillo Architect
  - Hintergrund: escritorio minimalista con terminal, waybar, wofi
- **Texto**: "Mi configuración de Arch Linux - Guía de dotfiles"
- **Arte**: Líneas claras, colores planos (azules, blancos, grises), estilo Hergé

---

## Página 1 - El Repositorio de Dotfiles

### 1.1 - Panel Izquierdo
- Un personaje (estilo Tintín) frente a una computadora mostrando el directorio ~/.dotfiles
- Texto narrativo: "Todo comienza con un repositorio de configuración..."

### 1.2 - Panel Central
- Diagrama animado de archivos flotando: hypr/, ghostty/, zsh/, waybar/, wofi/, btop/
- Texto: " Aquí almacenamos nuestras configuraciones personales "

### 1.3 - Panel Derecho
- Comparativa: izquierda = caos de archivos por $HOME, derecha = todo organizado en .dotfiles
- Texto: " En lugar de散的 archivos por todo el sistema... "

---

## Página 2 - El Corazón del Sistema

### 2.1 - Panel Superior
- Hyprland - ventana gestualista con efectos de blur y animations
- Texto: "Hyprland - Window Manager minimalista"

### 2.2 - Panel Izquierda
- Ghostty + Kitty - terminales modernos
- Texto: "Terminales: Ghostty y Kitty"

### 2.3 - Panel Derecha
- Zsh - terminal con prompt personalizado
- Texto: "Zsh con temas y aliases"

### 2.4 - Panel Inferior
- Zellij - terminal multiplexer
- Texto: "Zellij para múltiples paneles"

---

## Página 3 - UI y Herramientas

### 3.1 - Panel Arriba
- Waybar - barra de estado en la parte superior
- Texto: "Waybar - Status Bar personalizable"

### 3.2 - Panel Izquierda
- Wofi - menú de aplicaciones estilo rofi
- Texto: "Wofi - Launcher minimalista"

### 3.3 - Panel Derecha
- btop - monitor del sistema
- Texto: "btop - Monitor del sistema"

### 3.4 - Panel Abajo
- GTK themes - gtk-3.0 y gtk-4.0
- Texto: "GTK Themes - Consistencia visual"

---

## Página 4 - El Script de Instalación

### 4.1 - Pantalla Completa
- Terminal mostrando install.sh ejecutándose
- Texto: "install.sh - Instalación automática"

### 4.2 - Diagrama de Flujo
- [Archivo] → [Symlink] → [$HOME/.config/]
- Creación de symlinks automáticos
- Texto: " Crea symlinks automáticamente... "

### 4.3 - Panel Derecha
- git con commits: "feat: add hypr config", "feat: add zsh aliases"
- Texto: " Y lo versionamos con Git "

---

## Página 5 - Qué NO Incluir

### 5.1 - Panel Izquierdo (X-rojo)
- screenshot.png - con un aspa roja
- agents/ - carpetas de IA
- iterm/, aerospace/, cursor/ - configs de otras plataformas
- Texto: " Archivos que NO son necesarios: "

### 5.2 - Panel Central
- vscode/globalStorage/ - con símbolo de excluir
- Texto: " Datos locales de aplicaciones "

### 5.3 - Panel Derecho
- Recomendación: .gitignore adecuado
- Texto: " Usa .gitignore para filtrar "

### 5.4 - Cierre
- El personaje guardando su configuración en Git
- Texto: " Guarda solo lo esencial en tu repositorio de dotfiles "
- Logo de Git en la esquina