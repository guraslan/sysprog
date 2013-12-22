#!/bin/bash
#
# To lookup a type faster, which basic c type a type is.
#
# eg: ./whichtype.sh size_t
#typedef long int __blksize_t;
#typedef long int __ssize_t;
#typedef __ssize_t ssize_t;
#typedef long unsigned int size_t;
#typedef __blksize_t blksize_t;
#        size_t i;
#
######
# May return multiple lines, at least you can find what you are looking for
# size_t is long unsigned int


type=$1

cat <<EOF > test.c
#include <sys/types.h>

int main(int argc, char* argv[])
{

        $type i;

}

EOF

# let gcc preprocessor do the job
gcc -E test.c | grep "$type"
