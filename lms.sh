#!/usr/bin/bash

#This is a bot that can be used to run WTC lms commands
#The bot currently assumes you are already logged in to lms
condition=true
while true
do
	echo "do you want to see problems,modules,reviews"
	read choice
	if [ $choice == "quit" ];
	then
		break
	elif [ $choice != "reviews" ];
	then
		wtc-lms $choice
	fi
	if [ $choice == "reviews" ];
	then
		echo "Do you want to accept or grade a review"
		read to_do
		if [ $to_do == "accept" ];
		then
			wtc-lms reviews |grep "Invited"
			if [ $? -eq 0 ];
			then	
				echo "Which project do you want to view"
				read view_project
				wtc-lms review_details $view_project
				while true
				do
					echo "Do you want to accept review[yes/no]"
					read review_accept
					if [ $review_accept == "yes" ] || [ $review_accept == "no" ];
					then
						break
					fi
				done
				if [ $review_accept == "yes" ];
				then
					wtc-lms accept $view_project
				fi
			else
				echo "There are no projects to accept at the moment"
			fi
		elif [ $to_do == "grade" ];
		then
			wtc-lms reviews |grep "Assigned"
			echo "Which project do you want to view"
			read view_project
			wtc-lms review_details $view_project
			echo "Add review comment"
			read review_comment
			wtc-lms add_comment $view_project "$review_comment"
			echo "Add grade"
			read review_grade
			wtc-lms grade_review $view_project $review_grade
		fi
	elif [ $choice == "modules" ];
	then
		echo "Which module to you want to view"
		read module_name
		wtc-lms topics $module_name
		echo "Which topic do you want to view problems for"
		read topic_name
		wtc-lms problems $topic_name
	fi
done
