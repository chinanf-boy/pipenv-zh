# Pipenv 的基本用法

![image](https://farm4.staticflickr.com/3931/33173826122_b7ee8f1a26_k_d.jpg)

本文档介绍了 Pipenv 的一些基本功能.

## 目录

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [☤Pipfile 和 Pipfile.lock 示例](#%E2%98%A4pipfile-%E5%92%8C-pipfilelock-%E7%A4%BA%E4%BE%8B)
- [☤ 一般建议和版本控制](#%E2%98%A4-%E4%B8%80%E8%88%AC%E5%BB%BA%E8%AE%AE%E5%92%8C%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)
- [☤ 示例 Pipenv 工作流程](#%E2%98%A4-%E7%A4%BA%E4%BE%8B-pipenv-%E5%B7%A5%E4%BD%9C%E6%B5%81%E7%A8%8B)
- [☤ 示例 Pipenv 升级工作流](#%E2%98%A4-%E7%A4%BA%E4%BE%8B-pipenv-%E5%8D%87%E7%BA%A7%E5%B7%A5%E4%BD%9C%E6%B5%81)
- [☤ 从 requirements.txt 导入](#%E2%98%A4-%E4%BB%8E-requirementstxt-%E5%AF%BC%E5%85%A5)
- [☤ 指定包的版本](#%E2%98%A4-%E6%8C%87%E5%AE%9A%E5%8C%85%E7%9A%84%E7%89%88%E6%9C%AC)
- [☤ 指定 Python 的版本](#%E2%98%A4-%E6%8C%87%E5%AE%9A-python-%E7%9A%84%E7%89%88%E6%9C%AC)
- [☤ 可编辑的依赖关系(例如`-e .`)](#%E2%98%A4-%E5%8F%AF%E7%BC%96%E8%BE%91%E7%9A%84%E4%BE%9D%E8%B5%96%E5%85%B3%E7%B3%BB%E4%BE%8B%E5%A6%82-e-)
- [by Pipenv 的环境管理](#by-pipenv-%E7%9A%84%E7%8E%AF%E5%A2%83%E7%AE%A1%E7%90%86)
- [☤ 关于 Shell 配置](#%E2%98%A4-%E5%85%B3%E4%BA%8E-shell-%E9%85%8D%E7%BD%AE)
- [☤ 关于 VCS 依赖关系的注释](#%E2%98%A4-%E5%85%B3%E4%BA%8E-vcs-%E4%BE%9D%E8%B5%96%E5%85%B3%E7%B3%BB%E7%9A%84%E6%B3%A8%E9%87%8A)
- [☤Pipfile.lock 安全功能](#%E2%98%A4pipfilelock-%E5%AE%89%E5%85%A8%E5%8A%9F%E8%83%BD)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ☤Pipfile 和 Pipfile.lock 示例

:::

### 示例 Pipfile

```
[[source]]
url = "https://pypi.python.org/simple"
verify_ssl = true
name = "pypi"

[packages]
requests = "*"


[dev-packages]
pytest = "*"
```

### 示例 Pipfile.lock

```
{
    "_meta": {
        "hash": {
            "sha256": "8d14434df45e0ef884d6c3f6e8048ba72335637a8631cc44792f52fd20b6f97a"
        },
        "host-environment-markers": {
            "implementation_name": "cpython",
            "implementation_version": "3.6.1",
            "os_name": "posix",
            "platform_machine": "x86_64",
            "platform_python_implementation": "CPython",
            "platform_release": "16.7.0",
            "platform_system": "Darwin",
            "platform_version": "Darwin Kernel Version 16.7.0: Thu Jun 15 17:36:27 PDT 2017; root:xnu-3789.70.16~2/RELEASE_X86_64",
            "python_full_version": "3.6.1",
            "python_version": "3.6",
            "sys_platform": "darwin"
        },
        "pipfile-spec": 5,
        "requires": {},
        "sources": [
            {
                "name": "pypi",
                "url": "https://pypi.python.org/simple",
                "verify_ssl": true
            }
        ]
    },
    "default": {
        "certifi": {
            "hashes": [
                "sha256:54a07c09c586b0e4c619f02a5e94e36619da8e2b053e20f594348c0611803704",
                "sha256:40523d2efb60523e113b44602298f0960e900388cf3bb6043f645cf57ea9e3f5"
            ],
            "version": "==2017.7.27.1"
        },
        "chardet": {
            "hashes": [
                "sha256:fc323ffcaeaed0e0a02bf4d117757b98aed530d9ed4531e3e15460124c106691",
                "sha256:84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
            ],
            "version": "==3.0.4"
        },
        "idna": {
            "hashes": [
                "sha256:8c7309c718f94b3a625cb648ace320157ad16ff131ae0af362c9f21b80ef6ec4",
                "sha256:2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
            ],
            "version": "==2.6"
        },
        "requests": {
            "hashes": [
                "sha256:6a1b267aa90cac58ac3a765d067950e7dbbf75b1da07e895d1f594193a40a38b",
                "sha256:9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
            ],
            "version": "==2.18.4"
        },
        "urllib3": {
            "hashes": [
                "sha256:06330f386d6e4b195fbfc736b297f58c5a892e4440e54d294d7004e3a9bbea1b",
                "sha256:cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
            ],
            "version": "==1.22"
        }
    },
    "develop": {
        "py": {
            "hashes": [
                "sha256:2ccb79b01769d99115aa600d7eed99f524bf752bba8f041dc1c184853514655a",
                "sha256:0f2d585d22050e90c7d293b6451c83db097df77871974d90efd5a30dc12fcde3"
            ],
            "version": "==1.4.34"
        },
        "pytest": {
            "hashes": [
                "sha256:b84f554f8ddc23add65c411bf112b2d88e2489fd45f753b1cae5936358bdf314",
                "sha256:f46e49e0340a532764991c498244a60e3a37d7424a532b3ff1a6a7653f1a403a"
            ],
            "version": "==3.2.2"
        }
    }
}
```

## ☤ 一般建议和版本控制

- 一般来说,保持两者`Pipfile`和`Pipfile.lock`在版本控制中.
- 不要保持`Pipfile.lock`在版本控制中,如果目标是多个版本的 Python.
- 在您的指定中指定目标 Python 版本[Pipfile]{.title 伪-REF} \\的`[requires]`部分.理想情况下,您应该只有一个目标 Python 版本,因为这是一个部署工具.
- `pipenv install`完全兼容`pip install`语法,可以找到完整的文档[here](https://pip.pypa.io/en/stable/user_guide/#installing-packages).

## ☤ 示例 Pipenv 工作流程

克隆/创建项目存储库:

```
$ cd myproject
```

从 Pipfile 安装,如果有的话:

```
$ pipenv install
```

或者,将包添加到新项目中:

```
$ pipenv install <package>
```

这将创建一个`Pipfile`如果一个人不存在如果确实存在,将使用您提供的新包自动编辑它.

接下来,激活 Pipenv shell:

```
$ pipenv shell
$ python --version
```

这将生成一个新的 shell 子进程,可以通过使用来停用它`exit`.

## ☤ 示例 Pipenv 升级工作流

- 找出上游的变化:`$ pipenv update --outdated`.
-

```
Upgrade packages, two options:

:   a.  Want to upgrade everything? Just do `$ pipenv update`.
    b.  Want to upgrade packages one-at-a-time?
        `$ pipenv update <pkg>` for each outdated package.
```

## ☤ 从 requirements.txt 导入

如果你只有一个`requirements.txt`运行时可用的文件`pipenv install`,pipenv 会自动导入这个文件的内容并创建一个`Pipfile`为了你.

您也可以指定`$ pipenv install -r path/to/requirements.txt`导入需求文件.

如果您的需求文件固定了版本号,您可能需要编辑新版本号`Pipfile`删除那些,并让`pipenv`跟踪钉扎.如果你想保留固定版本`Pipfile.lock`现在,跑`pipenv lock --keep-outdated`.确保[upgrade](#initialization)不久!

## ☤ 指定包的版本

您可以使用指定包的版本[Semantic Versioning
scheme](https://semver.org/)(即`major.minor.micro`).

例如,要安装请求,您可以使用::

```
$ pipenv install requests~=1.2   # equivalent to requests~=1.2.0
```

Pipenv 将安装版本`1.2`和任何小的更新,但不是`2.0`.

这将更新您的`Pipfile`自动反映这一要求.

通常,Pipenv 使用与 pip 相同的说明符格式.但请注意,根据[PEP
440](%3Chttps://www.python.org/dev/peps/pep-0440/%3E),你不能使用包含连字符或加号的版本.

要进行包容性或独占版本比较,您可以使用::

```
$ pipenv install "requests>=1.4"   # will install a version equal or larger than 1.4.0
$ pipenv install "requests<=2.13"  # will install a version equal or lower than 2.13.0
$ pipenv install "requests>2.19"   # will install 2.19.1 but not 2.19.0
```

::: {.note} ::: {.admonition-title}注:::

指某东西的用途`" "`围绕包和版本规范强烈建议避免问题[Input and output
redirection](https://robots.thoughtbot.com/input-output-redirection-in-the-shell)在基于 Unix 的操作系统中.:::

指某东西的用途`~=`优先于`==`标识符作为前者阻止 pipenv 更新包:

```
$ pipenv install "requests~=2.2"  # locks the major version of the package (this is equivalent to using ==2.*)
```

为避免安装特定版本,您可以使用`!=`标识符.

有关有效标识符的深入解释和更复杂的用例检查[the relevant section of
PEP-440](https://www.python.org/dev/peps/pep-0440/#version-specifiers%3E).

## ☤ 指定 Python 的版本

要创建一个新的 virtualenv,使用您已安装的特定版本的 Python(以及您的`PATH`), 使用`--python VERSION`旗帜,像这样:

使用 Python 3:

```
$ pipenv --python 3
```

使用 Python3.6:

```
$ pipenv --python 3.6
```

使用 Python 2.7.14:

```
$ pipenv --python 2.7.14
```

当给出像这样的 Python 版本时,Pipenv 会自动扫描你的系统以找到与给定版本匹配的 Python.

如果一个`Pipfile`尚未创建,将为您创建一个,如下所示:

```
[[source]]
url = "https://pypi.python.org/simple"
verify_ssl = true

[dev-packages]

[packages]

[requires]
python_version = "3.6"
```

::: {.note} ::: {.admonition-title}注:::

包含`[requires] python_version = "3.6"`指定您的应用程序需要此版本的 Python,并在运行时自动使用`pipenv install`对此`Pipfile`将来(例如在其他机器上).如果不是这样,请随意删除此部分.:::

如果你没有在命令行上指定 Python 版本,那么`[requires]` `python_full_version`要么`python_version`将自动选择,回退到系统的默认值`python`安装是在执行时.

## ☤ 可编辑的依赖关系(例如`-e .`)

您可以告诉 Pipenv 将路径安装为可编辑的路径 - 在处理包时,这通常对当前工作目录很有用:

```
$ pipenv install --dev -e .

$ cat Pipfile
...
[dev-packages]
"e1839a8" = {path = ".", editable = true}
...
```

::: {.note} ::: {.admonition-title}注:::

所有子依赖项都将添加到`Pipfile.lock`同样.子依赖是**不**加入了`Pipfile.lock`如果你离开了`-e`选择出来.:::

## by Pipenv 的环境管理

您将在管理 pipenv 环境时使用的三个主要命令是`$ pipenv install`,`$ pipenv uninstall`,和`$ pipenv lock`.

### \\ \$ pipenv install

`$ pipenv install`用于将包安装到 pipenv 虚拟环境中并更新 Pipfile.

与基本安装命令一起,采用以下形式:

```
$ pipenv install [package names]
```

用户可以提供以下附加参数:

> - `--two`---使用系统在 virtualenv 中执行安装`python2`链接.
> - `--three`---使用系统在 virtualenv 中执行安装`python3`链接.
> - `--python`---使用提供的 Python 解释器在 virtualenv 中执行安装.
>
> ::: {.警告} ::: {.admonition-title}警告:::
>
> 以上命令均不应同时使用.他们也是**有害**并且会在用适当的版本替换之前删除当前的 virtualenv.:::
>
> ::: {.note} ::: {.admonition-title}注:::
>
> Pipenv 创造的 virtualenv 可能与您的期望不同.危险字符(即`` $`!*@" ``以及空格,换行,回车和制表符)都转换为下划线.此外,当前文件夹的完整路径被编码为"slug 值"并附加以确保 virtualenv 名称是唯一的.:::
>
> - `--dev`---安装两者`develop`和`default`来自的包裹`Pipfile`.
> - `--system`---使用系统`pip`命令而不是你的 virtualenv 中的命令.
> - `--ignore-pipfile`---忽略了`Pipfile`并从安装`Pipfile.lock`.
> - `--skip-lock`---忽略了`Pipfile.lock`并从安装`Pipfile`.另外,不要写出来`Pipfile.lock`反映变化`Pipfile`.

### \\ \$ pipenv uninstall

`$ pipenv uninstall`支持所有参数[pipenv
install](#pipenv-install),以及两个额外的选择,`--all`和`--all-dev`.

> - `--all`---此参数将清除虚拟环境中的所有文件,但保持 Pipfile 不变.
> - `--all-dev`---此参数将从虚拟环境中删除所有开发包,并从 Pip 文件中删除它们.

### \\ \$ pipenv lock

`$ pipenv lock`用来创建一个`Pipfile.lock`,宣布**所有**项目的依赖项(和子依赖项),它们的最新可用版本以及下载文件的当前哈希值.这确保了可重复性,最重要的是*确定性*,构建.

## ☤ 关于 Shell 配置

壳通常配置错误,因为子壳使用`$ pipenv shell --fancy`可能产生意外的结果.如果是这种情况,请尝试`$ pipenv shell`,使用"兼容模式",尽管配置错误,仍会尝试生成子 shell.

正确的 shell 配置只设置环境变量,如`PATH`在登录会话期间,而不是在每个子 shell 生成期间(因为它们通常配置为执行).在鱼中,这看起来像这样:

```
if status --is-login
    set -gx PATH /usr/local/bin $PATH
end
```

你也应该为你的 shell 做这个`~/.profile`要么`~/.bashrc`或在适当的地方.

::: {.note} ::: {.admonition-title}注:::

shell 以交互模式启动.这意味着如果您的 shell 从特定文件中读取其配置以进行交互模式(例如,bash 默认查找 a`~/.bashrc`交互模式的配置文件),然后您需要修改(或创建)此文件.:::

如果您遇到问题`$ pipenv shell`,检查一下`PIPENV_SHELL`环境变量,哪个`$ pipenv shell`将使用如果可用.有关详情,请参阅`configuration-with-environment-variables`{.interpreted-text role ="ref"}.

## ☤ 关于 VCS 依赖关系的注释

您可以使用根据以下规则格式化的 URL 从 git 和其他版本控制系统安装 pipenv 包:

```
<vcs_type>+<scheme>://<location>/<user_or_organization>/<repository>@<branch_or_tag>#egg=<package_name>
```

唯一可选的部分是`@<branch_or_tag>`部分.通过 SSH 使用 git 时,您可以使用速记 vcs 和 scheme 别名`git+git@<location>:<user_or_organization>/<repository>@<branch_or_tag>#<package_name>`.请注意,这被翻译成`git+ssh://git@<location>`解析时.

请注意它是**强力推荐**您可以使用在可编辑模式下安装任何版本控制的依赖项`pipenv install -e`,以确保每次执行时都可以使用存储库的最新副本执行依赖项解析,并且它包含所有已知的依赖项.

以下是安装位于的 git 存储库的示例用法`https://github.com/requests/requests.git`来自标签`v2.20.1`作为包名`requests`:

```
$ pipenv install -e git+https://github.com/requests/requests.git@v2.20.1#egg=requests
Creating a Pipfile for this project...
Installing -e git+https://github.com/requests/requests.git@v2.20.1#egg=requests...
[...snipped...]
Adding -e git+https://github.com/requests/requests.git@v2.20.1#egg=requests to Pipfile's [packages]...
[...]

$ cat Pipfile
[packages]
requests = {git = "https://github.com/requests/requests.git", editable = true, ref = "v2.20.1"}
```

有效值`<vcs_type>`包括`git`,`bzr`,`svn`,和`hg`.有效值`<scheme>`包括`http`,`https`,`ssh`,和`file`.在特定情况下,您还可以访问其他方案:`svn`可以结合使用`svn`作为一个计划,和`bzr`可以结合使用`sftp`和`lp`.

您可以阅读有关 pip 的 VCS 支持实现的更多信息[here](https://pip.pypa.io/en/stable/reference/pip_install/#vcs-support).有关指定 VCS 依赖关系时可用的其他选项的更多信息,请查看[Pipfile
spec](https://github.com/pypa/pipfile).

## ☤Pipfile.lock 安全功能

`Pipfile.lock`利用了一些重要的新安全性改进`pip`.默认情况下`Pipfile.lock`将使用每个下载包的 sha256 哈希生成.这将允许`pip`保证您在受感染的网络上安装您想要的内容,或者从不受信任的 PyPI 端点下载依赖项.

我们强烈建议通过将项目从开发环境升级到生产来实现部署.您可以使用`pipenv lock`编译您的开发环境的依赖项并部署已编译的`Pipfile.lock`在所有生产环境中进行可重现的构建.
