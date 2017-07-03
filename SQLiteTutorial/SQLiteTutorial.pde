import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;

SQLite db;
void setup(){
  size(400,400);
  db = new SQLite( this, "weather.db" ); // open DB file
  if ( db.connect() ) {
    String sql="SELECT month,avg(highest) FROM weather_table";
    sql+=" group by month";
    db.query(sql);
    while (db.next ()) {
      println(db.getInt("month")+"月の最高気温平均は"+db.getFloat("avg(highest)")+"度です");
    }
  }
}