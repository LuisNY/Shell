#!/bin/sh

while :
do
echo "Please type one of the following options:"
echo "search, add, edit, remove or quit"
read opt

case $opt in

    search)
        echo "Enter name to look for:"
        read name
        infile=`grep -i $name Book.sh.txt`
        if [ "$infile" = "" ]
        then
            echo "Not found"
        else
            echo "$infile"
        fi
;;

    add)
        echo "Enter name"
        read name
        echo "Enter surname"
        read surname
        echo "Enter phone"
        read phone
        echo "Enter email"
        read email

        emails=`grep -i $email Book.sh.txt`
        phones=`grep -i $phone Book.sh.txt`

        if [ "$emails" = "" ] && [ "$phones" = "" ]
        then
            echo "$name $surname $phone $email" >> "Book.sh.txt"
        else
            echo "User already exists"
        fi
;;

    edit)

        echo "search email of contact to edit"
        read email
        contact=`grep -i $email Book.sh.txt`
        sed -i '' "/$contact/d" /Users/luigi/Desktop/Book.sh.txt

        arr=($contact)

        name="${arr[@]:0:1}"
        surname="${arr[@]:1:1}"
        echo "$name and $surname"

        echo "Enter new phone"
        read phone
        echo "Enter new email"
        read email
        echo "$name $surname $phone $email" >> "Book.sh.txt"
;;

    remove)
        echo "search email of contact to remove"
        read email
        contact=`grep -i $email Book.sh.txt`
        echo "this is the content $contact"
        sed -i '' "/$contact/d" /Users/luigi/Desktop/Book.sh.txt
;;

    quit)
        break;;

    *) echo "option not valid!!!" ;;
esac
done
