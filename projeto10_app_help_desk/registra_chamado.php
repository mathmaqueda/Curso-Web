<?php

    session_start();

    $titulo = str_replace('#', '-', $_POST['titulo']);
    $categoria = str_replace('#', '-', $_POST['categoria']);
    $descricao = str_replace('#', '-', $_POST['descricao']);

    $texto = $_SESSION['id'] . '#' . $titulo . '#' . $categoria . '#' . $descricao . PHP_EOL; //php_end_of_line

    $arquivo = fopen('arquivo.hd', 'a');
    fwrite($arquivo, $texto);
    fclose($arquivo);

    header('Location: abrir_chamado.php?chamado=OK')
?>