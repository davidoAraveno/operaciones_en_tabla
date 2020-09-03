------------------------PARTE1----------------------

-- Crear base de datos posts
    CREATE DATABASE posts;

-- Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido, descripción 
    CREATE TABLE post(
        id SERIAL,
        nombre_usuario VARCHAR(50),
        fecha_creacion DATE,
        contenido VARCHAR(150),
        descripcion VARCHAR(150)
    );

--  Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" 
    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion)
    VALUES('pamela','2020/09/01','Este es un post de prueba para la prueba del desafio latam','la insercion del contenido fue exitoso');

    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion)
    VALUES('pamela','2020/09/01','Este es un post de prueba para la prueba del desafio latam','la insercion del contenido fue exitoso');

    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion)
    VALUES('carlos','2020/09/02','Este es el  post de prueba del usuario carlos, para la prueba del desafio latam','la insercion del contenido de carlos fue exitosa');

--  Modificar la tabla post, agregando la columna título
    ALTER TABLE post ADD COLUMN titulo VARCHAR(30);

--  Agregar título a las publicaciones ya ingresadas 
    UPDATE post SET titulo='primer post de pamela' WHERE id=1;
    UPDATE post SET titulo='segundo post de pamela' WHERE id=2;
    UPDATE post SET titulo='primer post de carlos' WHERE nombre_usuario='carlos';

--  Insertar 2 post para el usuario "Pedro"
    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
    VALUES('pedro','2020/09/03','Este es el primer post del usuario pedro','el primer post de pedro a sido exitoso','primer post de pedro');

    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
    VALUES('pedro','2020/09/03','Este es el primer post del usuario pedro','el primer post de pedro a sido exitoso','primer post de pedro');

-- Eliminar el post de Carlos 
    DELETE FROM post WHERE nombre_usuario='carlos';

--  Ingresar un nuevo post para el usuario "Carlos"
    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
    VALUES('carlos','2020/09/05','Este es el tercer post del usuario carlos','el tercer post de carlos a sido exitoso','tercer post de carlos');

    
    -----------------------------PARTE 2------------------------------------------------

    --  Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts. 
        CREATE TABLE comentarios(
            id SERIAL,
            fecha_hora_creacion TIMESTAMP,
            contenido VARCHAR(150), 
            post_id INT
        );
        ALTER TABLE post ADD PRIMARY KEY (id);
        ALTER TABLE comentarios ADD FOREIGN KEY(post_id) REFERENCES post(id);

    -- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" 
        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/01 13:00:00', 'este es el primer comentario de un post de pamela', 1);

        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/01 13:03:00', 'este es el segundo comentario de un post de pamela', 1);

        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/02 14:03:00', 'este es el primer comentario de un post de carlos', 6);

        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/02 14:03:00', 'este es el segundo comentario de un post de carlos', 6);

        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/03 14:10:00', 'este es el tercer comentario de un post de carlos', 6);

        INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
        VALUES('2020/09/04 12:00:00', 'este es el cuarto comentario de un post de carlos', 6);

-- Crear un nuevo post para "Margarita"
    INSERT INTO post(nombre_usuario,fecha_creacion,contenido,descripcion,titulo)
    VALUES('margarita','2020/09/15','Este es el contenido del primer post de margarita','Esta es la descripcion del primer post de margarita','titulo del post de margarita');

-- Ingresar 5 comentarios para el post de Margarita. 
    INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
    VALUES('2020/09/15 16:00:00','este es el primer comentario del post de margarita',7);

    INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
    VALUES('2020/09/15 16:10:00','este es el seegundo comentario del post de margarita',7);

    INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
    VALUES('2020/09/15 16:13:00','este es el tercer comentario del post de margarita',7);

    INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
    VALUES('2020/09/15 16:15:00','este es el cuarto comentario del post de margarita',7);

    INSERT INTO comentarios(fecha_hora_creacion,contenido,post_id)
    VALUES('2020/09/15 16:17:00','este es el quinto comentario del post de margarita',7);
