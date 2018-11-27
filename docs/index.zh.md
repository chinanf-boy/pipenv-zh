# Pipenv:人类的Python开发工作流程

[![image](https://img.shields.io/pypi/v/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/pypi/l/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/pypi/pyversions/pipenv.svg)](https://pypi.python.org/pypi/pipenv)

[![image](https://img.shields.io/badge/Say%20Thanks!-🦉-1EAEDB.svg)](https://saythanks.io/to/kennethreitz)

* * *

**Pipenv**是一个旨在将最好的包装世界(捆绑商,作曲家,npm,货物,纱线等)带到Python世界的工具.*在我们的世界里,Windows是一流的公民.*

它会自动为您的项目创建和管理virtualenv,以及添加/删除您的项目包`Pipfile`在安装/卸载软件包时.它也产生了至关重要的`Pipfile.lock`,用于生成确定性构建.

Pipenv主要是为应用程序的用户和开发人员提供一种简单的方法来设置工作环境.用于区分库和应用程序以及使用`setup.py`vs`Pipfile`定义依赖关系,请参阅`pipfile-vs-setuppy`{.interpreted-text role ="ref"}.

<iframe src="https://player.vimeo.com/video/233134524" width="700" height="460" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

Pipenv试图解决的问题是多方面的:

-   你不再需要使用`pip`和`virtualenv`分别.他们一起工作.
-   管理`requirements.txt`文件[can be
    problematic](https://www.kennethreitz.org/essays/a-better-pip-workflow),所以Pipenv使用`Pipfile`和`Pipfile.lock`将抽象依赖性声明与上次测试的组合分开.
-   散列随处可见.安全.自动暴露安全漏洞.
-   强烈建议使用最新版本的依赖项以最大限度地降低安全风险[arising from outdated
    components](https://www.owasp.org/index.php/Top_10-2017_A9-Using_Components_with_Known_Vulnerabilities).
-   让您深入了解您的依赖关系图(例如`$ pipenv graph`).
-   通过加载简化开发工作流程`.env`文件.

您可以在浏览器中快速使用Pipenv:

[![Try in browser](https://cdn.rawgit.com/rootnroll/library/assets/try.svg)](https://rootnroll.com/d/pipenv/)

## 立即安装Pipenv!

如果您使用的是MacOS,可以使用Homebrew轻松安装Pipenv:

```
$ brew install pipenv
```

或者,如果你正在使用Fedora 28:

```
$ sudo dnf install pipenv
```

否则,请参阅`installing-pipenv`{.interpreted-text role ="ref"}章节说明.

✨🍰✨

::: {.toctree maxdepth ="2"}安装changelog :::

## 用户推荐

**Jannis Leidel**,前任维护人员---

:*皮彭夫是我一直想为pip建造的瓷器.它适合我的大脑,并且大多数取代了virtualenvwrapper和手动pip电话给我.用它.*

**大卫冈**---

:*这个包管理器非常棒.我第一次确切知道我安装的依赖项是什么以及传递依赖项是什么.结合安装是确定性的事实,使这个包管理器成为头等舱,就像货物一样*.

**贾斯汀迈尔斯福尔摩斯**---

:*Pipenv最终是一个旨在吸引思维而不仅仅是文件系统的抽象.*

## ☤Pipenv功能

-   真正实现*确定性构建*,同时轻松指定*只有你想要的*.
-   生成并检查锁定依赖项的文件哈希值.
-   自动安装所需的Pythons,如果`pyenv`是可用的.
-   通过查找a,以递归方式自动查找项目`Pipfile`.
-   自动生成一个`Pipfile`,如果一个人不存在.
-   在标准位置自动创建virtualenv.
-   自动添加/删除包到`Pipfile`何时取消/安装.
-   自动加载`.env`文件,如果存在的话.

主要命令是`install`,`uninstall`,和`lock`,生成一个`Pipfile.lock`.这些都是为了取代`$ pip install`用法,以及手动virtualenv管理(激活virtualenv,运行`$ pipenv shell`).

### 基本概念

-   当一个不存在时,将自动创建virtualenv.
-   没有参数传递给`install`,所有包裹`[packages]`指定将被安装.
-   要初始化Python 3虚拟环境,请运行`$ pipenv --three`.
-   要初始化Python 2虚拟环境,请运行`$ pipenv --two`.
-   否则,无论virtualenv默认为默认值.

### 其他命令

-   `graph`将显示已安装依赖项的依赖关系图.
-   `shell`将生成virtualenv激活的shell.可以通过使用来停用此shell`exit`.
-   `run`将运行来自virtualenv的给定命令,并转发任何参数(例如`$ pipenv run python`要么`$ pipenv run pip freeze`).
-   `check`检查安全漏洞并声明当前环境正在满足PEP 508要求.

## 更多文档指南

::: {.toctree maxdepth ="2"}基础知识高级诊断:::

## 贡献指南

::: {.tooctree maxdepth ="2"} dev / philosophy dev / contributions :::

## ☤Pipenv用法

::: {.click prog ="pipenv"show-nested =""} pipenv:cli :::

# 指数和表格

-   `genindex`{.interpreted-text role ="ref"}
-   `modindex`{.interpreted-text role ="ref"}
-   `search`{.interpreted-text role ="ref"}
