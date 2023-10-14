**Компиляция**
```
> swiftc hello.swift # -> hello
```

**Компиляция для отладки**
```
> swiftc -g hello.swift
```

**Запуск исходного файла**
```
> swift hello.swift
```

**Запуск скомпилированного файла**
```
> hello
```

**Удаленная отладка в docker-контейнере для VS Code**

- Установить плагины
  - Swift
  - CodeLLDB
  - Remote Development

- Открыть работающий контейнер через "Remote Explorer"
- Установить в контейнере плагин "Swift", "CodeLLDB"
- В качестве начального каталога установить **/home/student/src/**
- Создать **launch.json**
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug",
            "program": "${workspaceFolder}/hello",
            "args": [],
            "cwd": "${workspaceFolder}"
        }
    ]
}
```
