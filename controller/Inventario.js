import Express from "express";
import conx from './../config/db.js';
const router = Express.Router();

/* 
{
    "id_inventario":7,
    "fk_id_bloque":12,
    "computadores":12,
    "teclados":12,
    "mouse":12
}
Este enspon loq ue haces es insertar elementos a la tabla inventarios pero si la area ya tiene elementos se los suma
*/


router.post('/insertar', (req, res) => {
    let parametros = req.body;
    //res.send(req.body);
    let query = `SELECT * FROM inventario WHERE fk_id_bloque = ${parametros.fk_id_bloque}`;
    conx.query(query, (err, respuesta, fil) => {
        if (err) {
            console.log("error en la consulta de inventario ", err);
            res.send({ "Message": "Error en la consulta de Inventario", "Error": err });
        } else {
            if (respuesta.length >= 1) {
                respuesta = respuesta[0];
                let queryinsert = `UPDATE inventario SET computadores = ${parametros.computadores + respuesta.computadores},
                                    teclados= ${parametros.teclados + respuesta.teclados},
                                    mouse = ${parametros.mouse + respuesta.mouse} WHERE fk_id_bloque= ${parametros.fk_id_bloque}`;
                conx.query(queryinsert, (err, respuestaupdate, fil) => {
                    if (err) {
                        console.log("error al insertar los datos de inventario ", err);
                        res.send({ "Message": "Error al insertar los datos de Inventario", "Error": err });
                    } else {
                        res.send({ "Status": 200, "Message": "Esta bodega ya contenia elementos asi que se sumaron" })
                    }
                });
            } else {
                parametros = Object.values(parametros);
                console.log(parametros);
                let queryinsert = `INSERT INTO inventario SET ?`;
                conx.query(queryinsert,parametros,(err, respuestaupdate, fil) => {
                    if (err) {
                        console.log(err.errno === 1064);
                        if(err.errno === 1064){
                            res.send({ "Message": "Error, la area con ese id no existe" });
                        }else{
                            console.log("error al insertar los datos de inventario ", err);
                            res.send({ "Message": "Error al insertar los datos de Inventario", "Error": err });
                        }
                    } else {
                        res.send({ "Status": 200, "Message": "Esta bodega no contenia elementos asi se agregaron" })
                    }
                });

            }
        }
    });
})



export default router;