# Do not rename this file.
# 
# Variables:
# ${src}: points to the folder that contains the 'files' directory and this file.
# ${dest}: points to the folder in which the content of 'files' will be copied.

f_before()
{
	# This code is executed before files are copied to the destination.

	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}

f_after()
{
	# This code is executed after the files have been copied to the destination.
	
	# Note that this function must not be completely empty,
	# hence the `return` statement.
	# You can also delete this function if you do not need it.
	return
}