# 经常遇到的 Pipenv 问题

Pipenv 不断被志愿者改进,但仍然是一个资源有限的非常年轻的项目,并且有一些需要处理的怪癖.我们需要每个人的帮助(包括你的帮助!).

以下是人们使用 Pipenv 的一些常见问题.请看下面,看看他们是否能解决您的问题.

::: {.note} ::: {.admonition-title}注:::

**确保您首先运行最新的 Pipenv 版本!**:::

## 目录

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [☤ 您的依赖关系无法解决](#%E2%98%A4-%E6%82%A8%E7%9A%84%E4%BE%9D%E8%B5%96%E5%85%B3%E7%B3%BB%E6%97%A0%E6%B3%95%E8%A7%A3%E5%86%B3)
- [☤ 没有名为\\ \<模块名称的模块>](#%E2%98%A4-%E6%B2%A1%E6%9C%89%E5%90%8D%E4%B8%BA%5C%5C-%5C%E6%A8%A1%E5%9D%97%E5%90%8D%E7%A7%B0%E7%9A%84%E6%A8%A1%E5%9D%97)
- [☤ 找不到我的 pyenv 安装的 Python](#%E2%98%A4-%E6%89%BE%E4%B8%8D%E5%88%B0%E6%88%91%E7%9A%84-pyenv-%E5%AE%89%E8%A3%85%E7%9A%84-python)
- [☤Pipenv 不尊重 pyenv 的全局和本地 Python 版本](#%E2%98%A4pipenv-%E4%B8%8D%E5%B0%8A%E9%87%8D-pyenv-%E7%9A%84%E5%85%A8%E5%B1%80%E5%92%8C%E6%9C%AC%E5%9C%B0-python-%E7%89%88%E6%9C%AC)
- [☤ValueError:未知语言环境:UTF-8](#%E2%98%A4valueerror%E6%9C%AA%E7%9F%A5%E8%AF%AD%E8%A8%80%E7%8E%AF%E5%A2%83utf-8)
- [☤/ bin / pip:没有这样的文件或目录](#%E2%98%A4-bin--pip%E6%B2%A1%E6%9C%89%E8%BF%99%E6%A0%B7%E7%9A%84%E6%96%87%E4%BB%B6%E6%88%96%E7%9B%AE%E5%BD%95)
- [☤`shell`在提示中没有显示 virtualenv 的名字](#%E2%98%A4shell%E5%9C%A8%E6%8F%90%E7%A4%BA%E4%B8%AD%E6%B2%A1%E6%9C%89%E6%98%BE%E7%A4%BA-virtualenv-%E7%9A%84%E5%90%8D%E5%AD%97)
- [☤Pipenv 不尊重 setup.py 中的依赖项](#%E2%98%A4pipenv-%E4%B8%8D%E5%B0%8A%E9%87%8D-setuppy-%E4%B8%AD%E7%9A%84%E4%BE%9D%E8%B5%96%E9%A1%B9)
- [☤ 使用`pipenv run`在主管计划中](#%E2%98%A4-%E4%BD%BF%E7%94%A8pipenv-run%E5%9C%A8%E4%B8%BB%E7%AE%A1%E8%AE%A1%E5%88%92%E4%B8%AD)
- [☤ 期间提出异常`Locking dependencies…`](#%E2%98%A4-%E6%9C%9F%E9%97%B4%E6%8F%90%E5%87%BA%E5%BC%82%E5%B8%B8locking-dependencies)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ☤ 您的依赖关系无法解决

确保你的依赖实际*做*解决.如果您对它们充满信心,则可能需要清除解析程序缓存.运行以下命令:

```
pipenv lock --clear
```

然后再试一次.

如果这不起作用,请尝试手动删除整个缓存目录.它通常是以下位置之一:

- `~/Library/Caches/pipenv`(苹果系统)
- `%LOCALAPPDATA%\pipenv\pipenv\Cache`(视窗)
- `~/.cache/pipenv`(其他操作系统)

Pipenv 不会安装预发行版(即具有 alpha / beta / etc.后缀的版本,例如*1.0b1*) 默认情况下.你需要通过`--pre`在您的命令中标记或设置

```
[pipenv]
allow_prereleases = true
```

在你的 Pipfile 中.

## ☤ 没有名为\\ \<模块名称的模块>

这通常是将 Pipenv 与系统包混合的结果.我们*非常*建议在隔离的环境中安装 Pipenv.卸载所有现有的 Pipenv 安装,然后查看`installing-pipenv`{.interpreted-text role ="ref"}选择安装 Pipenv 的推荐方法之一.

## ☤ 找不到我的 pyenv 安装的 Python

确保你有`PYENV_ROOT`设置正确.Pipenv 仅支持 CPython 发行版,版本名称如`3.6.4`或类似的.

## ☤Pipenv 不尊重 pyenv 的全局和本地 Python 版本

Pipenv 默认使用安装的 Python 来创建 virtualenv.你可以设置`--python`选项,或`$PYENV_ROOT/shims/python`在选择翻译时让它咨询 pyenv.看到`specifying_versions`{.interpreted-text role ="ref"}了解更多信息.

如果您希望 Pipenv 自动"做正确的事",您可以设置环境变量`PIPENV_PYTHON`至`$PYENV_ROOT/shims/python`.这将使 Pipenv 默认使用 pyenv 的活动 Python 版本来创建虚拟环境.

## ☤ValueError:未知语言环境:UTF-8 

macOS 在其区域设置检测中有一个错误,阻止我们正确检测您的 shell 编码.如果区域设置变量未指定编码,这也可能是其他系统上的问题.

解决方法是将以下两个环境变量设置为标准本地化格式:

- `LC_ALL`
- `LANG`

例如,对于 Bash,您可以将以下内容添加到您的`~/.bash_profile`:

```{.sourceCode .bash}
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
```

对于 Zsh,要编辑的文件是`~/.zshrc`.

::: {.note} ::: {.admonition-title}注:::

你可以改变两个`en_US`和`UTF-8`部分使用您使用的语言/语言环境和编码.:::

## ☤/ bin / pip:没有这样的文件或目录

这可能与您的区域设置有关.看到`unknown-local-diagnose`{.interpreted-text role ="ref"}可能的解决方案.

## ☤`shell`在提示中没有显示 virtualenv 的名字

这是故意的.您可以使用 shell 插件或聪明的方法自己完成`PS1`组态.如果你真的想要它,请使用

```
pipenv shell -c
```

相反(在 Windows 上不可用).

## ☤Pipenv 不尊重 setup.py 中的依赖项

不,它没有,故意.Pipfile 和 setup.py 用于不同的目的,默认情况下不应该互相考虑.看到`pipfile-vs-setuppy`{.interpreted-text role ="ref"}了解更多信息.

## ☤ 使用`pipenv run`在主管计划中

配置主管程序时`command`同`pipenv run ...`,您需要正确设置区域设置环境变量才能使其正常工作.

在此下添加此行`[supervisord]`部分`/etc/supervisor/supervisord.conf`:

```
[supervisord]
environment=LC_ALL='en_US.UTF-8',LANG='en_US.UTF-8'
```

## ☤ 期间提出异常`Locking dependencies…`

跑`pipenv lock --clear`然后再试一次.锁定序列缓存结果以加速后续运行.如果错误导致格式损坏,缓存可能包含错误结果,即使修复了错误.`--clear`刷新缓存,因此删除了错误的结果.
