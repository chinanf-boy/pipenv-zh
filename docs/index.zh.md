# Pipenv:人类的 Python 开发工作流程

[![image](https://img.shields.io/pypi/v/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/pypi/l/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/pypi/pyversions/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/badge/Say%20Thanks!-🦉-1EAEDB.svg)](https://saythanks.io/to/kennethreitz)

---

**Pipenv**是一个旨在将最好的包装世界(bundler, composer, npm, cargo, yarn 等)带到 Python 世界的工具._在我们的世界里,Windows 是一等公民._

它会自动为您的项目创建和管理 virtualenv，以及在安装/卸载软件包时，从`Pipfile`添加/删除您的项目包。它也会生成至关重要的`Pipfile.lock`，用于包库的构建确定性。

Pipenv 主要是为用户和开发者提供,
应用程序使用简单的方法来设置工作环境服务。 为了
库和应用程序之间，以及
`setup.py`用法 vs `Pipfile`定义依赖关系，参见
[☤ Pipfile vs setup.py](./advanced.zh.md#pipfile-vs-setuppy)。

<iframe src="https://player.vimeo.com/video/233134524" width="700" height="460" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

Pipenv 试图解决的问题是多方面的:

- 你不再需要分开使用`pip`和`virtualenv(虚拟环境)`。他们一起工作啦.
- 管理`requirements.txt`文件[可会是个问题](https://www.kennethreitz.org/essays/a-better-pip-workflow)，所以 Pipenv 使用即将到来的`Pipfile`和`Pipfile.lock`，这对于基本用例来说是优越的。
- 哈希随处可见。安全。自动暴露安全漏洞.
- 让您深入了解您的依赖关系图(例如`$ pipenv graph`).
- 通过加载`.env`文件简化开发工作流程。

您可以在浏览器中，快速使用 Pipenv:

[![Try in browser](https://cdn.rawgit.com/rootnroll/library/assets/try.svg)](https://rootnroll.com/d/pipenv/)

### 目录

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


  - [安装](#%E5%AE%89%E8%A3%85)
  - [☤ 用户的推荐(english)](#%E2%98%A4-%E7%94%A8%E6%88%B7%E7%9A%84%E6%8E%A8%E8%8D%90english)
  - [☤ 功能特性](#%E2%98%A4-%E5%8A%9F%E8%83%BD%E7%89%B9%E6%80%A7)
  - [更多文档指南](#%E6%9B%B4%E5%A4%9A%E6%96%87%E6%A1%A3%E6%8C%87%E5%8D%97)
  - [贡献指南](#%E8%B4%A1%E7%8C%AE%E6%8C%87%E5%8D%97)
  - [☤Pipenv 用法](#%E2%98%A4pipenv-%E7%94%A8%E6%B3%95)
- [指数和表格](#%E6%8C%87%E6%95%B0%E5%92%8C%E8%A1%A8%E6%A0%BC)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 安装

如果您使用的是 MacOS,可以使用 Homebrew 轻松安装 Pipenv:

```
$ brew install pipenv
```

或者,如果你正在使用 Fedora 28:

```
$ sudo dnf install pipenv
```

否则,请参阅[安装文档](./install.zh.md)作为指示.

✨🍰✨

## ☤ 用户的推荐(english)

**Jannis Leidel**, former pip maintainer---

: _Pipenv is the porcelain I always wanted to build for pip. It fits
my brain and mostly replaces virtualenvwrapper and manual pip calls
for me. Use it._

**David Gang**---

: _This package manager is really awesome. For the first time I know
exactly what my dependencies are which I installed and what the
transitive dependencies are. Combined with the fact that installs
are deterministic, makes this package manager first class, like
cargo_.

**Justin Myles Holmes**---

: _Pipenv is finally an abstraction meant to engage the mind instead
of merely the filesystem._

## ☤ 功能特性

- 真正实现*构建确定性*,同时轻松指定*仅是你想要的*.
- 生成，并检查锁定依赖项的文件哈希值.
- 自动安装所需的 Pythons，如果`pyenv`是可用的.
- 通过查找项目目录，以递归方式自动查找`Pipfile`.
- 自动生成一个`Pipfile`，如果其不存在.
- 在标准位置自动创建 virtualenv.
- 当卸载/安装包时，在`Pipfile`中自动添加/删除包。
- 自动加载`.env`文件，如果存在的话.

主要命令是`install`，`uninstall`,和`lock`,生成一个`Pipfile.lock`。这些都是为了取代`$ pip install`用法,以及手动 virtualenv 管理(要激活 virtualenv,请运行`$ pipenv shell`).

### 基本概念

- 当一个虚拟环境不存在时,将自动创建 virtualenv.
- 没有参数传递给`install`, 则所有`[packages]`指定包将被安装.
- 要初始化 Python 3 虚拟环境,请运行`$ pipenv --three`.
- 要初始化 Python 2 虚拟环境,请运行`$ pipenv --two`.
- 否则, virtualenv 默认为默认值.

### 其他命令

| 名      | 曰                                                                           |
| ------- | ---------------------------------------------------------------------------- |
| `shell` | 将派生一个(spawn) virtualenv 激活的 shell 进程。                             |
| `run`   | 将运行来自 virtualenv 的给定命令，并转发任何参数(例如`$ pipenv run python`). |
| `check` | 断言(asserts)当前环境正在满足 PEP 508 要求.                                  |
| `graph` | 将打印出所有已安装依赖项的漂亮图表.                                          |

## 更多文档指南

- [基础](./docs/basics.zh.md)
- [高级](./docs/advanced.zh.md)
- [常问的问题](./docs/diagnose.zh.md)

## 贡献指南

https://pipenv.readthedocs.io/en/latest/#contribution-guides

## ☤Pipenv 用法

https://pipenv.readthedocs.io/en/latest/#pipenv-usage

# 指数和表格

https://pipenv.readthedocs.io/en/latest/#indices-and-tables
