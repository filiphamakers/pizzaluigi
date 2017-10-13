package be.vdab.repositories;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import be.vdab.entities.Pizza;

public class PizzaRepository extends AbstractRepository {
	private static final String BEGIN_SELECT = 
			"select id, naam, prijs, pikant from pizzas";
	private static final String FIND_ALL = 
			BEGIN_SELECT + String.format("%n%s", "order by naam");
	private static final String READ = 
			BEGIN_SELECT + String.format("%n%s", "where id=?");
	private static final String FIND_BY_PRIJS_BETWEEN = 
			BEGIN_SELECT + String.format("%n%s", "where prijs between ?  and ? order by prijs");
	private static final String CREATE = 
			"insert into pizzas(naam, prijs, pikant) values(? ,?, ?)";

	public List<Pizza> findAll() {
		try (Connection connection = dataSource.getConnection(); 
				Statement statement = connection.createStatement()){
			List<Pizza> pizzas = new ArrayList<>();
			connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			connection.setAutoCommit(false);
			try (ResultSet result = statement.executeQuery(FIND_ALL)){
				while (result.next()) {
					pizzas.add(resultSetRijNaarPizza(result));
				}
			connection.commit();
			} 
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}
	
	private Pizza resultSetRijNaarPizza(ResultSet result) throws SQLException {
		return new Pizza(
				result.getLong("id"), 
				result.getString("naam"), 
				result.getBigDecimal("prijs"),
				result.getBoolean("pikant"));			
	}

	public Optional<Pizza> read(long id) {
		try (Connection connection = dataSource.getConnection(); 
				PreparedStatement statement = connection.prepareStatement(READ)){
			Optional<Pizza> pizza;
			connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			connection.setAutoCommit(false);
			statement.setLong(1, id);
			try (ResultSet result = statement.executeQuery()){
				if (result.isBeforeFirst()) {
					pizza = Optional.of(resultSetRijNaarPizza(result));
				} else
					pizza = Optional.empty();
			} 
			connection.commit();
			return pizza;
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public List<Pizza> findByPrijsBetween(BigDecimal van, BigDecimal tot) {
		try (Connection connection = dataSource.getConnection(); 
				PreparedStatement statement = connection.prepareStatement(FIND_BY_PRIJS_BETWEEN)){
			List<Pizza> pizzas = new ArrayList<>();
			connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			connection.setAutoCommit(false);
			statement.setBigDecimal(1, van);
			statement.setBigDecimal(2, tot);
			try(ResultSet result = statement.executeQuery()){
				while (result.next()) {
					pizzas.add(resultSetRijNaarPizza(result));
				}
			}
			connection.commit();
			return Collections.unmodifiableList(pizzas);
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public void create(Pizza pizza) {
		try (Connection connection = dataSource.getConnection(); 
				PreparedStatement statement = connection.prepareStatement(CREATE, Statement.RETURN_GENERATED_KEYS)){
			connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			connection.setAutoCommit(false);
			statement.setString(1, pizza.getNaam());
			statement.setBigDecimal(2, pizza.getPrijs());
			statement.setBoolean(3, pizza.isPikant());
			statement.executeUpdate();
			try(ResultSet result = statement.getGeneratedKeys()){
				result.next();
				pizza.setId(result.getLong(1));
			}
			connection.commit();
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}
}
