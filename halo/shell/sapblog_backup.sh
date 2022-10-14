#!/bin/bash
gitpath=/home/halo/github/sapblog-backup
filename=sapblogs-$(date "+%Y-%m-%d-%H-%M-%S").tar.gz

rsync -av --delete /home/halo/.halo/ /home/halo/github/sapblog-backup/halo/
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始备份博客数据"
cd $gitpath
tar -czvf $filename /home/halo/.halo/ > /dev/null &
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 数据压缩完成"
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始推送到Github"
git add .
git commit -m "[$(date "+%Y-%m-%d %H:%M:%S")] 博客数据备份"
#git push origin master
git push
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 推送到GitHub完成"

