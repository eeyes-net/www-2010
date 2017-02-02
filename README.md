# e瞳网首页（2010-2015版）

本版首页最后更新于2015年04月（2015年校运会改版）

## 安装

1. 要求`php >= 5.2 && php <= 5.4`，打开`mysql`扩展
2. 在数据库中执行`tests/install.example.sql`（可以做适当修改），建立所需数据库
3. 根据情况适当修改`Conf/config.php`中的数据库配置和`__PUBLIC__`模板替换的值
4. 正式上线请把`index.php`中的`APP_DEBUG`设置为`false`

## 说明

### 开发

本项目采用`ThinkPHP 3.1`开发，详情请参考相关开发文档。

由于时间较为久远，故直接将框架目录也一同上传

由于每次增加新的具有时效性的功能时的开发人员不同，代码风格不同，也存在诸多代码不规范或出现错误的情况，本归档项目是整理后的代码。

### 访问

本项目只有主页一个页面，访问`/`, `index.php`, `index.php/Index/index`, `index.php?s=/Index/index`（PATHINFO兼容模式）均可

### 伪静态

可以配合`.htaccess`进行`apache`服务器的URL重写构造伪静态页面，（不过因为只有一个主页，没有太大必要），具体操作可以参考`ThinkPHP`官方开发文档

### 数据库

本项目在e瞳网服务器上部署时是读取多个数据库的数据

| Model | 数据库 |
| :--- | :--- |
| New, Ann, Pic | e瞳新闻（使用PHPCMSv9进行数据管理） |
| Lovedv | 爱影视 |
| Know | 交大知道 |

本归档开源项目的示例配置仅使用一个数据库，仅提供相关表的结构

## LICENSE

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)

    Copyright 2010-2015 eeyes.net
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
