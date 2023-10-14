**Запуск интерпретатора (VM)**
```
> lua
```
**Выход из интерпретатора**
```
[Gtrl-C]
```

**Компиляция**
```
> luac hello.lua # -> luac.out
```

**Запуск исходного файла**
```
> lua hello.lua
```

**Запуск скомпилированного файла**
```
> lua luaс.out
```

**Удаленная отладка в docker-контейнере для VS Code**

- Установить плагины
  - Local Lua Debugger
  - Remote Development

- Открыть работающий контейнер через "Remote Explorer"
- Установить в контейнере плагин "Local Lua Debugger"
- В качестве начального каталога установить **/home/student/src/**
- Создать **launch.json**
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug Lua Interpreter",
            "type": "lua-local",
            "request": "launch",
            "program": {
                "lua": "lua",
                "file": "${file}"
            }
        }
    ]
}
```
