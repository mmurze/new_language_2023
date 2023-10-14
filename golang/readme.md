**Компиляция**
```
> go build hello.go # -> hello
```

**Запуск исходного файла**
```
> go run hello.go
```

**Запуск скомпилированного файла**
```
> hello
```

**Удаленная отладка в docker-контейнере для VS Code**

- Установить плагины
  - Go
  - Remote Development

- Открыть работающий контейнер через "Remote Explorer"
- Установить в контейнере плагин "Go"
- В качестве начального каталога установить **/home/student/src/**
- Перейти в терминал и запустить там команды
```
> go install -v golang.org/x/tools/gopls@latest
> go install -v github.com/go-delve/delve/cmd/dlv@latest
```
- Создать **launch.json**
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Package",
            "type": "go",
            "request": "launch",
            "mode": "auto",
            "program": "${fileDirname}"
        }
    ]
}
```
