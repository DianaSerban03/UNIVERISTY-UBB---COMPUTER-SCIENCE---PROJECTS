package domain;

import java.time.LocalDateTime;
import java.util.Date;

public class Excursie extends Entity<Integer>{
    private String obTuristic;
    private String firmaTransp;
    private LocalDateTime oraPlecare;
    private Double pret;
    private Integer nrLocuri;
    private Integer idExc;

    public Integer getIdExc() {
        return idExc;
    }

    public void setIdExc(Integer idExc) {
        this.idExc = idExc;
    }

    public Excursie(String obTuristic, String firmaTransp, LocalDateTime oraPlecare, Double pret, Integer nrLocuri) {
        this.obTuristic = obTuristic;
        this.firmaTransp = firmaTransp;
        this.oraPlecare = oraPlecare;
        this.pret = pret;
        this.nrLocuri = nrLocuri;
    }

    public String getObTuristic() {
        return obTuristic;
    }

    public void setObTuristic(String obTuristic) {
        this.obTuristic = obTuristic;
    }

    public String getFirmaTransp() {
        return firmaTransp;
    }

    public void setFirmaTransp(String firmaTransp) {
        this.firmaTransp = firmaTransp;
    }

    public LocalDateTime getOraPlecare() {
        return oraPlecare;
    }

    public void setOraPlecare(LocalDateTime oraPlecare) {
        this.oraPlecare = oraPlecare;
    }

    public Double getPret() {
        return pret;
    }

    public void setPret(Double pret) {
        this.pret = pret;
    }

    public Integer getNrLocuri() {
        return nrLocuri;
    }

    public void setNrLocuri(Integer nrLocuri) {
        this.nrLocuri = nrLocuri;
    }
}
