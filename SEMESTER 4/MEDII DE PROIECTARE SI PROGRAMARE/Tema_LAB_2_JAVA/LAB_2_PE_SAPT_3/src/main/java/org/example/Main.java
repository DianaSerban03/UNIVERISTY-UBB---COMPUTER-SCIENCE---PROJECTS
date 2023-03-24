package org.example;

import domain.Angajat;
import domain.Client;
import domain.Excursie;
import repository.AngajatRepoBD;
import repository.ClientiRepoBD;
import repository.ExcursieRepoBD;

import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Properties;

public class Main {
    public static void main(String[] args) {

        Properties props=new Properties();
        try {
            props.load(new FileReader("bd.config"));
        } catch (IOException e) {
            System.out.println("Cannot find bd.config "+e);
        }

        AngajatRepoBD angRepo = new AngajatRepoBD(props);
        angRepo.save(new Angajat("m3", "mmmmm"));
//        angRepo.delete("m1");
//        System.out.println("Toti angajatii din bd");
//        for (Angajat a:angRepo.findAll())
//            System.out.println(a);

//        ClientiRepoBD cliRepo = new ClientiRepoBD(props);
//       // cliRepo.save(new Client("a", "b", 145456, 12));
//        Client c = new Client("z", "z", 1234, 1);
//        c.setIdClient(2);
//        cliRepo.update(c);
//
//        ExcursieRepoBD excRepo = new ExcursieRepoBD(props);
//        excRepo.save(new Excursie("a", "a", LocalDateTime.of(2023, 3, 15, 10, 30), 12.5, 1));
    }
}