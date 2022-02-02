# Get user input for item number. If the item already exists exit this file.
# If it doesnt userproceeds with feeding data to the new filemacthing that item number.

# Getting commandline arguments
inputFile=$1
counter=$2

# Instantiate an iterator to be used for comparison with counter
iterate=0

# Get item number from file
while read -p "Item number: " itemNum
do
	iterate=$((iterate+1))
	if [[  $iterate == $((counter+1)) ]]; then

		break
	fi
done <$inputFile

if test -f "data/$itemNum.item"; then

	echo "Item number already exists"
else

	iterate=0

	# User input for the file contents

	# Get simpleName from the input file
	while read -p "Simple name: " simpleName
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+2))  ]]; then

			break
		fi
	done < $inputFile
	

	iterate=0

	# Get item name from input file
	while read -p "Item name: " itemName
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+3)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0

	# Get current quantity from the input file
	while read -p "Current quantity: " currQuant
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+4)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0

	# Get maximum quantity froom the input file
	while read -p "Maximum quantity: " maxQuant 
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+5)) ]]; then
			break
		fi
	done <$inputFile
	iterate=0


	# Get Description from the input file
	while read -p "Description: " descripttion 
	do
		iterate=$((iterate+1))
		if [[ $iterate == $((counter+6)) ]]; then
			break
		fi
	done <$inputFile

	# Create a file and feed it with the user input
	echo -e $simpleName  $itemName '\n' $currQuant $maxQuant'\n' $descripttion '\n'> "data/$itemNum.item"
	
	# Get the current date
	date=$(date "+%Y-%m-%d %H:%M:%S")

	# update the queries.log file accordingly
	echo "CREATED: $date - $simpleName" >> data/queries.log
fi