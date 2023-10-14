**Компиляция**
```
> rustc hello.rs # -> hello
```

**Запуск скомпилированного файла**
```
> hello
```

**Удаленная отладка в docker-контейнере для VS Code**

- Установить плагины
  - rust-analyzer
  - CodeLLDB
  - Remote Development

- Открыть работающий контейнер через "Remote Explorer"
- Установить в контейнере плагин "rust-analyzer", "CodeLLDB"
- Перейти в терминале контейнера в каталог **/home/student/src/** и выполнить команду
```
> cargo new hello_world
```
- В качестве каталога установить **/home/student/src/hello_world**
- Создать **launch.json**
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug executable 'hello_world'",
            "cargo": {
                "args": [
                    "build",
                    "--bin=hello_world",
                    "--package=hello_world"
                ],
                "filter": {
                    "name": "hello_world",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug unit tests in executable 'hello_world'",
            "cargo": {
                "args": [
                    "test",
                    "--no-run",
                    "--bin=hello_world",
                    "--package=hello_world"
                ],
                "filter": {
                    "name": "hello_world",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        }
    ]
}
```
