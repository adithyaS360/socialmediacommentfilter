import java.sql.Connection;
import java.sql.DriverManager;

public class TestDB {
    public static void main(String[] args) {
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Connecting...");
            Connection conn = DriverManager.getConnection("jdbc:postgresql://aws-0-ap-southeast-2.pooler.supabase.com:6543/postgres?user=guaascekpywutghiviiz.postgres&password=Subzero@1235678");
            System.out.println("Connected!");
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
