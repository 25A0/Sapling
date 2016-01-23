# Do not rename this file.
# 
# Variables:
# ${src}: points to the folder that contains the 'files' directory and this file.
# ${dest}: points to the folder in which the content of 'files' will be copied.

f_before()
{
	# This code is executed before files are copied to the destination.
	dest="`pwd`/.test"


	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}

f_test_regular_file()
{
	# Test that file was copied
	if [[ ! -f "${dest}/$1" ]]; then
		echo "Error: $1: no such file or directory"
		exit 1
	fi
	# Test for correctness of content
	if [[ `diff "${src}/files/$1" "${dest}/$1"` ]]; then
		echo "Error: test.txt does not contain the expected content."
		echo "Expected:"
		cat "${src}/files/$1"
		echo "Found:"
		cat "${dest}/$1"
		exit 1
	fi
}

f_after()
{
	# This code is executed after the files have been copied to the destination.
	
	# Test that ${dest} was successfully changed in f_before
	if [[ "${dest}" != "`pwd`/.test" ]]; then
		echo "Error: dest variable was not changed in f_before"
		exit 1
	fi
	f_test_regular_file "test.txt"
	f_test_regular_file "filename with spaces.txt"
	
	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}