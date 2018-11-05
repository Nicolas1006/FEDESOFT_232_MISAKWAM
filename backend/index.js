'use strict';
const Hapi = require('hapi');
const Inert = require('inert');
const { Pool } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: '129.1.4.223',
    database: 'misakwam',
    password: 'postgres',
    port: 5432
});

const server = new Hapi.Server({
    port: 3000,
    host: 'localhost',
    routes: {
        files: {
            relativeTo: './public'
        },
        cors: true
    }
});

const init = async () => {
    await server.register(Inert);
    server.route({
        method: 'GET',
        path: '/public/{param*}',
        handler: {
            directory: {
                path: '..',
                redirectToSlash: true,
                index: true,
            }
        }
    });
    server.route({
        method: 'GET',
        path: '/',
        handler: (req, res) => {
            return 'Hello, world!';
        }
    });
    server.route({
        method: 'GET',
        path: '/usuarios',
        handler: async (req, res) => {
            try {
                let result = await pool.query('SELECT * FROM usuarios')
                return result.rows;
            } catch (error) {
                console.log(error);
            }
        }
    });
    server.route({
        method: 'POST',
        path: '/usuarios',
        handler: async (req, res) => {
            let body = req.payload;
            try {
                console.log(body);
                let result = await pool.query(
                    'SELECT * FROM usuarios WHERE usuario=$1',
                    [body.usuario]);
                if (result.rowCount == 0) {
                    result = await pool.query(
                        'INSERT INTO usuarios(nombres, apellidos, celular, correo, usuario, contrasena) VALUES ($1, $2, $3, $4, $5, $6)',
                        [body.nombres, body.apellidos, body.celular, body.correo, body.usuario, body.contrasena]);
                    return 'ok';
                } else {
                    return 'Usuario ya exsiste!';
                }
            } catch (error) {
                console.log(error);
                return 'El objeto no esta completo!';
            }
        }
    });
    server.route({
        method: 'POST',
        path: '/login',
        handler: async (req, res) => {
            let body = req.payload;
            try {
                console.log(body);
                let result = await pool.query(
                    'SELECT * FROM usuarios WHERE usuario=$1',
                    [body.usuario]);
                if (result.rowCount == 0) {
                    return 'Usuario o contraseña no existe';
                } else if (body.contrasena != result.rows[0].contrasena) {
                    return 'Usuario o contraseña no existe';
                } else {
                    return 'Ok'
                }
            } catch (error) {
                console.log(error);
                return 'El objeto no esta completo!';
            }
        }
    });
    server.route({
        method: 'DELETE',
        path: '/usuarios',
        handler: async (req, res) => {
            let body = req.payload;
            let resuNlt = await pool.query(
                'DELETE FROM usuarios WHERE id=$1',
                [body.id]);
            return 'Eliminado';
        }
    });
    await server.start();
    console.log(`Server running at: ${server.info.uri}`);
};

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});

init();