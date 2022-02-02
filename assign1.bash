#!/bin/bash
# Getting commandline arguments
inputFile=$1
n=1

# Initializing a counter
countIn=1
# user menu for entering the choices of their preference
while read -p "Enter one of the following actions or press CTRL-D to exit: " choice
do
	if [[ $n == $countIn ]]; then		
	
		if [[ "$choice" == "C" || "$choice" == "c" ]]; then

			# calling create file for execution and pasing inputfile as argument
			# together with a counter number count in
			bash create.bash $inputFile $n

			# update counter number
			countIn=$((countIn+7));

		elif [[ "$choice" == "R" || "$choice" == "r" ]]; then
			
			# calling create file for execution and pasing inputfile as argument
			# together with a counter number count in
			bash read.bash $inputFile $n

			# update counter
			countIn=$((countIn+2));
		elif [[ "$choice" == "U" || "$choice" == "u" ]]; then

			# calling create file for execution and pasing inputfile as argument
			# together with a counter number count in
			bash update.bash $inputFile $n

			# Update counter
			countIn=$((countIn+7));
		elif [[ "$choice" == "D" || "$choice" == "d" ]]; then
			
			# calling create file for execution and pasing inputfile as argument
			# together with a counter number count in
			bash delete.bash $inputFile $n

			# Update counter
			countIn=$((countIn+2));
		else

			# instructions for invalid choice input
			echo "Invalid choice"
		fi
	
	fi
		# increament n
		n=$((n+1))

	
done<$inputFile