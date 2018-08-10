#This is a program is a guessing game 

echo "Hello," $USER". This script will ask you how many files are in the current directory"

endgame=1
actualnumberoffiles=0
numberoffiles=0

if [ -d "$@"]; then
	actualnumberoffiles=$(find "$@" -type f | wc -l)
else
        echo "[ERROR] Please provide a directory."
        exit 1
fi


function IsGuessRight()
{
    checkstatus=1
    echo -n "Guess how many files are in the current directory :? and press Enter   "
    read numberoffiles
    
    if [ $actualnumberoffiles == $numberoffiles ]; then
	echo -n  "Congratulations!!! You guessed it right!"
   	checkstatus=0
    elif [ $actualnumberoffiles -gt $numberoffiles ]; then
        echo -n  "Sorry your guess was too low; try to guess again."
    elif  [ $actualnumberoffiles -lt $numberoffiles ]; then
       echo -n "Sorry your guess was too high; try to guess again."
    else
       echo -n "[ERROR] unrecognised number; try to guess again."
    fi

    return $checkstatus
}



while (($endgame == 1 ))
do
  IsGuessRight
  let endgame=$?
done
