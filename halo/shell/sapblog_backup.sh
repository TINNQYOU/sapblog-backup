#!/bin/bash
gitpath=/home/halo/github/sapblog-backup
changeslog=/home/halo/logs/changeslistcount
rsync -anv --delete /home/halo/.halo/ /home/halo/github/sapblog-backup/halo/ > $changeslog
count=`wc -l $changeslog | awk '{print $1}'`
if [ $count -eq 4 ] 
then
	echo "<==================没有修改的内容======================>"
	exit 0
fi

echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始同步文件夹"
rsync -av --delete /home/halo/.halo/ /home/halo/github/sapblog-backup/halo/ > /dev/null &
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 文件夹同步完成"
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始推送到Github"
cd $gitpath
git add .
git commit -m "[$(date "+%Y-%m-%d %H:%M:%S")] 博客数据备份"
git push
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 推送到GitHub完成"
echo "<======================================================>"
