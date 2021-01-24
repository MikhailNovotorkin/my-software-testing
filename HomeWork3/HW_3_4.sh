#/!bin/bash
options=( # объявляется массив
	'1'
	"2"
	'3'
	'4'
	'5'
)
echo 'Please choose an option' # выводится сообщение
select input in "${options[@]}"; do # оператор выбора из предложенных вариантов
	case "$input" in # начало набора вариантов
		"${options[0]}") # опция 1 печатает в стандартный вывод содержимое текущего каталога.
			ls
			;;
		"${options[1]}") # опция 2 печатает в стандартный вывод текущее время и дату
			date $'+Time: %T\nDate: %D'
			;;
		"${options[2]}") # опция 3
			read -p 'What file do you wish to check? ' finput # принимает значение с ввода в finput и выводит в стандартный вывод сообщение (приглашение)
			if [[ -d $finput ]]; then # в опции 3 после приёма ввода запускается цикл if. Если во вводе указана директория
				format='%s is a directory.\n' # создается сообщение, что это директория
			elif [[ -f $finput ]]; then # если в вводе файл
				format='%s is a file.\n' # создается сообщение, что это файл
			else
				format='%s does not exist.\n' # если в текущей директории нет содержимого с названием из ввода, создается сообщение, что содержимое с таким именем не существует.
			fi # цикл завершается
			printf "$format" "$finput" # и сообщение выводится в стандартный вывод
			;;
		"${options[3]}") # опция 4
			read -p 'Please enter filename: ' binput # принимает значение с ввода в binput и выводит в стандартный вывод сообщение (приглашение)
			cp "$binput"{,.bak} # а затем создает копию указанного файла, добавив расширение .bak
			;;
		"${options[4]}") # опция 5
			break # вызывает завершение скрипта
			;;
		*)
			echo 'Not a valid option.' # это сообщение выводится, если в введенный номер варианта не содержится в массиве
			;;
	esac # конец набора вариантов
done # закрытие оператора select