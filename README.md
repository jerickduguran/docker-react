# docker-react
Docker React Creator Project
```
1.) clone repository - git clone https://github.com/jerickduguran/docker-react.git 
2.) go to cloned folder - cd docker-react
3.) Run  - docker-compose up -d —build ( to create react-app )
4.) create project  - docker cp create_react:/var/www/html/app ../project_name 
4.) navigate to  project_name , build and start coding!
```
Note:
If you already have existing react project,  port 3000 might already used.

To ensure port availability for the new project, change Port  in .env and docker-compose-dev.yml to desired port and rebuild

Happy Coding!
