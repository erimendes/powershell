$ErrorActionPreference = "Stop"

O que esse comando faz:

$ErrorActionPreference: Esta é uma variável de preferência interna do PowerShell que controla como o PowerShell responde a erros não fatais (erros que não interrompem imediatamente a execução do comando).
=: O operador de atribuição atribui o valor à esquerda à variável à direita.
"Stop": Este é um dos valores possíveis para $ErrorActionPreference. Quando definido como "Stop", qualquer erro não fatal que ocorrer durante a execução de um comando fará com que o script ou o comando pare imediatamente.
Como usar:

No Console:

Abra o PowerShell.
Digite o comando $ErrorActionPreference = "Stop" e pressione Enter.
A partir deste ponto, qualquer erro não fatal fará com que a execução pare.
Em um Script:

Abra o seu arquivo de script .ps1 em um editor de texto (como o Bloco de Notas, VS Code, etc.).
Adicione a linha $ErrorActionPreference = "Stop" no início do seu script (geralmente logo após qualquer bloco param()).
Ao executar o script, se ocorrer um erro não fatal, o script será interrompido naquele ponto.
Por que usar "Stop"?

Definir $ErrorActionPreference como "Stop" é útil quando você quer garantir que o seu script pare imediatamente ao encontrar um erro. Isso é importante em cenários onde a continuação da execução após um erro poderia levar a resultados inesperados, corrupção de dados ou outros problemas.

Outros valores para $ErrorActionPreference:

Além de "Stop", $ErrorActionPreference pode ter outros valores:

Continue (Padrão): Exibe a mensagem de erro e continua a execução.
SilentlyContinue: Não exibe a mensagem de erro e continua a execução.
Ignore: Não exibe a mensagem de erro e tenta continuar a execução (pode levar a comportamentos imprevisíveis).
Inquire: Exibe uma mensagem perguntando se você deseja continuar a execução.
Considerações:

A alteração de $ErrorActionPreference afeta apenas o escopo em que é definida. Se você a definir no console, ela afetará os comandos que você executar naquela sessão. Se você a definir em um script, ela afetará apenas a execução daquele script.
Dentro de um bloco try-catch, o comportamento de $ErrorActionPreference pode ser temporariamente substituído para lidar com erros de forma específica.
Em resumo, para definir $ErrorActionPreference como "Stop", basta usar o comando $ErrorActionPreference = "Stop" no seu script ou diretamente no console do PowerShell. Isso fará com que a execução seja interrompida ao encontrar um erro não fatal.
