/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upds.compilador;

import com.upds.compilador.analisis.parser;
import com.upds.compilador.analisis.scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.StringReader;

/**
 *
 * @author ismaelc
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       try {
            String texto=" Public void  Metodo1(int j, char c){\n print(\"hola mundo\"); \n Int x=5;\n } ";
            System.out.println("Inicia el analisis...\n");
            scanner scan = new scanner(new BufferedReader( new StringReader(texto)));
            parser parser = new parser(scan);
            parser.parse();
            System.out.println("Finaliza el analisis...");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
}
