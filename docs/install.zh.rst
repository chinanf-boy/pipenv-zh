.. _virtualenvironments-ref:

Pipenv和虚拟环境
================

.. figure:: https://farm3.staticflickr.com/2943/33485660921_dfc0494739_k_d.jpg
   :alt: image

   image

本教程将指导您安装和使用Python包.

它将向您展示如何安装和使用必要的工具,并就最佳实践提出强有力的建议.请记住,Python用于很多不同的目的,而且您希望如何管理依赖项可能会根据您决定发布软件的方式而改变.此处提供的指南最直接适用于网络服务(包括Web应用程序)的开发和部署,但也非常适合管理任何类型项目的开发和测试环境.

::: {.note} ::: {.admonition-title}注:::

本指南是为Python 3编写的,但是,这些指令在Python
2.7上应该可以正常工作—如果你仍在使用它,出于某种原因.:::

☤确保你有Python和pip
--------------------

在继续之前,请确保您拥有Python,并且可以从命令行使用它.你可以通过简单地运行来检查:

::

   $ python --version

你应该得到一些输出\ ``3.6.2``.如果您没有Python,请安装最新的3.x版本\ `python.org <https://python.org>`__\ 或参考\ `Installing
Python <http://docs.python-guide.org/en/latest/starting/installation/>`__\ 部分\ *Hitchhiker的Python指南*.

::: {.note} ::: {.admonition-title}注:::

如果你是新人,你会收到这样的错误:

.. code:: pycon

   >>> python
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   NameError: name 'python' is not defined

这是因为这个命令打算在a中运行\ *贝壳*\ (也称为*终奌站*\ 要么\ *安慰*).请参阅Python
for Beginners\ `getting started
tutorial <https://opentechschool.github.io/python-beginners/en/getting_started.html#what-is-python-exactly>`__\ 介绍如何使用操作系统的shell并与Python交互.:::

此外,您需要确保您有可用的点数.您可以通过运行来检查:

::

   $ pip --version
   pip 9.0.1

如果您从源代码安装了Python,则使用安装程序\ `python.org <https://python.org>`__\ 或通过\ `Homebrew <https://brew.sh>`__\ 你应该已经有点了.如果您使用的是Linux软件包管理器,那么您可能需要这样做\ `install
pip <https://pip.pypa.io/en/stable/installing/>`__\ 分别.

如果您打算使用Homebrew安装Pipenv,可以跳过此步骤.Homebrew安装程序会为您处理点子.

☤安装Pipenv
-----------

Pipenv是Python项目的依赖管理器.如果您熟悉Node.js
\\’\ `npm <https://www.npmjs.com/>`__\ 或Ruby
\\’s\ `bundler <http://bundler.io/>`__,它在精神上与那些工具相似.虽然pip可以安装Python包,但建议使用Pipenv,因为它是一个更高级别的工具,可以简化常见用例的依赖关系管理.

☤Homebrew安装Pipenv
~~~~~~~~~~~~~~~~~~~

Homebrew是一种流行的macOS开源包管理系统.

通过Homebrew安装pipenv将使pipenv及其所有依赖项保持在一个独立的虚拟环境中,因此它不会干扰Python安装的其余部分.

安装完成后\ `Homebrew <https://brew.sh>`__\ 只需运行:

::

   $ brew install pipenv

要随时升级pipenv:

::

   $ brew upgrade pipenv

PiPipenv的实用安装
~~~~~~~~~~~~~~~~~~

如果您正在安装pip,并在用户环境中维护某些“工具链”类型的Python模块作为全局实用程序,请点击\ `user
installs <https://pip.pypa.io/en/stable/user_guide/#user-installs>`__\ 允许安装到您的主目录.请注意,由于依赖项之间的交互,您应该将以这种方式安装的工具限制为Python工作流的基本构建块,如virtualenv,pipenv,tox和类似软件.

安装:

::

   $ pip install --user pipenv

::: {.note} ::: {.admonition-title}注:::

这样做了\ `user
installation <https://pip.pypa.io/en/stable/user_guide/#user-installs>`__\ 防止破坏任何系统范围的包.如果\ ``pipenv``\ 安装后在shell中不可用,你需要添加\ `user
base <https://docs.python.org/3/library/site.html#site.USER_BASE>`__\ 你的二进制目录\ ``PATH``.

在Linux和macOS上,您可以通过运行找到用户库二进制目录\ ``python -m site --user-base``\ 并添加\ ``bin``\ 到最后.例如,这通常会打印出来\ ``~/.local``\ (与``~``\ 扩展到主目录的绝对路径)所以你需要添加\ ``~/.local/bin``\ 到你的\ ``PATH``.你可以设置你的\ ``PATH``\ 永久地\ `modifying
~/.profile <https://stackoverflow.com/a/14638025>`__.

在Windows上,您可以通过运行找到用户库二进制目录\ ``python -m site --user-site``\ 并取代\ ``site-packages``\ 同\ ``Scripts``.例如,这可能会返回\ ``C:\Users\Username\AppData\Roaming\Python36\site-packages``\ 所以你需要设置你的\ ``PATH``\ 包括\ ``C:\Users\Username\AppData\Roaming\Python36\Scripts``.您可以设置您的用户\ ``PATH``\ 永久地在\ `Control
Panel <https://msdn.microsoft.com/en-us/library/windows/desktop/bb776899(v=vs.85).aspx>`__.您可能需要注销\ ``PATH``\ 更改生效.

有关更多信息,请参阅\ `user installs
documentation <https://pip.pypa.io/en/stable/user_guide/#user-installs>`__.:::

要随时升级pipenv:

::

   $ pip install --user --upgrade pipenv

☤Pipenv的原油安装
~~~~~~~~~~~~~~~~~

如果你甚至没有安装pip,你可以使用这个粗略的安装方法,它将引导整个系统:

::

   $ curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python

☤为项目安装包
-------------

Pipenv基于每个项目管理依赖项.要安装软件包,请转到项目目录(或本教程的空目录)并运行:

::

   $ cd myproject
   $ pipenv install requests

皮彭夫将安装优秀\ `Requests <https://python-requests.org>`__\ 库并创建一个\ ``Pipfile``\ 在你的项目目录中为你.该\ ``Pipfile``\ 用于跟踪项目需要重新安装时所需的依赖项,例如与其他人共享项目时.您应该得到与此类似的输出(尽管显示的确切路径会有所不同):

::

   Creating a Pipfile for this project...
   Creating a virtualenv for this project...
   Using base prefix '/usr/local/Cellar/python3/3.6.2/Frameworks/Python.framework/Versions/3.6'
   New python executable in ~/.local/share/virtualenvs/tmp-agwWamBd/bin/python3.6
   Also creating executable in ~/.local/share/virtualenvs/tmp-agwWamBd/bin/python
   Installing setuptools, pip, wheel...done.

   Virtualenv location: ~/.local/share/virtualenvs/tmp-agwWamBd
   Installing requests...
   Collecting requests
     Using cached requests-2.18.4-py2.py3-none-any.whl
   Collecting idna<2.7,>=2.5 (from requests)
     Using cached idna-2.6-py2.py3-none-any.whl
   Collecting urllib3<1.23,>=1.21.1 (from requests)
     Using cached urllib3-1.22-py2.py3-none-any.whl
   Collecting chardet<3.1.0,>=3.0.2 (from requests)
     Using cached chardet-3.0.4-py2.py3-none-any.whl
   Collecting certifi>=2017.4.17 (from requests)
     Using cached certifi-2017.7.27.1-py2.py3-none-any.whl
   Installing collected packages: idna, urllib3, chardet, certifi, requests
   Successfully installed certifi-2017.7.27.1 chardet-3.0.4 idna-2.6 requests-2.18.4 urllib3-1.22

   Adding requests to Pipfile's [packages]...
   P.S. You have excellent taste! ✨ 🍰 ✨

☤使用已安装的软件包
-------------------

现在已经安装了Requests,您可以创建一个简单的\ ``main.py``\ 文件使用它:

.. code:: python

   import requests

   response = requests.get('https://httpbin.org/ip')

   print('Your IP is {0}'.format(response.json()['origin']))

然后您可以使用运行此脚本\ ``pipenv run``:

::

   $ pipenv run python main.py

您应该获得类似于此的输出:

.. code:: text

   Your IP is 8.8.8.8

运用\ ``$ pipenv run``\ 确保您安装的软件包可供您的脚本使用.也可以生成一个新shell,确保所有命令都可以访问已安装的包\ ``$ pipenv shell``.

☤Virtualenv映射警告============

-  Pipenv自动将项目映射到他们特定的virtualenvs.
-  virtualenv全局存储,项目的根目录名称加上项目根目录的完整路径的哈希值(例如,\ ``my_project-a3de50``).
-  如果您更改了项目的路径,则会破坏这样的默认映射,并且pipenv将无法再找到并使用该项目的virtualenv.
-  你可能想要设置\ ``export PIPENV_VENV_IN_PROJECT=1``\ 在.bashrc /
   .zshrc(或任何shell配置文件)中,用于在项目目录中创建virtualenv,避免后续路径更改出现问题.

☤后续步骤
---------

恭喜,您现在知道如何安装和使用Python包!✨🍰✨
