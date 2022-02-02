# Get the item number from user. If it doesnt exists exit 
# the execution for this file
# If it does exist update the contents of the file.

# Getting commandline arguments
inputFile=$1
counter=$2

# Instantiate an iterator to be used for comparison with counter
iterate=0
while read -p "Item number: " itemNum
do
	iterate=$((iterate+1))
	if [[  $iterate == $((counter+1)) ]]; then
		break
	fi
done <$inputFile

if test -f "data/$itemNum.item"; then

	iterate=0

	# User input for the file contents
	# Loop through the file repeatedly to get each of the variables accordingly
	
	# Get simpleName
	while read -p "Simple name: " simpleName
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+2))  ]]; then

			# echo "$simpleName"
			break
		fi
	done <$inputFile
	

	iterate=0

	# Get itemName from file
	while read -p "Item name: " itemName
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+3)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0


	# Get current quantity from file
	while read -p "Current quantity: " currQuant
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+4)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0


	# Get maximum quantity from file
	while read -p "Maximum quantity: " maxQuant 
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+5)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0


	# Get description from file
	while read -p "Description: " descripttion 
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+6)) ]]; then
			break
		fi
	done <$inputFile

	n=1
	while IFS=' ' read -r col1 col2
	do
		if [[ $n == 1 ]]; then

			# if itemNmae was not entered then the item name in 
			# the file becomes the item name
			if test -z "$itemName"; then

				itemName=$col2
			fi

			# If simple name was not entered the simple name from file 
			# becomes the simple name
			if test -z "$simpleName"; then

				simpleName=$col1
			fi
				
		elif [[ $n == 2 ]]; then
			
			# Current quantitity is not updated then the on in the file 
			# becomes the current quantity
			if test -z "$currQuant"; then

				currQuant=$col1
			fi

			# Maximum quantity retains the value from the file if it
			# was not entered by the user
			if test -z "$maxQuant"; then

				maxQuant=$col2
			fi

		elif [[ $n == 3 ]]; then

			# Description is not updated then the value in the file 
			# is retained as description
			if test -z "$description"; then

				description="$col1 $col2"
			fi
			 fi

		n=$((n+1))  
			
	done < "data/$itemNum.item"

	# The values of all the variables are re entered again into the
	# file named item number.
	echo -e $simpleName  $itemName '\n' $currQuant $maxQuant'\n' $description'\n'>data/$itemNum.item
	# Get current date and time.
	date=$(date "+%Y-%m-%d %H:%M:%S")

	# queries.log is updated accordingly.
	echo "UPDATED: $date - $simpleName" >> data/queries.log
else
	# If the inputed file number does not exist notify the user
	echo "ERROR: Item not found"

fi