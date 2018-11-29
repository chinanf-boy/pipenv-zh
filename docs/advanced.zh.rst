.. _advanced:

Pipenv的高级用法
================

.. figure:: https://farm4.staticflickr.com/3672/33231486560_bff4124c9a_k_d.jpg
   :alt: image

   image

本文档介绍了Pipenv的一些更为辉煌和先进的功能.

☤警告
-----

-  轮子的依赖性在一个\ ``Pipfile``\ 不会被捕获\ ``$ pipenv lock``.
-  使用与散列相关的私有索引存在一些已知问题.我们正在积极努力解决这个问题.不过,你可能会对此感到非常幸运.
-  安装旨在尽可能确定 - 使用\ ``--sequential``\ 如果遇到问题,请加以标记.

☤指定包索引
-----------

如果您希望使用特定包索引安装特定包,则可以执行以下操作:

::

   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true
   name = "pypi"

   [[source]]
   url = "http://pypi.home.kennethreitz.org/simple"
   verify_ssl = false
   name = "home"

   [dev-packages]

   [packages]
   requests = {version="*", index="home"}
   maya = {version="*", index="pypi"}
   records = "*"

很花哨.

☤使用PyPI镜像
-------------

如果您想使用PyPI镜像的URL覆盖默认的PyPI索引URL,可以使用以下命令:

::

   $ pipenv install --pypi-mirror <mirror_url>

   $ pipenv update --pypi-mirror <mirror_url>

   $ pipenv sync --pypi-mirror <mirror_url>

   $ pipenv lock --pypi-mirror <mirror_url>

   $ pipenv uninstall --pypi-mirror <mirror_url>

或者,您可以设置\ ``PIPENV_PYPI_MIRROR``\ 环境变量.

☤通过环境变量将凭证注入Pipfiles
-------------------------------

Pipenv将在Pipfile中扩展环境变量(如果已定义).如果您需要对私有PyPI进行身份验证,那么非常有用:

::

   [[source]]
   url = "https://$USERNAME:${PASSWORD}@mypypi.example.com/simple"
   verify_ssl = true
   name = "pypi"

幸运的是 -
pipenv将哈希你的Pipfile\ *之前*\ 扩展环境变量(并且,当您从锁定文件安装时,将有助于再次替换环境变量
- 所以不需要提交任何秘密!哇!)☤基本上指定任何东西

如果您要指定仅在某些系统上安装特定软件包,则可以使用
---------------------------------------------------

实现这一目标.\ `PEP 508
specifiers <https://www.python.org/dev/peps/pep-0508/>`__\ 这是一个例子

,这只会安装\ ``Pipfile``\ 在Windows系统上:\ ``pywinusb``\ 瞧!

::

   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true
   name = "pypi"

   [packages]
   requests = "*"
   pywinusb = {version = "*", sys_platform = "== 'win32'"}

这是一个更复杂的例子:

魔法.

::

   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true

   [packages]
   unittest2 = {version = ">=1.0,<3.0", markers="python_version < '2.7.9' or (python_version >= '3.0' and python_version < '3.4')"}

纯粹,纯粹的魔力.

☤使用pipenv进行部署
-------------------

你可能想用\ ``pipenv``\ 作为部署过程的一部分.

你可以强制执行你的\ ``Pipfile.lock``\ 是最新的使用\ ``--deploy``\ 旗:

::

   $ pipenv install --deploy

如果这样做,这将失败\ ``Pipfile.lock``\ 是过时的,而不是生成一个新的.

或者您可以完全按照指定安装包\ ``Pipfile.lock``\ 使用\ ``sync``\ 命令:

::

   $ pipenv sync

::: {.note} ::: {.admonition-title}注:::

``pipenv install --ignore-pipfile``\ 几乎相当于\ ``pipenv sync``\ 但是\ ``pipenv sync``\ 将\ *决不*\ 尝试重新锁定依赖项,因为它被视为原子操作.\ ``pipenv install``\ 默认情况下会尝试重新锁定,除非使用\ ``--deploy``\ 旗.:::

部署系统依赖项
~~~~~~~~~~~~~~

你可以告诉Pipenv用它将Pipfile的内容安装到它的父系统中\ ``--system``\ 旗:

::

   $ pipenv install --system

这对于管理系统Python和部署基础架构(例如Heroku执行此操作)非常有用.

☤Pipenv和其他Python发行版
-------------------------

要将Pipenv与第三方Python发行版(例如Anaconda)一起使用,您只需提供Python二进制文件的路径:

::

   $ pipenv install --python=/path/to/python

Anaconda使用Conda来管理包.要重用Conda安装的Python包,请使用\ ``--site-packages``\ 旗:

::

   $ pipenv --python=/path/to/python --site-packages

☤生成一个\ ``requirements.txt``
-------------------------------

你可以转换一个\ ``Pipfile``\ 和\ ``Pipfile.lock``\ 变成一个\ ``requirements.txt``\ 很容易归档,并获得我们所包含的额外内容和其他好处的所有好处.

我们来看看吧\ ``Pipfile``:

::

   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true

   [packages]
   requests = {version="*"}

并生成一个\ ``requirements.txt``\ 出于它:

::

   $ pipenv lock -r
   chardet==3.0.4
   requests==2.18.4
   certifi==2017.7.27.1
   idna==2.6
   urllib3==1.22

如果你想生成一个\ ``requirements.txt``\ 只有开发要求你也可以这样做!我们采取以下措施\ ``Pipfile``:

::

   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true

   [dev-packages]
   pytest = {version="*"}

并生成一个\ ``requirements.txt``\ 出于它:

::

   $ pipenv lock -r --dev
   py==1.4.34
   pytest==3.2.3

很花哨.

☤检测安全漏洞
-------------

皮彭夫包括\ `safety <https://github.com/pyupio/safety>`__\ 包,并将使用它来扫描您的依赖图以查找已知的安全漏洞!

例:

::

   $ cat Pipfile
   [packages]
   django = "==1.10.1"

   $ pipenv check
   Checking PEP 508 requirements…
   Passed!
   Checking installed package safety…

   33075: django >=1.10,<1.10.3 resolved (1.10.1 installed)!
   Django before 1.8.x before 1.8.16, 1.9.x before 1.9.11, and 1.10.x before 1.10.3, when settings.DEBUG is True, allow remote attackers to conduct DNS rebinding attacks by leveraging failure to validate the HTTP Host header against settings.ALLOWED_HOSTS.

   33076: django >=1.10,<1.10.3 resolved (1.10.1 installed)!
   Django 1.8.x before 1.8.16, 1.9.x before 1.9.11, and 1.10.x before 1.10.3 use a hardcoded password for a temporary database user created when running tests with an Oracle database, which makes it easier for remote attackers to obtain access to the database server by leveraging failure to manually specify a password in the database settings TEST dictionary.

   33300: django >=1.10,<1.10.7 resolved (1.10.1 installed)!
   CVE-2017-7233: Open redirect and possible XSS attack via user-supplied numeric redirect URLs
   ============================================================================================

   Django relies on user input in some cases  (e.g.
   :func:`django.contrib.auth.views.login` and :doc:`i18n </topics/i18n/index>`)
   to redirect the user to an "on success" URL. The security check for these
   redirects (namely ``django.utils.http.is_safe_url()``) considered some numeric
   URLs (e.g. ``http:999999999``) "safe" when they shouldn't be.

   Also, if a developer relies on ``is_safe_url()`` to provide safe redirect
   targets and puts such a URL into a link, they could suffer from an XSS attack.

   CVE-2017-7234: Open redirect vulnerability in ``django.views.static.serve()``
   =============================================================================

   A maliciously crafted URL to a Django site using the
   :func:`~django.views.static.serve` view could redirect to any other domain. The
   view no longer does any redirects as they don't provide any known, useful
   functionality.

   Note, however, that this view has always carried a warning that it is not
   hardened for production use and should be used only as a development aid.

✨🍰✨

::: {.note} ::: {.admonition-title}注:::

为了在保持其许可版权许可的同时启用此功能,pipenv为pyup.io运行的后端Safety
API嵌入了一个API客户端密钥,而不是包含CC-BY-NC-SA许可的Safety-DB数据库的完整副本.所有嵌入式客户端密钥都是共享的pipenv检查用户,因此将受到基于总体使用而非个人客户端使用的API访问限制.

您还可以通过设置环境变量来使用自己的安全API密钥\ ``PIPENV_PYUP_API_KEY``.:::

☤社区整合
---------

有一系列社区维护的插件和扩展可用于一系列编辑器和IDE,以及与Pipenv项目集成的不同产品:

-  `Heroku <https://heroku.com/python>`__\ (云托管)
-  `Platform.sh <https://platform.sh/hosting/python>`__\ (云托管)
-  `PyUp <https://pyup.io>`__\ (安全通知)
-  `Emacs <https://github.com/pwalsh/pipenv.el>`__\ (编辑整合)
-  `Fish
   Shell <https://github.com/fisherman/pipenv>`__\ (自动``$ pipenv shell``!)
-  `VS
   Code <https://code.visualstudio.com/docs/python/environments>`__\ (编辑整合)
-  `PyCharm <https://www.jetbrains.com/pycharm/download/>`__\ (编辑整合)

正在进行的工作:

-  `Sublime
   Text <https://github.com/kennethreitz/pipenv-sublime>`__\ (编辑整合)
-  神秘即将推出的Google Cloud产品(Cloud Hosting)

☤在编辑器中打开一个模块
-----------------------

Pipenv允许您打开任何已安装的Python模块(包括代码库中的模块)\ ``$ pipenv open``\ 命令:

::

   $ pipenv install -e git+https://github.com/kennethreitz/background.git#egg=background
   Installing -e git+https://github.com/kennethreitz/background.git#egg=background…
   ...
   Updated Pipfile.lock!

   $ pipenv open background
   Opening '/Users/kennethreitz/.local/share/virtualenvs/hmm-mGOawwm_/src/background/background.py' in your EDITOR.

这使您可以轻松读取您正在使用的代码,而不是在GitHub上查找.

::: {.note} ::: {.admonition-title}注:::

标准\ ``EDITOR``\ 环境变量用于此.例如,如果你正在使用VS
Code,那么你会想要\ ``export EDITOR=code``\ (如果你在macOS上,你会想要`install
the
command <https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line>`__\ 对你的\ ``PATH``\ 第一).:::

☤自动Python安装
---------------

如果你有\ `pyenv <https://github.com/pyenv/pyenv#simple-python-version-management-pyenv>`__\ 如果您还没有安装和配置,Pipenv会自动询问您是否要安装所需的Python版本.

这是一个非常奇特的功能,我们为此感到非常自豪:

::

   $ cat Pipfile
   [[source]]
   url = "https://pypi.python.org/simple"
   verify_ssl = true

   [dev-packages]

   [packages]
   requests = "*"

   [requires]
   python_version = "3.6"

   $ pipenv install
   Warning: Python 3.6 was not found on your system…
   Would you like us to install latest CPython 3.6 with pyenv? [Y/n]: y
   Installing CPython 3.6.2 with pyenv (this may take a few minutes)…
   ...
   Making Python installation global…
   Creating a virtualenv for this project…
   Using /Users/kennethreitz/.pyenv/shims/python3 to create virtualenv…
   ...
   No package provided, installing all dependencies.
   ...
   Installing dependencies from Pipfile.lock…
   🐍   ❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒ 5/5 — 00:00:03
   To activate this project's virtualenv, run the following:
    $ pipenv shell

皮彭夫自动尊重这两个\ ``python_full_version``\ 和\ ``python_version``
`PEP 508 <https://www.python.org/dev/peps/pep-0508/>`__\ 符.

💫✨🍰✨💫

☤自动加载\ ``.env``
-------------------

如果一个\ ``.env``\ 文件存在于您的项目中,\ ``$ pipenv shell``\ 和\ ``$ pipenv run``\ 将为您自动加载它:

::

   $ cat .env
   HELLO=WORLD⏎

   $ pipenv run python
   Loading .env environment variables…
   Python 2.7.13 (default, Jul 18 2017, 09:17:00)
   [GCC 4.2.1 Compatible Apple LLVM 8.1.0 (clang-802.0.42)] on darwin
   Type "help", "copyright", "credits" or "license" for more information.
   >>> import os
   >>> os.environ['HELLO']
   'WORLD'

这对于将生产凭据保留在代码库之外非常有用.我们不建议提交\ ``.env``\ 文件到源代码控制!

如果你的\ ``.env``\ 文件位于不同的路径或具有您可以设置的不同名称\ ``PIPENV_DOTENV_LOCATION``\ 环境变量:

::

   $ PIPENV_DOTENV_LOCATION=/path/to/.env pipenv shell

防止pipenv加载\ ``.env``\ 文件,设置\ ``PIPENV_DONT_LOAD_ENV``\ 环境变量:

::

   $ PIPENV_DONT_LOAD_ENV=1 pipenv shell

☤自定义脚本快捷方式
-------------------

Pipenv支持在(可选)中创建自定义快捷方式\ ``[scripts]``\ Pipfile的一部分.

然后你就可以跑了\ ``pipenv run <shortcut name>``\ 在您的终端中,即使您尚未首先激活pipenv
shell,也要在pipenv虚拟环境的上下文中运行该命令.

例如,在您的Pipfile中:

::

   [scripts]
   printspam = "python -c \"print('I am a silly example, no one would need to do this')\""

然后在你的终端:

::

   $ pipenv run printspam
   I am a silly example, no one would need to do this

期望参数的命令也可以工作.例如:

::

   [scripts]
   echospam = "echo I am really a very silly example"

   $ pipenv run echospam "indeed"
   I am really a very silly example indeed

☤支持环境变量
-------------

Pipenv支持在值中使用环境变量.例如:

::

   [[source]]
   url = "https://${PYPI_USERNAME}:${PYPI_PASSWORD}@my_private_repo.example.com/simple"
   verify_ssl = true
   name = "pypi"

   [dev-packages]

   [packages]
   requests = {version="*", index="home"}
   maya = {version="*", index="pypi"}
   records = "*"

环境变量可以指定为\ ``${MY_ENVAR}``\ 要么\ ``$MY_ENVAR``.在Windows上,\ ``%MY_ENVAR%``\ 除了支持\ ``${MY_ENVAR}``\ 要么\ ``$MY_ENVAR``.

☤使用环境变量进行配置
---------------------

Pipenv附带了一些可以通过shell环境变量启用的选项.要激活它们,只需在shell中创建变量,pipenv就会检测到它.

::: {.automodule members =""} pipenv.environments :::

如果你想在每个项目的基础上设置这些环境变量,我建议使用梦幻般的\ `direnv <https://direnv.net>`__\ 项目,为了做到这一点.

另请注意\ `pip itself supports environment
variables <https://pip.pypa.io/en/stable/user_guide/#environment-variables>`__,如果您需要额外的自定义.

例如:

::

   $ PIP_INSTALL_OPTION="-- -DCMAKE_BUILD_TYPE=Release" pipenv install -e .

☤自定义虚拟环境位置
-------------------

皮彭夫自动表彰\ ``WORKON_HOME``\ 环境变量,如果你设置了—所以你可以告诉pipenv在你想要的任何地方存储你的虚拟环境,例如:

::

   export WORKON_HOME=~/.venvs

另外,你也可以让Pipenv坚持使用virtualenv\ ``project/.venv``\ 通过设置\ ``PIPENV_VENV_IN_PROJECT``\ 环境变量.

☤测试项目
---------

Pipenv正在被用于像\ `Requests <https://github.com/kennethreitz/requests>`__\ 用于声明开发依赖项和运行测试套件.

我们目前正在测试两者的部署\ `Travis-CI <https://travis-ci.org/>`__\ 和\ `tox <https://tox.readthedocs.io/en/latest/>`__\ 成功.

特拉维斯CI
~~~~~~~~~~

可以在中找到Travis
CI设置示例\ `Requests <https://github.com/kennethreitz/requests>`__.该项目使用Makefile来定义常用函数,例如它\ ``init``\ 和\ ``tests``\ 命令.这是一个精简的例子\ ``.travis.yml``:

::

   language: python
   python:
       - "2.6"
       - "2.7"
       - "3.3"
       - "3.4"
       - "3.5"
       - "3.6"
       - "3.7-dev"

   # command to install dependencies
   install: "make"

   # command to run tests
   script:
       - make test

和相应的Makefile:

::

   init:
       pip install pipenv
       pipenv install --dev

   test:
       pipenv run py.test tests

Tox自动化项目
~~~~~~~~~~~~~

或者,您可以配置一个\ ``tox.ini``\ 像本地和外部测试一样:

::

   [tox]
   envlist = flake8-py3, py26, py27, py33, py34, py35, py36, pypy

   [testenv]
   deps = pipenv
   commands=
       pipenv install --dev
       pipenv run py.test tests

   [testenv:flake8-py3]
   basepython = python3.4
   commands=
       pipenv install --dev
       pipenv run flake8 --version
       pipenv run flake8 setup.py docs project test

Pipenv将自动使用由提供的virtualenv\ ``tox``.如果\ ``pipenv install --dev``\ 安装,例如\ ``pytest``,然后安装命令\ ``py.test``\ 将出现在给定的virtualenv中,可以直接调用\ ``py.test tests``\ 代替\ ``pipenv run py.test tests``.

您可能还想添加\ ``--ignore-pipfile``\ 至\ ``pipenv install``,以免在每次测试运行时意外修改锁文件.这会导致Pipenv忽略对其的更改\ ``Pipfile``\ (更重要的是)阻止它添加当前环境``Pipfile.lock``.这可能很重要,因为当前环境(即由tox提供的virtualenv)通常包含当前项目(可能需要或可能不需要)以及其他依赖项.\ ``tox``\\的\ ``deps``\ 指示.或者,可以通过添加来禁用初始供应\ ``skip_install = True``\ 到tox.ini.

此方法要求您明确更新锁文件,这在任何情况下都可能是个好主意.

第三方插件,\ `tox-pipenv <https://tox-pipenv.readthedocs.io/en/latest/>`__\ 也可以将Pipenv本身与tox一起使用.

☤壳牌完工
---------

要在fish中启用完成,请将其添加到您的配置中:

::

   eval (pipenv --completion)

或者,使用bash或zsh,将其添加到您的配置中:

::

   eval "$(pipenv --completion)"

Magic shell完成现已启用!

✨🍰✨

☤使用平台提供的Python组件
-------------------------

对于操作系统接口的平台特定Python绑定来说,仅通过系统包管理器可用,因此无法安装到虚拟环境中果仁.在这些情况下,可以通过访问系统来创建虚拟环境站点包-目录:

::

   $ pipenv --three --site-packages

确保所有果仁 -
可安装组件实际安装到虚拟环境中,系统包仅用于根本不参与Python级依赖项解析的接口,使用PIP_忽视_INSTALLED设置:

::

   $ PIP_IGNORE_INSTALLED=1 pipenv install --dev

.. _pipfile-vs-setuppy:

☤Pipfilevs setup.py
-------------------

在它们之间有一个微妙但非常重要的区别\ **应用**\ 和\ **图书馆**.这是Python社区中非常常见的混淆源.

库为其他库和应用程序提供了可重用的功能(让我们使用总称\ **项目**\ 这里).他们需要与其他库一起工作,所有库都有自己的子依赖关系.他们定义\ **抽象依赖**.为了避免项目中不同库的子依赖项中的版本冲突,库永远不应该固定依赖版本.虽然它们可能指定较低或(较不频繁)的上限,但如果它们依赖于某些特定的功能/修复/错误.库依赖项通过指定\ ``install_requires``\ 在\ ``setup.py``.

图书馆最终意味着在某些人中使用\ **应用**.应用程序的不同之处在于它们通常不依赖于其他项目.它们应该部署到某个特定的环境中,然后才能使所有依赖项和子依赖项的确切版本具体化.为了使这个过程更容易,目前是Pipenv的主要目标.

总结一下:

-  对于库,定义\ **抽象依赖**\ 通过\ ``install_requires``\ 在\ ``setup.py``.确定要安装哪个版本以及从何处获取该依赖关系的决定不属于您!
-  对于应用程序,定义\ **依赖关系以及从何处获取它们**\ 在里面Pipfile并使用此文件更新集合\ **具体的依赖**\ 在\ ``Pipfile.lock``.此文件定义了一个已知适用于您的项目的特定幂等环境.该\ ``Pipfile.lock``\ 是你的真相来源.该\ ``Pipfile``\ 您可以方便地创建该锁文件,因为它允许您对要使用的依赖项的确切版本保持一定的模糊.Pipenv可以帮助您定义一组无冲突的特定依赖版本,否则这将是一项非常繁琐的任务.
-  当然,\ ``Pipfile``\ 和Pipenv对于库开发人员仍然有用,因为它们可用于定义开发或测试环境.
-  当然,还有一些项目,图书馆和应用程序之间的区别并不明确.在那种情况下,使用\ ``install_requires``\ 与皮彭夫和\ ``Pipfile``.

你也可以这样做:

::

   $ pipenv install -e .

这将告诉Pipenv锁定你所有的\ ``setup.py``- 声明的依赖关系.

☤更改Pipenv的缓存位置
---------------------

您可以通过设置环境变量强制Pipenv使用不同的缓存位置\ ``PIPENV_CACHE_DIR``\ 到你想要的位置.这在您要更改的相同情况下很有用\ ``PIP_CACHE_DIR``\ 到另一个目录.

☤更改默认Python版本
-------------------

默认情况下,Pipenv将使用python3的任何版本的python初始化项目.除了开始一个项目与\ ``--three``\ 要么\ ``--two``\ 旗帜,你也可以使用\ ``PIPENV_DEFAULT_PYTHON_VERSION``\ 指定在启动项目时使用的版本\ ``--three``\ 要么\ ``--two``\ 没用过.
