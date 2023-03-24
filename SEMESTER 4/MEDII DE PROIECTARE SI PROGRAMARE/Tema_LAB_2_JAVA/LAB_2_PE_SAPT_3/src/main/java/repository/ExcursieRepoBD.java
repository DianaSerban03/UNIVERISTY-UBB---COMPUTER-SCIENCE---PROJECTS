package repository;


import domain.*;
import domain.Excursie;
import domain.Excursie;
import domain.Excursie;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class ExcursieRepoBD implements IExcursie{
    private JdbcUtils dbUtils;



    private static final Logger logger= LogManager.getLogger();

    public ExcursieRepoBD(Properties props){
        logger.info("Initializing ExcursieRepoBD with properties: {} ",props);
        dbUtils=new JdbcUtils(props);
    }

    @Override
    public Iterable<Excursie>findAll(){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Excursie> excursii = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Excursie")){
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String obTuristic = resultSet.getString("ob_turistic");
                    String firmaTransp = resultSet.getString("firma_transport");
                    LocalDateTime oraPlecare = resultSet.getTimestamp("ora_plecare").toLocalDateTime();
                    Double pret = resultSet.getDouble("pret");
                    Integer nrLocuri = resultSet.getInt("nr_locuri");
                    Integer id = resultSet.getInt("id_excursie");
                    Excursie excursie = new Excursie(obTuristic, firmaTransp, oraPlecare, pret, nrLocuri);
                    excursie.setIdExc(id);
                    excursii.add(excursie);
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(excursii);
        return excursii;
    }

    @Override
    public Excursie findOne(Integer id){
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        List<Excursie>excursii = new ArrayList<>();
        try(PreparedStatement preSmt=con.prepareStatement("select * from Excursie where id_excursie = ?")){
            preSmt.setInt(1, id);
            try(ResultSet resultSet = preSmt.executeQuery()){
                while(resultSet.next()){
                    String obTuristic = resultSet.getString("ob_turistic");
                    String firmaTransp = resultSet.getString("firma_transport");
                    LocalDateTime oraPlecare = resultSet.getTimestamp("ora_plecare").toLocalDateTime();
                    Double pret = resultSet.getDouble("pret");
                    Integer nrLocuri = resultSet.getInt("nr_locuri");
                    Excursie excursie = new Excursie(obTuristic, firmaTransp, oraPlecare, pret, nrLocuri);
                    
                    return excursie;
                }
            }
        } catch(SQLException e){
            logger.error(e);
            System.err.println("Error DB "+e);
        }
        logger.traceExit(excursii);
        return null;
    }

    @Override
    public void save(Excursie e){
        logger.traceEntry("saving task{} ", e);
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("insert into Excursie (ob_turistic, firma_transport, ora_plecare, pret, nr_locuri) values (?,?, ?, ?, ?)")){
            preStmt.setString(1, e.getObTuristic());
            preStmt.setString(2,e.getFirmaTransp());
            preStmt.setTimestamp(3, Timestamp.valueOf(e.getOraPlecare()));
            preStmt.setDouble(4,e.getPret());
            preStmt.setLong(5,e.getNrLocuri());
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
        try(PreparedStatement preStmt=con.prepareStatement("delete from Excursie where id_excursie = (?)")){
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
    public Excursie update(Excursie entity)
    {
        Excursie c = this.findOne(entity.getIdExc());
        if(c == null)
            return entity;
        logger.traceEntry();
        Connection con = dbUtils.getConnection();
        try(PreparedStatement preStmt=con.prepareStatement("update Excursie set ob_turistic = (?), firma_transport=(?), ora_plecare=(?), pret=(?), nr_locuri=(?) where id_excursie = (?)")){
            preStmt.setString(1, entity.getObTuristic());
            preStmt.setString(2, entity.getFirmaTransp());
            preStmt.setTimestamp(3, Timestamp.valueOf(entity.getOraPlecare()));
            preStmt.setDouble(4,entity.getPret());
            preStmt.setLong(5,entity.getNrLocuri());
            preStmt.setInt(6,entity.getIdExc());
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
