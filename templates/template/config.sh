# Do not rename this file.

# If necessary, make any changes to 
f_before()
{
	f_ask templatename "Enter template name:"

	# If dest was not set explicitly, set it to the default location.
	if [[ -z ${dest} ]]; then
		dest=${template_path}/${templatename}/
		echo "Storing template in default location ${dest}"
	fi
}

f_after()
{
	# create `files` folder in ${dest}.
	# You may ask why I didn't simply add an empty `files`
	# folder to the `files` directory of the `template` template?
	# Because you cannot add empty directories to git repos, that's why.
	mkdir -p ${dest}/files
	
	cat <<EOF
You can now specify which files should be created whenever
you spawn a new '${templatename}' project.
Leave this blank to skip this step.
EOF
	f_ask template_files "Specify path to template files:"
	if [[ -n ${template_files} ]]; then
		cp -R ${template_files}/* ${dest}/files/
	fi

	cat <<EOF
Template creation completed.
You can now edit the template files located in 
	${dest}files/
and add custom code for this template by editing
	${dest}config.sh

EOF

}