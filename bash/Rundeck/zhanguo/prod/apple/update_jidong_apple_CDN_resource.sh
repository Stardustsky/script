version=2.1.0
cdndir=/svn/apple/$version/game_server/htdoc/resource
svn up $cdndir
hot_version=$(awk -F"," '{print $1}' $cdndir/hot_update_file.json|awk -F":" '{print $2}')
hot_file=cdn/hot_version.txt
hot_file_version_old=$(awk -F":" '/hot_version/{print $2}' cdn/hot_version.txt)
echo -e  "\e[33mThe old version is $hot_file_version_old\e[0m"
if [ "$hot_file_version_old" != "$hot_version" ];then
   echo -e "\e[33mThe new version will be updated from $hot_file_version_old to $hot_version\e[0m"
   sudo   sed -i "/hot_version/s/$hot_file_version_old/$hot_version/" $hot_file
fi
cat $hot_file
hot_version_dir=$version.$hot_version
sudo rsync -avz $cdndir/*  --exclude ".svn"    cdn/$hot_version_dir
sudo rsync  -aP  --exclude ".svn/"  cdn/$hot_version_dir       60.191.203.70::applecdn  
