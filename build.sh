ch = "chinese"
if [! -x "$ch" ]; then
	mkdir "$ch"
	echo 'chinese文件夹不存在，创建chinese文件夹'
else
	rm -rf chinese
	echo '清理chinese下所有的字体成功！'
fi

echo '开始拷贝系统字体文件/usr/share/fonts到容器...'
cp -r /usr/share/fonts/chinese chinese/
echo '拷贝系统字体文件/usr/share/fonts到容器成功！'

echo '开始构建docker镜像...'
docker build -t lmtoo/documentserver .
echo '镜像构建完成！'
