# Do not rename this file.
# 
# Variables:
# ${src}: points to the folder that contains the 'files' directory and this file.
# ${dest}: points to the folder in which the content of 'files' will be copied.

f_before()
{
	# This code is executed before files are copied to the destination.
	dest="`pwd`/.test"

	f_include extrafile.txt
	f_include extra\ file\ with\ spaces.txt
	f_include extra\ file\ with\ spaces.txt customname.txt
	f_include extra\ file\ with\ spaces.txt nested/customname.txt
	f_include extra\ file\ with\ spaces.txt nested/custom\ name\ with\ spaces.txt
	f_include extra\ file\ with\ spaces.txt nested\ folder\ with\ spaces/custom\ name\ with\ spaces.txt


	if [[ ! `f_include non-existing-file.txt` ]]; then
		echo "error: expected command to fail:"
		echo "f_include non-existing-file.txt"
		exit 1
	fi

	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}

f_test_file()
{
	# Test that file was copied
	if [[ ! -f "${dest}/${destfile}" ]]; then
		echo "Error: $1: no such file or directory"
		exit 1
	fi
	# Test for correctness of content
	if [[ `diff "${src}/$3/$1" "${dest}/${destfile}"` ]]; then
		echo "Error: test.txt does not contain the expected content."
		echo "Expected:"
		cat "${src}/$3/$1"
		echo "Found:"
		cat "${dest}/${destfile}"
		exit 1
	fi
}

f_test_regular_file() {
	destfile="${2:-$1}"
	f_test_file "$1" "${destfile}" "files"
}

f_test_include_file() {
	destfile="${2:-$1}"
	f_test_file "$1" "${destfile}" "include"
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
	f_test_regular_file ".hiddenfile"
	f_test_include_file "extrafile.txt"
	f_test_include_file "extra file with spaces.txt"
	f_test_include_file "extra file with spaces.txt" "customname.txt"
	f_test_include_file "extra file with spaces.txt" "nested/customname.txt"
	f_test_include_file "extra file with spaces.txt" "nested/custom name with spaces.txt"
	f_test_include_file "extra file with spaces.txt" "nested folder with spaces/custom name with spaces.txt"
	
	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}