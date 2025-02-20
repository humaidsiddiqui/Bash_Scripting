#error handling in shell script
#!/bin/bash

create_directory(){
        mkdir demo
}
if ! create_directory; then
        echo "the code is being exited as the directory already exists"
        exit 1
fi

echo "this should not work because the code is interrupted"
# this line will not be printed because the code is exited in the function
# the code will exit in the function because the directory already exists

