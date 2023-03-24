package repository;

import domain.Angajat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class AngajatRepoBD implements IAngajat {

    private JdbcUtils dbUtils;



    private static final Logger logger= LogManager.getLogger();

    public AngajatRepoBD(Properties props){
        logger.info("Initializing AngajatRepoBD with properties: {} ",props);
        dbUtils=new JdbcUtils(props);
    }
    @Override
    public Iterable<Angajat>findAll(){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Angajat> angajati = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Angajat")){
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String username = resultSet.getString("username");
                    String password = resultSet.getString("password");
                    Angajat angajat = new Angajat(username, password);
                    angajati.add(angajat);
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(angajati);
        return angajati;
    }

    @Override
    public Angajat findOne(String username){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Angajat>angajati = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Angajat where username = ?")){
            preSmt.setString(1, username);
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String password = resultSet.getString("password");
                    Angajat angajat = new Angajat(username, password);
                    return angajat;
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(angajati);
        return null;
    }

    @Override
    public void save(Angajat angajat){
        logger.traceEntry("saving task{} ", angajat);
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("insert into Angajat (username, password) values (?,?)")){
            preStmt.setString(1,angajat.getUsername());
            preStmt.setString(2,angajat.getPassword());
            int result=preStmt.executeUpdate();
            logger.trace("Saved {} instances", result);
        } catch(SQLException ex){
            logger.error(ex);
            System.err.println("Error DB " + ex);
        }
        logger.traceExit();
    }
    @Override
    public void delete(String username){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        Angajat angajat = this.findOne(username);
        try(PreparedStatement preStmt=con.prepareStatement("delete from Angajat where username = (?)")){
            preStmt.setString(1,username);
            int result=preStmt.executeUpdate();
            logger.trace("Deleted {} instances", result);
        } catch(SQLException ex){
            logger.error(ex);
            System.err.println("Error DB " + ex);
        }
        logger.traceExit();
    }

    @Override
    public Angajat update(Angajat entity)
    {
        Angajat account = this.findOne(entity.getUsername());
        if(account == null)
            return entity;
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("update Angajat set password = (?) where username = (?)")){
            preStmt.setString(1, entity.getPassword());
            preStmt.setString(2, entity.getUsername());
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
