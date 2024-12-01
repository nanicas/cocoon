# Sobre

Estrutura e modelo responsável pela orquestração dos cointêneres das aplicações

## Como criar um novo projeto

- Dentro da pasta `projects`, crie a pasta do seu projeto:

    ```bash
    mkdir projects/your_app
    ```

- Copie todos os arquivos contidos em `templates/laravel/*` para a pasta do seu projeto:

    ```bash
    cp templates/laravel/* projects/your_app
    ```

- Acesse a raiz do seu projeto para realizar as alterações e execuções devidas:

    ```bash
    cd projects/your_app
    ```

- Altere o arquivo `docker-compose.yml`, substituindo a tag `<name>` pelo nome real e a porta de acesso
    > Atenção: a nova porta não pode estar em uso por outro container.
    
    Caso queira customizar, fique a vontade para modificar esse arquivo, inclusive, alterando a versão do Laravel ao modificar a variável de ambiente `LARAVEL_VERSION`, que, por padrão, está na **10**.



- Execute o comando para iniciar o processo de configuração e subida da aplicação:

    ```bash
    docker-compose up -d
    ```

### Explicação da inicilização

Conforme comando `CMD ["sh", "/var/www/html/init-laravel.sh"]` dentro do arquivo `Dockerfile`, toda vez que o container subir, será executado esse script na inicialização.

Na primeira vez que esse processo ocorre, o script não irá encontrar na raiz do projeto o arquivo `init-laravel.lock`, ou seja, dando então a liberdade para que o processo de `composer create-project` ocorra.

> Atenção: caso você esteja usando essa estrutura, porém, com um projeto já existente, LEMBRE-SE de criar esse arquivo na raiz do seu projeto antes da execução do `docker-compose up -d` para que seus arquivos não sejam sobreescritos.

No fim da execução do script `init-laravel.sh`, é criado então automaticamente o arquivo `init-laravel.lock`, lembre-se de adicioná-lo e commitá-lo no seu sistema de versionamento.

---

## Pendências

1. Passar a usar a nova versão desse gerenciador, localizado em: https://github.com/zevitagem/apps-schema-docker
