# Rinha de Backend 2025 - PHP e Go

[Aqui](https://github.com/flads/rinha25/tree/php-go) você pode acessar o código fonte do projeto.

##### Tecnologias utilizadas:

* [PHP](https://www.php.net/releases/8.4/en.php) - Linguagem de programação.
* [Go](https://go.dev/) - Linguagem de programação.
* [Redis](https://redis.io/) - Banco de dados em memória.
* [Nginx](https://nginx.org/) - Servidor web HTTP e load balancer.

##### Solução

A tabela abaixo mostra como os recursos foram alocados:

| Serviço      | CPU  | Memória   |
|--------------|------|-----------|
|  **api-1**   | 0.15 | 50MB      |
|  **api-2**   | 0.15 | 50MB      |
| **worker-1** | 0.40 | 100MB     |
| **worker-2** | 0.40 | 100MB     |
|  **nginx**   | 0.20 | 20MB      |
|  **redis**   | 0.20 | 30MB      |
|  **Total**   | 1.50 | 350MB     |

##### Arquitetura dos Serviços

- **Nginx**: Responsável por receber as requisições HTTP e atuar como **load balancer**, distribuindo as solicitações entre as duas instâncias da API.
- **APIs (api-1 e api-2)**: Gerenciam as requisições de pagamento, enviando os dados para uma fila ordenada no Redis.
- **Worker (worker-1 e worker-2)**: Executa continuamente, consumindo as requests da fila do Redis e processando os pagamentos, enviando requisições aos servidores externos de processamento.
- **Redis**: Banco de dados em memória utilizado como meio de comunicação entre as apis e os workers.