# Getting commandline arguments
inputFile=$1
counter=$2

# Instantiate an iterator to be used for comparison with counter
iterate=0
while read -p "Enter item number: " itemNum
do
	iterate=$((iterate+1))
	if [[  $iterate == $((counter+1)) ]]; then
		break
	fi
done <$inputFile
if test -f "data/$itemNum.item"; then
	
	# Declaring simpleName variable
	simpleName=""
	n=1
	while IFS=' ' read -r col1 col2
	do
		if [[ $n == 1 ]]; then

			# Equating simpleName with the first value of the first 
			# line of the file
			simpleName=$col1
			break
		fi
	done < "data/$itemNum.item"

	# Delete the specified file of the user and echo the update accrodingly
	rm data/$itemNum.item
	echo "$simpleName was successfully deleted"
	
	# Get the current date
	date=$(date "+%Y-%m-%d %H:%M:%S")

	# Updating the queries.log file accrodingly
	echo "DELETED: $date - $simpleName" >> data/queries.log
	

else

	# If the inputed file number does not exist notify the user
	echo "ERROR: item not found"
fi