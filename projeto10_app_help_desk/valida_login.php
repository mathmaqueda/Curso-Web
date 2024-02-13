<?php
    session_start();

    $usuario_autenticado = false;
    $usuario_id = null;
    $usuario_perfil_id = 

    $perfis = array(1 => 'Administrativo', 2 => 'Usuário');

    $usuarios_app = array(
        array('email' => 'adm@teste.com.br', 'senha' => '1234', 'id' => 1, 'perfil_id' => 1),
        array('email' => 'user@teste.com.br', 'senha' => '1234', 'id' => 2, 'perfil_id' => 1),
        array('email' => 'jose@teste.com.br', 'senha' => '1234', 'id' => 3, 'perfil_id' => 2),
        array('email' => 'maria@teste.com.br', 'senha' => '1234', 'id' => 4, 'perfil_id' => 2),
    );

    foreach ($usuarios_app as $user) {
        
        if ($user['email'] == $_GET['email'] && $user['senha'] == $_GET['senha']) {
            $usuario_autenticado = true;
            $usuario_id = $user['id'];
            $usuario_perfil_id = $user['perfil_id'];
        }

    }
    if ($usuario_autenticado) {
        $_SESSION['autenticado'] = true;
        $_SESSION['id'] = $usuario_id;
        $_SESSION['perfil_id'] = $usuario_perfil_id;
        header('location: home.php');
    } else {
        header('location: index.php?login=erro');
        $_SESSION['autenticado'] = false;
    }

?>