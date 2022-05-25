package la.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import la.bean.ItemBean;

public class ItemDAO {
	// URL、ユーザ名、パスワードの準備
	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String pass = "himitu";
	
	public ItemDAO() throws DAOException {
		try {
			// JDBCドライバの登録
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("ドライバの登録に失敗しました。");
		}
	}

	public List<ItemBean> findAll() throws DAOException {
		// SQL文の作成
		String sql = "SELECT * FROM item";
		
		try (// データベースへの接続
			 Connection con = DriverManager.getConnection(url, user, pass);
			 // PreparedStatementオブジェクトの取得
			 PreparedStatement st = con.prepareStatement(sql);
			 // SQLの実行
			 ResultSet rs = st.executeQuery();) {
			// 結果の取得
			List<ItemBean> list = new ArrayList<ItemBean>();
			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				ItemBean bean = new ItemBean(code, name, price);
				list.add(bean);
			}
			// 商品一覧をListとして返す
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}
	
	public List<ItemBean> findByCategory(int categoryCode)throws DAOException {
		// SQL文の作成
		String sql = "SELECT nextval('orderd_code_seq')";
		
		try (// データベースの接続
			Connection con = DriverManager.getConnection(url, user, pass);
				//PrepareStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);
				//SQLの実行
			ResultSet rs = st.executeQuery();) {
			if (rs.next()) {
				orderNumber = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
			
		}
			//注文情報のOrderedテーブルへの追加
		sql = "INSERT INTO ordered VALUE(?, ?, ?, ?)";
		
		try(// データベースへの接続
			Connection con = DriverManager.getConnection(url, user, pass);
				//Preparestatementオブジェクトのの取得
			PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, orderNumber);
			st.setInt(2, customerNumber);
			Date today = new Date(System.currentTimeMillis());
			st.setDate(3, today);
			st.setDate(4, cart.getTotal());
			st.executeUpdate();
		} catch (SQLException e) {
			e. printStackTrace();
			throw new DAOException("レコードの操作に失敗しました。");
			
		}
		
		sql = "INSERT INTO ordered_detail VALUES(?, ?, ?)";
		
		try
		Connection con = DriverManager .getConnection(url, user, pass);
		PreparedStatement st = con.prepareStatement(sql);) {
			List<ItemBean> items = cart.getItems();
			for (ItemBean item : items) {
			st.setInt(1, orderNumber);
			st.setInt(2, item.getCode());
			st.setInt(3, item.getQuantity());
			st.executeUpdate();
			
			}
			return orderNumber;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードに失敗しました。");
		}
				
	}
	
	
	
}