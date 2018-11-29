.. _diagnose:

经常遇到的Pipenv问题
====================

Pipenv不断被志愿者改进,但仍然是一个资源有限的非常年轻的项目,并且有一些需要处理的怪癖.我们需要每个人的帮助(包括你的帮助!).

以下是人们使用Pipenv的一些常见问题.请看下面,看看他们是否能解决您的问题.

::: {.note} ::: {.admonition-title}注:::

**确保您首先运行最新的Pipenv版本!**:::

☤您的依赖关系无法解决
---------------------

确保你的依赖实际\ *做*\ 解决.如果您对它们充满信心,则可能需要清除解析程序缓存.运行以下命令:

::

   pipenv lock --clear

然后再试一次.

如果这不起作用,请尝试手动删除整个缓存目录.它通常是以下位置之一:

-  ``~/Library/Caches/pipenv``\ (苹果系统)
-  ``%LOCALAPPDATA%\pipenv\pipenv\Cache``\ (视窗)
-  ``~/.cache/pipenv``\ (其他操作系统)

Pipenv不会安装预发行版(即具有alpha / beta /
etc.后缀的版本,例如\ *1.0b1*)
默认情况下.你需要通过\ ``--pre``\ 在您的命令中标记或设置

::

   [pipenv]
   allow_prereleases = true

在你的Pipfile中.

☤没有名为\\ <模块名称的模块>
----------------------------

这通常是将Pipenv与系统包混合的结果.我们\ *非常*\ 建议在隔离的环境中安装Pipenv.卸载所有现有的Pipenv安装,然后查看\ ``installing-pipenv``\ {.interpreted-text
role =“ref”}选择安装Pipenv的推荐方法之一.

☤找不到我的pyenv安装的Python
----------------------------

确保你有\ ``PYENV_ROOT``\ 设置正确.Pipenv仅支持CPython发行版,版本名称如\ ``3.6.4``\ 或类似的.

☤Pipenv不尊重pyenv的全局和本地Python版本
----------------------------------------

Pipenv默认使用安装的Python来创建virtualenv.你可以设置\ ``--python``\ 选项,或\ ``$PYENV_ROOT/shims/python``\ 在选择翻译时让它咨询pyenv.看到\ ``specifying_versions``\ {.interpreted-text
role =“ref”}了解更多信息.

如果您希望Pipenv自动“做正确的事”,您可以设置环境变量\ ``PIPENV_PYTHON``\ 至\ ``$PYENV_ROOT/shims/python``.这将使Pipenv默认使用pyenv的活动Python版本来创建虚拟环境.

.. _unknown-local-diagnose:

☤ValueError:未知语言环境:UTF-8
------------------------------

macOS在其区域设置检测中有一个错误,阻止我们正确检测您的shell编码.如果区域设置变量未指定编码,这也可能是其他系统上的问题.

解决方法是将以下两个环境变量设置为标准本地化格式:

-  ``LC_ALL``
-  ``LANG``

例如,对于Bash,您可以将以下内容添加到您的\ ``~/.bash_profile``:

.. code:: bash

   export LC_ALL='en_US.UTF-8'
   export LANG='en_US.UTF-8'

对于Zsh,要编辑的文件是\ ``~/.zshrc``.

::: {.note} ::: {.admonition-title}注:::

你可以改变两个\ ``en_US``\ 和\ ``UTF-8``\ 部分使用您使用的语言/语言环境和编码.:::

☤/ bin / pip:没有这样的文件或目录
---------------------------------

这可能与您的区域设置有关.看到\ ``unknown-local-diagnose``\ {.interpreted-text
role =“ref”}可能的解决方案.

☤\ ``shell``\ 在提示中没有显示virtualenv的名字
----------------------------------------------

这是故意的.您可以使用shell插件或聪明的方法自己完成\ ``PS1``\ 组态.如果你真的想要它,请使用

::

   pipenv shell -c

相反(在Windows上不可用).

☤Pipenv不尊重setup.py中的依赖项
-------------------------------

不,它没有,故意.Pipfile和setup.py用于不同的目的,默认情况下不应该互相考虑.看到\ ``pipfile-vs-setuppy``\ {.interpreted-text
role =“ref”}了解更多信息.

☤使用\ ``pipenv run``\ 在主管计划中
-----------------------------------

配置主管程序时\ ``command``\ 同\ ``pipenv run ...``,您需要正确设置区域设置环境变量才能使其正常工作.

在此下添加此行\ ``[supervisord]``\ 部分\ ``/etc/supervisor/supervisord.conf``:

::

   [supervisord]
   environment=LC_ALL='en_US.UTF-8',LANG='en_US.UTF-8'

☤期间提出异常\ ``Locking dependencies…``
----------------------------------------

跑\ ``pipenv lock --clear``\ 然后再试一次.锁定序列缓存结果以加速后续运行.如果错误导致格式损坏,缓存可能包含错误结果,即使修复了错误.\ ``--clear``\ 刷新缓存,因此删除了错误的结果.
