/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Lieu;

/**
 *
 * @author G A S I M I A R O
 */
public class Lieu {
    private String codelieu;
    private String Designation;
    private String Province;
    
    public Lieu(){}
    
    public Lieu(String codelieu, String Designation, String Province){
        this.codelieu = codelieu;
        this.Designation = Designation;
        this.Province = Province;
    }
 
public void setCodelieu(String codelieu) {
    this.codelieu = codelieu;
}

public String getCodelieu() {
    return codelieu;
}

    
    public void setDesignation(String Designation){
        this.Designation = Designation;
    }
    public String getDesignation(){
        return Designation;
    }
    
    public void setProvince(String Province){
        this.Province = Province;
    }
    public String getProvince(){
        return Province;
    }
    
    @Override
    public String toString(){
        return "Personne [id="+ codelieu + ", Designation="+Designation+", Province="+Province;
    }
}

