package planet.dao;

import planet.ConnectionFactory;
import planet.entity.FinReport;
import planet.entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by oleksii on 20.08.15.
 */
public class FinReportDaoImpl {
    public List<FinReport> select(){
        List <FinReport> reports = new ArrayList<FinReport>();
        try (Connection connection = ConnectionFactory.getConnection();
        ) {
            try {
                String sqlGood = "SELECT * FROM planet.v_fin_report";
                PreparedStatement statement = connection.prepareStatement(sqlGood);

                ResultSet rs= statement.executeQuery();

                while(rs.next())
                {
                    FinReport r = new FinReport();
                    r.setLogin(rs.getString("login"));
                    r.setProductQty(rs.getInt("product_qty"));
                    r.setAmount(rs.getDouble("amount"));
                    r.setOrderDate(rs.getTimestamp("order_date"));
                    r.setProductName(rs.getString("name"));

                    reports.add(r);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }
}