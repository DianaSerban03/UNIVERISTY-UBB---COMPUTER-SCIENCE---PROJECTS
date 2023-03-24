package domain;

public class Client extends Entity<Integer>{
    private String nume;
    private String prenume;
    private Integer telefon;
    private Integer nrBilete;

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    private Integer idClient;

    public Client(String nume, String prenume, Integer telefon, Integer nrBilete) {
        this.nume = nume;
        this.prenume = prenume;
        this.telefon = telefon;
        this.nrBilete = nrBilete;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public Integer getTelefon() {
        return telefon;
    }

    public void setTelefon(Integer telefon) {
        this.telefon = telefon;
    }

    public Integer getNrBilete() {
        return nrBilete;
    }

    public void setNrBilete(Integer nrBilete) {
        this.nrBilete = nrBilete;
    }
}
