#!/bin/bash

# Verificar se o Laravel já está instalado
if [ ! -f "/var/www/html/init-laravel.lock" ]; then
    # Criar um diretório temporário
    temp_dir=$(mktemp -d)

    # Mover arquivos existentes para o diretório temporário
    mv /var/www/html/* /var/www/html/.[^.]* $temp_dir

    # Instalar o Laravel com a versão especificada
    composer create-project --prefer-dist laravel/laravel:$LARAVEL_VERSION .

    # Mover arquivos de volta para o diretório do Laravel
    mv $temp_dir/* $temp_dir/.[^.]* /var/www/html

    # Remover diretório temporário
    rm -rf $temp_dir

    # Criar o arquivo de travamento
    touch /var/www/html/init-laravel.lock
fi

# Executar o servidor de desenvolvimento do Laravel
php artisan serve --host=0.0.0.0 --port=8000
