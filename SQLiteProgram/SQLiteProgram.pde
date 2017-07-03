import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;

SQLite db;
void setup(){
  size(400,400);
  db = new SQLite( this, "weather.db" ); // open DB file
  if ( db.connect() ) {
    String sql="SELECT month,day,weather FROM weather_table";
    sql+=" where prefecture_id=26 and year=2009";
    db.query(sql);
    while (db.next ()) {
      println(db.getInt("month")+"/"+db.getInt("day")+":"+db.getString("weather"));
    }
  }
}