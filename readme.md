# pypa/pipenv [![explain]][source] [![translate-svg]][translate-list]

<!-- [![size-img]][size] -->

[explain]: http://llever.com/explain.svg
[source]: https://github.com/chinanf-boy/Source-Explain
[translate-svg]: http://llever.com/translate.svg
[translate-list]: https://github.com/chinanf-boy/chinese-translate-list
[size-img]: https://packagephobia.now.sh/badge?p=Name
[size]: https://packagephobia.now.sh/result?p=Name

「 desc 」

[中文](./readme.md) | [english](https://github.com/pypa/pipenv)

---

## 校对 🀄️

<!-- doc-templite START generated -->
<!-- repo = 'pypa/pipenv' -->
<!-- commit = 'true' -->
<!-- time = 'true' -->

| 翻译的原文 | 与日期  | 最新更新 | 更多                       |
| ---------- | ------- | -------- | -------------------------- |
| [commit]   | ⏰ true | ![last]  | [中文翻译][translate-list] |

[last]: https://img.shields.io/github/last-commit/pypa/pipenv.svg
[commit]: https://github.com/pypa/pipenv/tree/true

<!-- doc-templite END generated -->

### 贡献

欢迎 👏 勘误/校对/更新贡献 😊 [具体贡献请看](https://github.com/chinanf-boy/chinese-translate-list#贡献)

## 生活

[help me live , live need money 💰](https://github.com/chinanf-boy/live-need-money)

---

### 目录

<!-- START doctoc -->
<!-- END doctoc -->

# Pipenv:人类的 Python 开发工作流程

[![image](https://img.shields.io/pypi/v/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://img.shields.io/pypi/l/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://badge.buildkite.com/79c7eccf056b17c3151f3c4d0e4c4b8b724539d84f1e037b9b.svg?branch=master)](https://code.kennethreitz.org/source/pipenv/)
[![VSTS build status (Windows)](<https://dev.azure.com/pypa/pipenv/_apis/build/status/pipenv%20CI%20(Windows)?branchName=master&label=Windows>)](https://dev.azure.com/pypa/pipenv/_build/latest?definitionId=9&branchName=master)
[![VSTS build status (Linux)](<https://dev.azure.com/pypa/pipenv/_apis/build/status/pipenv%20CI%20(Linux)?branchName=master&label=Linux>)](https://dev.azure.com/pypa/pipenv/_build/latest?definitionId=10&branchName=master)
[![image](https://img.shields.io/pypi/pyversions/pipenv.svg)](https://python.org/pypi/pipenv)
[![image](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/kennethreitz)

---

**Pipenv**是一个旨在将最好的包装世界(捆绑商,作曲家,npm,货物,纱线等)带到 Python 世界的工具._在我们的世界里,Windows 是一流的公民._

它会自动为您的项目创建和管理 virtualenv,以及添加/删除您的项目包`Pipfile`在安装/卸载软件包时.它也产生了至关重要的`Pipfile.lock`,用于生成确定性构建.

![image](http://media.kennethreitz.com.s3.amazonaws.com/pipenv.gif)

Pipenv 试图解决的问题是多方面的:

- 你不再需要使用`pip`和`virtualenv`分别.他们一起工作.
- 管理`requirements.txt`文件[can be
  problematic](https://www.kennethreitz.org/essays/a-better-pip-workflow),所以 Pipenv 使用即将到来的`Pipfile`和`Pipfile.lock`相反,这对于基本用例来说是优越的.
- 散列随处可见.安全.自动暴露安全漏洞.
- 让您深入了解您的依赖关系图(例如`$ pipenv graph`).
- 通过加载简化开发工作流程`.env`文件.

您可以在浏览器中快速使用 Pipenv:

[![Try in browser](https://cdn.rawgit.com/rootnroll/library/assets/try.svg)](https://rootnroll.com/d/pipenv/)

## 安装

如果您使用的是 MacOS,可以使用 Homebrew 轻松安装 Pipenv:

```
$ brew install pipenv
```

或者,如果你正在使用 Fedora 28:

```
$ sudo dnf install pipenv
```

否则,请参阅[documentation](https://docs.pipenv.org/install/)作为指示.

✨🍰✨

## ☤ 用户推荐

**Jannis Leidel**,前任维护人员---

:_皮彭夫是我一直想为 pip 建造的瓷器.它适合我的大脑,并且大多数取代了 virtualenvwrapper 和手动 pip 电话给我.用它._

**大卫冈**---

:_这个包管理器非常棒.我第一次确切知道我安装的依赖项是什么以及传递依赖项是什么.结合安装是确定性的事实,使这个包管理器成为头等舱,就像货物一样_.

**贾斯汀迈尔斯福尔摩斯**---

:_Pipenv 最终是一个旨在吸引思维而不仅仅是文件系统的抽象._

## ☤ 功能

- 真正实现*确定性构建*,同时轻松指定*只有你想要的*.
- 生成并检查锁定依赖项的文件哈希值.
- 自动安装所需的 Pythons,如果`pyenv`是可用的.
- 通过查找 a,以递归方式自动查找项目`Pipfile`.
- 自动生成一个`Pipfile`,如果一个人不存在.
- 在标准位置自动创建 virtualenv.
- 自动添加/删除包到`Pipfile`何时取消/安装.
- 自动加载`.env`文件,如果存在的话.

主要命令是`install`,`uninstall`,和`lock`,生成一个`Pipfile.lock`.这些都是为了取代`$ pip install`用法,以及手动 virtualenv 管理(激活 virtualenv,运行`$ pipenv shell`).

### 基本概念

- 当一个不存在时,将自动创建 virtualenv.
- 没有参数传递给`install`,所有包裹`[packages]`指定将被安装.
- 要初始化 Python 3 虚拟环境,请运行`$ pipenv --three`.
- 要初始化 Python 2 虚拟环境,请运行`$ pipenv --two`.
- 否则,无论 virtualenv 默认为默认值.

### 其他命令

- `shell`将生成 virtualenv 激活的 shell.
- `run`将运行来自 virtualenv 的给定命令,并转发任何参数(例如`$ pipenv run python`).
- `check`断言当前环境正在满足 PEP 508 要求.
- `graph`将打印出所有已安装依赖项的漂亮图表.

### 壳牌完工

例如,用鱼,把它放在你的`~/.config/fish/completions/pipenv.fish`:

```
eval (pipenv --completion)
```

或者,用 bash,把它放在你的`.bashrc`要么`.bash_profile`:

```
eval "$(pipenv --completion)"
```

Magic shell 完成现已启用!还有一个[fish
plugin](https://github.com/fisherman/pipenv),它会自动激活你的子壳!

鱼是最好的外壳.你应该使用它.

## ☤ 用法

```
$ pipenv
Usage: pipenv [OPTIONS] COMMAND [ARGS]...

Options:
  --where          Output project home information.
  --venv           Output virtualenv information.
  --py             Output Python interpreter information.
  --envs           Output Environment Variable options.
  --rm             Remove the virtualenv.
  --bare           Minimal output.
  --completion     Output completion (to be eval'd).
  --man            Display manpage.
  --three / --two  Use Python 3/2 when creating virtualenv.
  --python TEXT    Specify which version of Python virtualenv should use.
  --site-packages  Enable site-packages for the virtualenv.
  --version        Show the version and exit.
  -h, --help       Show this message and exit.


Usage Examples:
   Create a new project using Python 3.7, specifically:
   $ pipenv --python 3.7

   Remove project virtualenv (inferred from current directory):
   $ pipenv --rm

   Install all dependencies for a project (including dev):
   $ pipenv install --dev

   Create a lockfile containing pre-releases:
   $ pipenv lock --pre

   Show a graph of your installed dependencies:
   $ pipenv graph

   Check your installed dependencies for security vulnerabilities:
   $ pipenv check

   Install a local setup.py into your virtual environment/Pipfile:
   $ pipenv install -e .

   Use a lower-level pip command:
   $ pipenv run pip freeze

Commands:
  check      Checks for security vulnerabilities and against PEP 508 markers
             provided in Pipfile.
  clean      Uninstalls all packages not specified in Pipfile.lock.
  graph      Displays currently–installed dependency graph information.
  install    Installs provided packages and adds them to Pipfile, or (if no
             packages are given), installs all packages from Pipfile.
  lock       Generates Pipfile.lock.
  open       View a given module in your editor.
  run        Spawns a command installed into the virtualenv.
  shell      Spawns a shell within the virtualenv.
  sync       Installs all packages specified in Pipfile.lock.
  uninstall  Un-installs a provided package and removes it from Pipfile.
```

找到项目:

```
$ pipenv --where
/Users/kennethreitz/Library/Mobile Documents/com~apple~CloudDocs/repos/kr/pipenv/test
```

找到 virtualenv:

```
$ pipenv --venv
/Users/kennethreitz/.local/share/virtualenvs/test-Skyy4vre
```

找到 Python 解释器:

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

从 git 安装:

您可以使用根据以下规则格式化的 URL 从 git 和其他版本控制系统安装 pipenv 包:

```
<vcs_type>+<scheme>://<location>/<user_or_organization>/<repository>@<branch_or_tag>#<package_name>
```

唯一可选的部分是`@<branch_or_tag>`部分.通过 SSH 使用 git 时,您可以使用速记 vcs 和 scheme 别名`git+git@<location>:<user_or_organization>/<repository>@<branch_or_tag>#<package_name>`.请注意,这被翻译成`git+ssh://git@<location>`解析时.

有效值`<vcs_type>`包括`git`,`bzr`,`svn`,和`hg`.有效值`<scheme>`包括`http,`,`https`,`ssh`,和`file`.在特定情况下,您还可以访问其他方案:`svn`可以结合使用`svn`作为一个计划,和`bzr`可以结合使用`sftp`和`lp`.

请注意它是**强力推荐**您可以使用在可编辑模式下安装任何版本控制的依赖项`pipenv install -e`,以确保每次执行时都可以使用存储库的最新副本执行依赖项解析,并且它包含所有已知的依赖项.

以下是安装位于的 git 存储库的示例用法`https://github.com/requests/requests.git`来自标签`v2.19.1`作为包名`requests`:

```
$ pipenv install -e git+https://github.com/requests/requests.git@v2.19#egg=requests
Creating a Pipfile for this project...
Installing -e git+https://github.com/requests/requests.git@v2.19.1#egg=requests...
[...snipped...]
Adding -e git+https://github.com/requests/requests.git@v2.19.1#egg=requests to Pipfile's [packages]...
[...]
```

你可以阅读更多关于[pip's implementation of vcs support here](https://pip.pypa.io/en/stable/reference/pip_install/#vcs-support).

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

文档驻留在[pipenv.org](http://pipenv.org/).
