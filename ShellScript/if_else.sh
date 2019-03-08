######################################################################################
################################## Exemplos Scripts ##################################
######################################################################################

#!/bin/bash

if [ "$#" -gt 0 ]
then
    echo "There's Beans"
fi

if [ "$1" = "cool" ]
then
echo "Cool Beans"
fi

_______________________________________________________________________________________

#!/bin/bash

if [ "$1" = "cool" ]
then
    echo "Cool Beans"
else
    echo "Not Cool Beans"
fi

_______________________________________________________________________________________

#!/bin/bash

if [ "$1" = "cool" ]
then
    echo "Cool Beans"
elif [ "$1" = "neat" ]
then
    echo "Neato cool"
else
    echo "Not Cool Beans"
fi

_______________________________________________________________________________________

#!/bin/bash

if [ -f "$1" ]
then
    echo "$1 is a file"
else
    echo "$1 is not a file"
fi

_______________________________________________________________________________________

String Comparison	Description
Str1 = Str2	        Returns true if the strings are equal
Str1 != Str2	    Returns true if the strings are not equal
-n Str1	            Returns true if the string is not null
-z Str1	            Returns true if the string is null

Numeric Comparison	Description
expr1 -eq expr2	    Returns true if the expressions are equal
expr1 -ne expr2	    Returns true if the expressions are not equal
expr1 -gt expr2	    Returns true if expr1 is greater than expr2
expr1 -ge expr2	    Returns true if expr1 is greater than or equal to expr2
expr1 -lt expr2	    Returns true if expr1 is less than expr2
expr1 -le expr2	    Returns true if expr1 is less than or equal to expr2
! expr1	            Negates the result of the expression

File Conditionals	Description
-d file	            True if the file is a directory
-e file	            True if the file exists (note that this is not particularly portable, thus -f is generally used)
-f file	            True if the provided string is a file
-g file	            True if the group id is set on a file
-r file	            True if the file is readable
-s file	            True if the file has a non-zero size
-u	                True if the user id is set on a file
-w	                True if the file is writable
-x	                True if the file is an executable

Operadores para números     Description
    -lt	                    Verifica se é menor
    -gt	                    Verifica se é maior
    -le	                    Verifica se é menor ou igual
    -ge	                    Verifica se é maior ou igual
    -eq	                    Verifica se é igual
    -ne                 	Verifica se é diferente

Operadores para Texto	    Usa-se ” ” caso utilizar valor
    -n	                    Verifica se não é nula
    -z	                    Verifica se é nula
    !=	                    Verifica se é diferente
    =	                    Verifica se é igual

Operador para logica        Description
    !	                    Logica NOT ou NÃO
    -o	                    Logica OU, (OR) ou ||
    -a                  	Logica E, (AND) ou &&

Operador para arquivos/diretórios       Description
    -d	                                Verifica se é diretório
    -f                              	Verifica se é arquivo
    -e                              	Verifica se existe
    -O                              	Verifica se o dono do arquivo é o usuário que esta executando
    -s                                 	Verifica se o arquivo não esta vazio
    -L                              	Verifica se é um link-simbólico
    -r                              	Verifica se o usuário tem permissão de leitura
    -w                              	Verifica se o usuário tem permissão de gravação
    -x                              	Verifica se o usuário tem permissão de execução
    -nt                             	Verifica se é mais recente
    -ot                                	Verifica se é mais antigo
    -ef                             	Verifica se é igual
    