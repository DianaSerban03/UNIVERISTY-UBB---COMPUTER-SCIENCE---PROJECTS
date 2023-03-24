package repository;

import domain.Client;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class ClientiRepoBD implements IClienti{
    private JdbcUtils dbUtils;



    private static final Logger logger= LogManager.getLogger();

    public ClientiRepoBD(Properties props){
        logger.info("Initializing ClientiRepoBD with properties: {} ",props);
        dbUtils=new JdbcUtils(props);
    }

    @Override
    public Iterable<Client>findAll(){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Client> clienti = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Client")){
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String nume = resultSet.getString("nume");
                    String prenume = resultSet.getString("prenume");
                    Integer nrBilete = resultSet.getInt("nr_bilete");
                    Integer telefon = resultSet.getInt("telefon");
                    Integer id = resultSet.getInt("id_client");
                    Client client = new Client(nume, prenume, telefon, nrBilete);
                    client.setIdClient(id);
                    clienti.add(client);
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(clienti);
        return clienti;
    }

    @Override
    public Client findOne(Integer id){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Client>clienti = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Client where id_client = ?")){
            preSmt.setInt(1, id);
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String nume = resultSet.getString("nume");
                    String prenume = resultSet.getString("prenume");
                    Integer nrBilete = resultSet.getInt("nr_bilete");
                    Integer telefon = resultSet.getInt("telefon");
                    Client client = new Client(nume, prenume, telefon, nrBilete);
                    return client;
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(clienti);
        return null;
    }

    @Override
    public void save(Client client){
        logger.traceEntry("saving task{} ", client);
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("insert into Client (nume, prenume, nr_bilete, telefon) values (?,?, ?, ?)")){
            preStmt.setString(1, client.getNume());
            preStmt.setString(2,client.getPrenume());
            preStmt.setLong(3,client.getNrBilete());
            preStmt.setLong(4,client.getTelefon());
            int result=preStmt.executeUpdate();
            logger.trace("Saved {} instances", result);
        } catch(SQLException ex){
            logger.error(ex);
            System.err.println("Error DB " + ex);
        }
        logger.traceExit();
    }

    @Override
    public void delete(Integer id){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        Client client = this.findOne(id);
        try(PreparedStatement preStmt=con.prepareStatement("delete from Client where id_client = (?)")){
            preStmt.setInt(1,id);
            int result=preStmt.executeUpdate();
            logger.trace("Deleted {} instances", result);
        } catch(SQLException ex){
            logger.error(ex);
            System.err.println("Error DB " + ex);
        }
        logger.traceExit();
    }

    @Override
    public Client update(Client entity)
    {
        Client c = this.findOne(entity.getIdClient());
        if(c == null)
            return entity;
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("update Client set nume = (?), prenume=(?), nr_bilete=(?), telefon=(?) where id_client = (?)")){
            preStmt.setString(1, entity.getNume());
            preStmt.setString(2, entity.getPrenume());
            preStmt.setLong(3, entity.getNrBilete());
            preStmt.setLong(4, entity.getTelefon());
            preStmt.setInt(5, entity.getIdClient());
            int result=preStmt.executeUpdate();
            logger.trace("Updated {} instances", result);
        } catch(SQLException ex){
            logger.error(ex);
            System.err.println("Error DB " + ex);
        }
        logger.traceExit();

        return null;
    }

}
