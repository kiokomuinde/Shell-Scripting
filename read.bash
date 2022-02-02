# Get user input for item number then check if it exists
# Getting commandline arguments
inputFile=$1
counter=$2

# Instantiate an iterator to be used for comparison with counter
iterate=0
while read -p "Enter item number: " itemNumber
do
	iterate=$((iterate+1))
	if [[  $iterate == $((counter+1)) ]]; then
		break
	fi
done <$inputFile
if test -f "data/$itemNumber.item"; then

	# Declare a counter n
	n=1
	# Read in file content as two columns to get the differnt variables 
	# in line 1 and two
	# Print the output in command in an organised order
	while IFS=' ' read -r col1 col2
	do
		if [[ $n == 1 ]]; then
			echo -e "\nItem Name: " $col2
			echo "Simple Name: " $col1
			echo "Item Number: " $itemNumber
				
		elif [[ $n == 2 ]]; then
			echo "Qty: " $col1"/"$col2

		elif [[ $n == 3 ]]; then
			echo "Description: $col1 $col2" 
		fi

		n=$((n+1))  
			
	done < "data/$itemNumber.item"
else
	# If the user input doesnt match any file number item is not found
	echo "ERROR: Item not found"

fi
