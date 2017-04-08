S=4
while getopts ":S:" option; do
        case $option in
                S) S=$OPTARG ;;
                *) ;;
        esac
done
shift $(($OPTIND -1))

for i ; do
	echo -n $i " "
	python /mnt/data/prog/tools/segment.py -i $i -S $S -area
done | sed -e "s/^.*_//" -e "s/\.jpg//"

