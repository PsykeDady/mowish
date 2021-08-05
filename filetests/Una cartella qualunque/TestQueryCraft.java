
import psykeco.querymatico.*;
import psykeco.querymatico.sql.*;
import psykeco.querymatico.sql.runners.MySqlConnection;
import java.util.List;

public class TestQueryCraft {
    public static class Entity {
        private int identity;
        private String name;
        private String description;
        public Entity(){}
        public Entity(int identity, String name, String description){
            setIdentity(identity);
            setName(name);
            setDescription(description);
        }
        public void setIdentity(int identity){this.identity=identity;}
        public void setName(String name){this.name=name;}
        public void setDescription(String description){this.description=description;}
    }

    public static void main(String []args){
        java.util.Scanner sc = new java.util.Scanner(System.in);
        System.out.print("press enter to start test:>");
        sc.nextLine();
        sc.close();

        MySqlConnection.createConnection((SQLConnectionMaticO) 
                    new SQLConnectionMaticO().psk("psk"));
        MySqlConnection m = new MySqlConnection();
    
        // create db
        DBMaticO dbc = new SQLDBMaticO().DB(null);
        m.exec(dbc.drop());
        m.exec(dbc.create());
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
        
        // create table
        TableMaticO tc = new SQLTableMaticO().DB("MyDBName").table(Entity.class).primary("identity");
        m.exec(tc.create());
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
    
        // insert data
        Entity e = new Entity(1, "DOGE", "funny dog");
        m.exec(tc.insertData(e));
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
    
        e = new Entity(2, "MARIO", "italian plumber"); 
        m.exec(tc.insertData(e));
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
    
        e = new Entity(3, "STEVEN", "strange magic mix of diamond and a kid");
        m.exec(tc.insertData(e));
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
        
        List<Entity> res=m.queryList(Entity.class, tc.selectData(null));
        if (!m.getErrMsg().equals(""))
            throw new IllegalStateException("an error occur: " + m.getErrMsg());
        for(Entity ent : res ) {
            System.out.println(ent.identity+" "+ent.name+" "+ent.description);
        }
        
    }
}
