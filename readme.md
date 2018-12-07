# pypa/pipenv [![translate-svg]][translate-list]

<!-- [![explain]][source] -->

[explain]: http://llever.com/explain.svg
[source]: https://github.com/chinanf-boy/Source-Explain
[translate-svg]: http://llever.com/translate.svg
[translate-list]: https://github.com/chinanf-boy/chinese-translate-list

「 人类的 Python 开发工作流程 」

[中文](./readme.md) | [english](https://github.com/pypa/pipenv)

---

## 校对 🀄️

<!-- doc-templite START generated -->
<!-- repo = 'pypa/pipenv' -->
<!-- commit = '978d97764231b3690d5804d7e09e89ac572d73d7' -->
<!-- time = '2018-11-28' -->

| 翻译的原文 | 与日期        | 最新更新 | 更多                       |
| ---------- | ------------- | -------- | -------------------------- |
| [commit]   | ⏰ 2018-11-28 | ![last]  | [中文翻译][translate-list] |

[last]: https://img.shields.io/github/last-commit/pypa/pipenv.svg
[commit]: https://github.com/pypa/pipenv/tree/978d97764231b3690d5804d7e09e89ac572d73d7

<!-- doc-templite END generated -->

- [x] readme
- [x] [索引页](./docs/index.zh.md)
- [ ] [安装](./docs/install.zh.md)
- [ ] [基础](./docs/basics.zh.md)
- [ ] [高级](./docs/advanced.zh.md)
- [ ] [常问的问题](./docs/diagnose.zh.md)

> 官方文档的生成器`sphinx-build`有点烦，所以就算了，且 markdown 要转 rst 的工具不怎完美，懒得折腾了

### 贡献

欢迎 👏 勘误/校对/更新贡献 😊 [具体贡献请看](https://github.com/chinanf-boy/chinese-translate-list#贡献)

## 生活

[help me live , live need money 💰](https://github.com/chinanf-boy/live-need-money)

---

# Pipenv:人类的 Python 开发工作流程

[![image](https://img.shields.io/pypi/v/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://img.shields.io/pypi/l/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://badge.buildkite.com/79c7eccf056b17c3151f3c4d0e4c4b8b724539d84f1e037b9b.svg?branch=master)](https://code.kennethreitz.org/source/pipenv/)
[![VSTS build status (Windows)](<https://dev.azure.com/pypa/pipenv/_apis/build/status/pipenv%20CI%20(Windows)?branchName=master&label=Windows>)](https://dev.azure.com/pypa/pipenv/_build/latest?definitionId=9&branchName=master)
[![VSTS build status (Linux)](<https://dev.azure.com/pypa/pipenv/_apis/build/status/pipenv%20CI%20(Linux)?branchName=master&label=Linux>)](https://dev.azure.com/pypa/pipenv/_build/latest?definitionId=10&branchName=master)
[![image](https://img.shields.io/pypi/pyversions/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/kennethreitz)

---

**Pipenv**是一个旨在将最好的包装世界(bundler, composer, npm, cargo, yarn 等)带到 Python 世界的工具._在我们的世界里,Windows 是一等公民._

它会自动为您的项目创建和管理 virtualenv，以及在安装/卸载软件包时，从`Pipfile`添加/删除您的项目包。它也会生成至关重要的`Pipfile.lock`，用于包库的构建确定性。

![image](http://media.kennethreitz.com.s3.amazonaws.com/pipenv.gif)

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
- [☤ 功能](#%E2%98%A4-%E5%8A%9F%E8%83%BD)
- [☤ 用法](#%E2%98%A4-%E7%94%A8%E6%B3%95)
- [☤ 文档](#%E2%98%A4-%E6%96%87%E6%A1%A3)

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

否则,请参阅[官方文档](https://docs.pipenv.org/install/)作为指示.

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

### Shell tab 补全

例如,用 fish,把它放在你的`~/.config/fish/completions/pipenv.fish`:

```
eval (pipenv --completion)
```

或者,用 bash,把它放在你的`.bashrc`要么`.bash_profile`:

```
eval "$(pipenv --completion)"
```

魔法一样的 shell 补充现已启用! 还有一个[fish
插件](https://github.com/fisherman/pipenv),它会自动激活你的 子 shell!

Fish 是最好的 shell。你应该使用它.

## ☤ 用法

```
$ pipenv
Usage: pipenv [OPTIONS] COMMAND [ARGS]...

Options:
  --where          输出项目路径信息。
  --venv           输出 virtualenv 信息。
  --py             输出 Python解释器 信息。
  --envs           输出环境变量选项。
  --rm             删除 virtualenv。
  --bare           最小的输出。
  --completion     输出tab补全（待评估）。
  --man            显示 man 帮助页。
  --three / --two  在创建virtualenv时，使用Python 3/2。
  --python TEXT    指定virtualenv应该使用哪个版本的Python。
  --site-packages  为 virtualenv 启用 site-packages。
  --version        显示版本，并退出。
  -h, --help       显示此消息，并退出。


使用示例:
   > 创建一个使用 Python 3.7 的新项目, 如:
   $ pipenv --python 3.7

   > 删除 project virtualenv (注意是，从当前目录路径，推理来的):
   $ pipenv --rm

   > 为项目，安装 所有 dependencies  (包括 dev):
   $ pipenv install --dev

   > 创建一个 lockfile ，包括 pre-releases 版本:
   $ pipenv lock --pre

   > 展示一个，你已安装的依赖关系图:
   $ pipenv graph

   > 为了你已安装的依赖，检测 安全漏洞:
   $ pipenv check

   > 安装一个本地 setup.py 到， 你的 虚拟环境/Pipfile:
   $ pipenv install -e .

   > 运行一个 底层 pip 命令:
   $ pipenv run pip freeze

Commands:
  check      - 检查安全漏洞，和PEP 508标记
             - 由 Pipfile 提供由来。
  clean      - 卸载 Pipfile.lock中，所有未指定的软件包。
  graph      - 显示当前安装的依赖关系图信息。
  install    - 安装提供的包，并将它们添加到Pipfile，或者（如果没有）
             - 给出了包名参数，就从Pipfile安装所有包。
  lock       - 生成 Pipfile.lock。
  open       - 在编辑器中，查看给定模块。
  run        - 运行一个安装在virtualenv中的命令。
  shell      - 在virtualenv中生成一个shell进程。
  sync       - 安装 Pipfile.lock 中指定的所有包。
  uninstall  - 卸载输入的软件包，并将其从Pipfile中删除。
```

启用项目:

```
$ pipenv --where
/Users/kennethreitz/Library/Mobile Documents/com~apple~CloudDocs/repos/kr/pipenv/test
```

启用 virtualenv:

```
$ pipenv --venv
/Users/kennethreitz/.local/share/virtualenvs/test-Skyy4vre
```

启用 Python 解释器:

```
$ pipenv --py
/Users/kennethreitz/.local/share/virtualenvs/test-Skyy4vre/bin/python
```

安装包:

```
$ pipenv install
Creating a virtualenv for this project...
...
No package provided, installing all dependencies.
Virtualenv location: /Users/kennethreitz/.local/share/virtualenvs/test-EJkjoYts
Installing dependencies from Pipfile.lock...
...

To activate this project's virtualenv, run the following:
$ pipenv shell
```

指定 git 安装包:

您可以使用根据以下规则格式化的 URL ，从 git 和其他版本控制系统安装 pipenv 包:

```
<vcs_type>+<scheme>://<location>/<user_or_organization>/<repository>@<branch_or_tag>#<package_name>
```

唯一可选的部分是`@<branch_or_tag>`部分。通过 SSH 使用 git 时,您可以使用短关键字 vcs 和 scheme 别名`git+git@<location>:<user_or_organization>/<repository>@<branch_or_tag>#<package_name>`。请注意,在解析时，这会转换成`git+ssh://git@<location>`.

`<vcs_type>`有效值包括`git`,`bzr`,`svn`,和`hg`。`<scheme>`有效值包括`http,`,`https`,`ssh`,和`file`。在特定情况下,您还可以访问其他方案(scheme)`svn`，可以与`svn`结合使用，还有`bzr`可以与`sftp`和`lp`结合使用。

请注意`pipenv install -e`是**强力推荐**，您可以在可编辑模式下，安装任何版本控制的依赖项,以确保每次执行时，都可以在依赖项解析过程，使用存储库的最新副本，和包含所有已知的依赖项。

以下是安装`requests`包，位于 git 存储库的示例用法`https://github.com/requests/requests.git`，其标签为`v2.19.1`:

```
$ pipenv install -e git+https://github.com/requests/requests.git@v2.19#egg=requests
Creating a Pipfile for this project...
Installing -e git+https://github.com/requests/requests.git@v2.19.1#egg=requests...
[...snipped...]
Adding -e git+https://github.com/requests/requests.git@v2.19.1#egg=requests to Pipfile's [packages]...
[...]
```

你可以阅读更多关于[pip's 实现了 vcs 的支持](https://pip.pypa.io/en/stable/reference/pip_install/#vcs-support).

安装 dev 依赖项:

```
$ pipenv install pytest --dev
Installing pytest...
...
Adding pytest to Pipfile's [dev-packages]...
```

显示依赖关系图:

```
$ pipenv graph
requests==2.18.4
  - certifi [required: >=2017.4.17, installed: 2017.7.27.1]
  - chardet [required: >=3.0.2,<3.1.0, installed: 3.0.4]
  - idna [required: >=2.5,<2.7, installed: 2.6]
  - urllib3 [required: <1.23,>=1.21.1, installed: 1.22]
```

生成一个锁文件:

```
$ pipenv lock
Assuring all dependencies from Pipfile are installed...
Locking [dev-packages] dependencies...
Locking [packages] dependencies...
Note: your project now has only default [packages] installed.
To install [dev-packages], run: $ pipenv install --dev
```

安装所有 dev 依赖项:

```
$ pipenv install --dev
Pipfile found at /Users/kennethreitz/repos/kr/pip2/test/Pipfile. Considering this to be the project home.
Pipfile.lock out of date, updating...
Assuring all dependencies from Pipfile are installed...
Locking [dev-packages] dependencies...
Locking [packages] dependencies...
```

卸载一切:

```
$ pipenv uninstall --all
No package provided, un-installing all dependencies.
Found 25 installed package(s), purging...
...
Environment now purged and fresh!
```

使用 shell:

```
$ pipenv shell
Loading .env environment variables…
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
$ ▯
```

## ☤ 文档

文档驻守在[pipenv.org](http://pipenv.org/).
