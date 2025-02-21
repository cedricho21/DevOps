# DevOps. Project 8
## Part 1. Удаленное конфигурирование узла через Ansible
* Создал с помощью Vagrant три машины - ***manager01, node01, node02***. Прокинул порты node01 на локальную машину
![](images/1.1.png)

* Зашел на машину ***manager01***. Проверил подключение к node01 через ssh по приватной сети.
![](images/1.2.png)

* Сгенерировал ssh-ключ для подключения к node01 из manager (без passphrase).
![](images/1.3.png)

* Установил Ansible на менеджер и создал папку ansible, в которой создать inventory-файл.
![](images/1.4.png)
![](images/1.5.png)

* Использовал модуль ping для проверки подключения через Ansible.
    
    ![](images/1.6.png)

* Написал первый плейбук для Ansible, который выполняет apt update, устанавливает docker, docker-compose, копирует compose-файл из manager'а и разворачивает микросервисное приложение.
    
    ![](images/1.7.png)
    ![](images/1.8.png)

* Прогнал заготовленные тесты через postman и удостоверился, что все они проходят успешно.
![](images/1.9.png)

### Сформировал три роли:
* ***Роль application***. Выполняет развертывание микросервисного приложения при помощи docker-compose. Назначил ее на node01.
![](images/1.10.png)
* ***Роль apache***. Устанавливает и запускает стандартный apache сервер. Назначил ее на node02.
![](images/1.11.png)
* ***Роль postgres***. Устанавливает и запускает postgres, создает базу данных с произвольной таблицей и добавляет в нее три произвольные записи. Также назначил ее на node02.

    ![](images/1.12.png)

* Запустил плейбук и проверил, что все задачи выполнены.
![](images/1.13.png)
![](images/1.14.png)
![](images/1.15.png)
![](images/1.16.png)

## Part 2. Service Discovery

* Написал конфигурационные файлы для consul

    **consul server**

    ![](images/2.1.png)

    **consul client api**
    ![](images/2.2.png)

    **consul client db**
    ![](images/2.3.png)

* Создал с помощью Vagrant четыре машины - consul_server, api, manager и db.
![](images/2.4.png)

* Написал плейбук для ansible и четыре роли

    **install_consul_server**
    ![](images/2.5.png)

    **install_consul_client**
    ![](images/2.6.png)

    **install_hotel_service**
    ![](images/2.7.png)

    **install_db**
    ![](images/2.8.png)

* Результат выполнения задач Ansible
![](images/2.9.png)

* Проверка работы сервиса
![](images/2.10.png)
![](images/2.11.png)

