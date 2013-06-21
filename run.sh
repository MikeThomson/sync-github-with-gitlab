config = "config"

if [ ! -f "$config" ]; then
	touch "$config"
	echo "github_username=''" >> $config
	echo "github_password=''" >> $config
	echo "github_namespace=''" >> $config
	echo "Need to setup your config file. A placeholder was created for you."
else
	source "$config_file"
fi

path=$1
folder=${path##*/}
name=${folder%.*}
json="{\"name\":\"$name\"}"
curl -u $github_username:$github_password https://api.github.com/user/repos -d $json
echo "git push --mirror git@github.com:$github_namespace/$folder" > $path/hooks/post-update
chmod +x $path/hooks/post-update

# TODO: probably should check if the project exists before creating it.
# exists=`curl -u $github_username:$github_password https://api.github.com/repos/$github_namespace/$project_name | jsawk 'return this.message'`
