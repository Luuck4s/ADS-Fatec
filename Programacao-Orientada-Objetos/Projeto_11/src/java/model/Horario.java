/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lucas
 */
public class Horario {
    private int horas;
    private int minutos;
    private int segundos;
    
    public Horario(int horas, int minutos, int segundos){
        this.setHoras(horas);
        this.setMinutos(minutos);
        this.setSegundos(segundos);
    }
    
    
    public void setHoras(int horas){
        if(horas > 59){
            this.horas = 59;
        }else if (horas < 0){
            this.horas = 0;
        } else {
            this.horas = horas;
        }
    }
    
    
    public void setMinutos(int minutos){
        if(minutos > 59){
            this.minutos = 59;
        }else if (minutos < 0){
            this.minutos = 0;
        } else {
            this.minutos = minutos;
        }
    }
    
    
    public void setSegundos(int segundos){
        if(segundos > 59){
            this.segundos = 59;
        }else if (segundos < 0){
            this.segundos = 0;
        } else {
            this.segundos = segundos;
        }
    }
    
    public String horarioFormatado(){
        String horasFormatada = String.valueOf(this.horas);
        String minutosFormatado = String.valueOf(this.minutos);
        String segundosFormatado = String.valueOf(this.segundos);
        
        if(this.horas < 10) {
            horasFormatada = "0" + this.horas;
        }
        
        if(this.minutos < 10) {
            minutosFormatado = "0" + this.minutos;
        }
        
        if(this.segundos < 10) {
            segundosFormatado = "0" + this.segundos;
        }
        
        return horasFormatada + ":" + minutosFormatado + ":" + segundosFormatado;
    }
}
