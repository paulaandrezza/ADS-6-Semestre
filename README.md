# ADS-6-Semestre

Código para criar arquivos fácil

```
for ($i = 1; $i -le 6; $i++) {
    $fileName = "Atividade{0:D2}.js" -f $i
    New-Item -Path $fileName -ItemType File -Force
}
```
