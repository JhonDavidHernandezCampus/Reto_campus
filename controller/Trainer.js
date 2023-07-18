import  Express  from "express";
import conx from './../config/db.js';
const router = Express.Router();

/* 
{
    "id_tra":3,
    "nombre_tra":"Eddy ferrer",
    "email_personal":"Eddy@empresa.com",
    "email_corporativo":"Eddy@empresa.com",
    "telefono_movil":"34345",
    "telefono_residencia":"345345",
    "telefono_empresa":"123123222",
    "telefono_movil_empresarial":"12312312",
}
*/

router.post('/insertar',(req,res)=>{
    let parametros = req.body;
    let query = `INSERT INTO trainer SET ?`;
    conx.query(query,parametros, (err,respuesta,fil)=>{
        if (err) {
            console.log("error al insertar los datos del trainer", err);
            res.send({ "Message": "Error al insertar los datos del trainer", "Error": err });
        } else {
            res.send({ "Status": 200, "Message": "El trainer se a insertado correctamente" })
        }
    });

})





export default router;