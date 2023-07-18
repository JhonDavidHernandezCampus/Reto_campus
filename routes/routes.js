import  Express  from "express";
import ControllerInventario from './../controller/Inventario.js';
import ControllerTrainer from './../controller/Trainer.js';
const Routes = Express.Router();

Routes.use('/inventario', ControllerInventario);
Routes.use('/trainer', ControllerTrainer);


export default Routes;