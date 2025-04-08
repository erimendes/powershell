param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("HTML", "JSON", "CSV")]
    [string]$tipoDeExportacao
)

$ErrorActionPreference = "Stop"

<#
    Aqui a gente cria um hashtable para a coluna de nome
#>
$nameExpr = @{
    Label="Nome";
    Expression= { $_.Name }
}

# Tambem montamos um hashtable. Só que esse daqui é pro Tamanho
$lengthExpr = @{
    Label="Tamanho";
    Expression= { "{0:N2}KB" -f ($_.Length / 1KB) }
}

# Basta usar uma vírgula e nos temos um array
$params = $nameExpr, $lengthExpr

$resultado =
    Get-ChildItem -Recurse -File |
        Where-Object {$_.Name -like "*test*"} |
        Select-Object $params

if ($tipoDeExportacao -eq "HTML") {
    $estilos = Get-Content c:\temp\styles.css
    $styleTag = "<style> $estilos </style>"
    $tituloPagina = "Relatorio de Scripts em Migracao"
    $tituloBody = "<h1> $tituloPagina </h1>"

    $resultado |
        ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody |
        Out-File c:\temp\relatorio.html
} elseif ($tipoDeExportacao -eq "JSON") {
    $resultado |
        ConvertTo-Json |
        Out-File c:\temp\relatorio.json
} elseif ($tipoDeExportacao -eq "CSV") {
    $resultado |
        ConvertTo-Csv -NoTypeInformation |
        Out-File c:\temp\relatorio.csv
}
