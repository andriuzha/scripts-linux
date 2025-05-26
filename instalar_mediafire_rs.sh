#!/bin/bash

# Este intala la aplicación mediafire_rs 
# Apliación cortesía de:
# https://github.com/NicKoehler/mediafire_rs

# Author: @andriuzha
# Versión 1.0
# 2025-05-26
# https://github.com/andriuzha/scripts-linux


echo "🚀 Iniciando instalación de mediafire_rs y dependencias..."

# 1. Verificar si rustup está instalado
if ! command -v rustup &> /dev/null
then
    echo "⏳ Instalando rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs  | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "✅ rustup ya está instalado."
fi

# 2. Actualizar Rust
echo "🔄 Actualizando Rust a la última versión..."
rustup update

# 3. Verificar e instalar dependencias del sistema
echo "🔧 Instalando dependencias del sistema (libssl-dev, pkg-config)..."
sudo apt update
sudo apt install -y libssl-dev pkg-config

# 4. Instalar mediafire_rs
echo "📦 Instalando mediafire_rs..."
cargo install mediafire_rs

# 5. Agregar soporte para emojis/iconos
echo "🔤 Instalando fuente Noto Color Emoji..."
sudo apt install -y fonts-noto-color-emoji

# 6. Verificación final
if command -v mediafire_rs &> /dev/null
then
    echo "🎉 ¡Instalación completada exitosamente!"
    echo "Puedes usar 'mediafire_rs' desde tu terminal."
else
    echo "❌ Error: No se pudo instalar mediafire_rs correctamente."
    echo "Verifica los errores anteriores o intenta manualmente con 'cargo install mediafire_rs'."
    exit 1
fi
