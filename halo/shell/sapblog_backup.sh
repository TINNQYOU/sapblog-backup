#!/bin/bash
gitpath=/home/halo/github/sapblog-backup
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始同步文件夹"
rsync -av --delete /home/halo/.halo/ /home/halo/github/sapblog-backup/halo/ > /dev/null &
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 文件夹同步完成"
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 开始推送到Github"
cd $gitpath
git add .
git commit -m "[$(date "+%Y-%m-%d %H:%M:%S")] 博客数据备份"
git push
echo "[$(date "+%Y-%m-%d %H:%M:%S")] 推送到GitHub完成"

