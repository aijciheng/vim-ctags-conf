# vim-ctags-conf
## 简单的ctags配置
1.生成系统库的tags <br>
2.生成当前路径下的tags <br>
3.规范工作目录下的依赖其他项目的tags <br>
4.当前工作目录下保存代码后自动更新tags <br>

<br>

### 文件说明:
.vimrc-将里面的内容放置到~/.vimrc尾部即可 <br>
work_dir_demo-实际编写代码时的根目录，该目录下应该存放两个文件dep_tags和tags <br>
dep_tags-依赖的第三方项目(或之前自己已编写好的项目)的tags文件路径(一般系统的tags路径设置在~/.vimrc) <br>
tags-设置空文件即可 <br>
gen_systags.sh-生成系统的tags到~/.vim/systags <br>
gen_tags.sh-在当前目录下生成tags,可方便用于生成第三方项目(或之前自己已编写好的项目)的tags <br>
