#!/bin/bash
<<project
project

echo "1.sign_up
2.sign-in
3.Exit"
var=1

read -p "Enter the choice : " choice

case $choice in
    1)while [ $var -eq 1 ]
        do
            var=0
            read -p "Enter the username :" name
            arr_name=(`cat name.csv`)
            for i in ${arr_name[@]}
            do
                if [ $i = $name ]
                then
                    echo "username already exists"
                    var=1
                    break
                fi
            done
        done
        flag=1
        while [ $flag -eq 1 ]
        do
            read -p "Enter the password : " pass1
            read -p "Enter the confirm password : " pass
            if [ $pass1 != $pass ]
            then
                echo "Password mismatch"
            else
                flag=0
            fi
        done
        
        echo $name >> name.csv
        echo $pass >> password.csv
        echo "Sign up Successfully completed"
    ;;
    
    2) flag=1
        while [ $flag -eq 1 ]
        do
            flag=0
            read -p "enter username :" name
            read -p "enter paswword :" pass
            username=(`cat name.csv`)
            password=(`cat password.csv`)
            y=`expr ${#username[@]} - 1`
            for i in $(seq 0 $y)
            do
                if [ $name = ${username[$i]} ]
                then
                    if [ $pass = ${password[$i]} ]
                    then
                        echo "sign in successfully"
                    else
                        echo "invalid user id or password"
                        echo
                        flag=1
                        break
                    fi
                fi
                
            done
        done
    ;;
    3) exit
    ;;
esac