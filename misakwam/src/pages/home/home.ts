import { Component } from '@angular/core';
import { NavController, AlertController } from 'ionic-angular';
import { AmigosPage } from '../amigos/amigos';
import { AuthProvider } from '../../providers/auth/auth';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  usuario = {
    usuario:'',
    contrasena:''
  }

  constructor(
    public navCtrl: NavController,
    public auth:AuthProvider,
    private alertCtrl: AlertController) {}

  login() {
    this.auth.login(this.usuario).subscribe((data)=>{
      if(data=="Ok"){
        this.navCtrl.push(AmigosPage);
      } else {
        let alert = this.alertCtrl.create({
          title: 'Error',
          subTitle: data,
          buttons: ['ok']
        });
        alert.present();
      }
    });
  }

}
