param($tipoDeExportacao)

# $tipoDeExportacao = "HTML"

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
	gci -Recurse -File |
		? Name -like "*inventario*" |
		select $params

		
if ($tipoDeExportacao -eq "HTML") {
	$estilos = Get-Content c:\dev\styles.css
	$styleTag = "<style> $estilos </style>"
	$tituloPagina = "Relatorio de Scripts em Migracao"
	$tituloBody = "<h1> $tituloPagina </h1>"

	$resultado |
		ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody  |
		Out-File c:\dev\relatorio.html	
} elseif ($tipoDeExportacao -eq "JSON") {
	$resultado |
		ConvertTo-JSON |
		Out-File c:\dev\relatorio.json
} elseif ($tipoDeExportacao -eq "CSV") {
	$resultado |
		ConvertTo-CSV -NoTypeInformation |
		Out-File c:\dev\relatorio.csv
} else {
    Write-Warning "Tipo de exportação '$tipoDeExportacao' não suportado. As opções são: HTML, JSON, CSV."
    Write-Host "Nenhum arquivo foi gerado."
}
		
		


		
		
		
		
		
		
		
		
		
		
		
