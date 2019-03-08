######################################################################################
#################################### SED & REGEX #####################################
######################################################################################

O Sed é um editor de textos não interativo. [S]tream [ED]itor, ou seja, editor de fluxos de texto. 
Ele é case sentive

-> Parâmetros
-i  altera o arquivo
-e  imprime na tela sem alterar o arquivo
-n  faz a supressão, mostra só o resutado do comando
s   substitui um trecho de texto por outro
!   inverte a lógica do comando
;   separador de comandos
|   separador de strings
d   no final deleta
p   no final imprime
g   no final (como se usa o d e p) altera todas as ocorrências
q   sai do sed , não continua o comando

-> Lista completa das classes de caracteres do GNU sed
[[:alnum:]] Alfabéticos e númericos [a-z A-Z 0-9]
[[:alpha:]] Alfabéticos [a-z A-Z]
[[:blank:]] Caractere em branco, espaço ou tab [ \t]
[[:cntrl:]] Caracteres de controle [\x00-\x1F\x7F]
[[:digit:]] Números [0-9]
[[:graph:]] Qualquer caractere visível(ou seja, exceto em branco) [\x20-\x7E]
[[:lower:]] Letras minúsculas [a-z]
[[:upper:]] Letras maiúsculas [A-Z]
[[:print:]] Caracteres visíveis (ou seja, exceto os de controle) [\x20-\x7E]
[[:punct:]] Pontuação [-!”#$%&’()*+,./:;?@[\]_`{	}~].
[[:space:]] Espaço em branco [ \t\r\n\v\f]
[[:xdigit:]] Número hexadecimais [0-9 a-f A-F]

----> Exemplos SED

- Troca todas as palavras em um arquivo por outra
$ sed -i 's/palavra/outra/' arquivo.txt

- Imprime só a nona linha
$ sed -n '9p' arquivo.txt

- Imprime da sexta linha até a nona linha
$ sed -n '6,9p' arquivo.txt

- Deleta todas as linhas que contém a palavra string no arquivos
$ sed -i '/dmx/d' arquivo.txt

- Coloca uma palavra no início de cada linha
$ sed 's/^/palavra/' arquivo.txt

- Coloca uma palavra no final de cada linha
$ sed 's/$/palavra/' arquivo.txt

- Imprime só as linhas que começam com a string 'http'
$ sed -n '/^http/p' arquivo.txt

- Deleta só as linhas que começam com a string 'http'
$ sed -n '/^http/d' arquivo.txt

- Troca todas ocorrências da palavra "marcos", "eric", "camila" pela palavra "pinguim"
$ sed 's/marcos\|eric\|camila/pinguim/g' arquivo.txt

- Troca tudo que estiver ENTRE as palavras “Marcos” e “Eric” pela palavra “eles”, exemplo, o texto é:
“No sábado Marcos saiu de casa pra brincar de bicicleta com o Eric, mas não ficaram até tarde.” 
e ficará assim: “No sábado eles, mas não ficaram até tarde.”

$ sed 's/Marcos.*Eric/eles/' arquivo.txt

- Deleta linha em branco e altera o arquivo
$ sed -i '/^$/d' arquivo.txt

- Substitui “foo” por “bar” somente as linhas que contém “plop”
$ sed '/plop/ s/foo/bar/g' arquivo.txt

- Substitui “foo” por “bar” exceto as linhas que contém “plop”
$ sed '/plop/! s/foo/bar/g' arquivo.txt

- Insere da Linha 2 a linha 7 o “#” no início de cada linha
$ sed '2,7s/^/#/' arquivo.txt

- Insere a palavra ‘NEW’ no início de cada linha, da linha 21 até a linha 28
$ sed -i '21,28s/^/NEW/' arquivo.txt

- Troca tudo entre as tags “” e “” pela palavra “CODIGO” , exemplo de código html:
$ sed 's/.*/CODIGO/' arquivo.txt

- Imprime somente a primeira ocorrência da linha com determinada string
$ sed -n '/dia/{p;q;}' arquivo.txt

- Inclue texto no final da linha 9
$ sed '9s/$/final da linha/' arquivo.txt

- Coloca todas as linhas em uma só
$ sed ':a;$!N;s/\n//;ta;' arquivo.txt

- Substitui a palavra “BELEZA” por “SIM” somente entre determinadas linhas
$ sed '3,6s/BELEZA/SIM/' arquivo.txt

- Apaga o que está entre a palavra “falou” e “segundo” ( delimitadores )
$ sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}' arquivo.txt

- Retira comandos HTML (tudo entre < e > )
$ sed 's/<[^>]*>//g' arquivo.txt

- Apaga o 1o caracter da frase
$ sed 's/.//' arquivo.txt

- Apaga o 4o caractere da frase
$ sed 's/.//4' arquivo.txt

- Apaga os 4 primeiros caracteres
$ sed 's/.\{4\}//' arquivo.txt

- Apaga no mínimo 4 caracteres
$ sed 's/.\{4,\}//' arquivo.txt

- Apaga de 2 a 4 caracteres (o máx. que tiver)
$ sed 's/.\{2,4\}//' arquivo.txt

- Exemplos de intervalo
$ echo "aáeéiíoóuú" | sed "s/[a-u]//g"
    áéíóú
$ echo "aáeéiíoóuú" | sed "s/[á-ú]//g"
    aeiou

- Transforma texto (URL) em tags HTML de links.
Era : http://www.com
Fica: <a href=”http://www.com”>http://www.com</a>
$ sed 's_\<\(ht\|f\)tp://[^ ]*_<a href="&">&</a>_' arquivo.txt

- Expressões Regulares com SED ( sed regex )
Este sed lê dados do arquivo.txt e apaga (comando d) desde a primeira linha, até a linha que contenha 3 números seguidos, jogando o resultado na tela. Se quiser gravar o resultado, redirecione-o para outro arquivo, não o próprio arquivo.txt .
$ sed '1,/[0-9]\{3\}/d' arquivo.txt

- Apagar números
$ s/[0-9]\+//g' arquivo.txt
'
- Imprime só linhas que contém pontuação
$ sed -n '/[[:punct:]]/p' arquivo.txt

- Imprime só linhas que começam com Números
$ sed -n '/^[[:digit:]]/p' arquivo.txt

