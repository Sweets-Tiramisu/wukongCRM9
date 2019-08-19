要想省时省力省心的把本项目发布起来，请求仔细阅读本文档！！

项目发布说明：
	1.72crm-java-master文件夹为项目源码，crm9为项目编译之后的文件夹（可直接运行）
	2.仔细阅读\CRM\72crm-java-master目录下的README.md，了解项目详情
	3.项目环境搭建：
		jdk1.8
		mysql数据库
		redis非关系型数据库
	4.把\CRM\crm9目录下的crm72.sql导入数据库，分别修改“项目源码”和“编译后项目”config目录下的crm9-config.txt中的连接信息
	5.解压redis2.8win32.zip，点击“redis-server.exe”启动redis非关系型数据库
	6.以管理员身份打开cmd，windows系统下执行\CRM\crm9目录下执行72crm.bat（linux:执行72crm.sh），运行项目
	7.在浏览器输入http://localhost:8080，访问项目，用户名：admin（或者zhuan） 密码：123456
------------------------------------------------------------------------------------------------------------
       注意修改此依赖
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
        </dependency>