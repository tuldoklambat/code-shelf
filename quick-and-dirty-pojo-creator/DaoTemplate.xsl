<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Class">
		<xsl:param name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
		<xsl:param name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

/***
* Created by <xsl:value-of select="@Author"/> on <xsl:value-of select="@CreationDate"/>.
*/
public class <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Dao {
	private final SimpleJdbcCall simpleJdbcCall;
	private static final Logger LOG = LoggerFactory.getLogger(<xsl:value-of select="@Name"/>Dao.class);
	
	public <xsl:value-of select="@Name"/>Dao(DataSource dataSource) {
		simpleJdbcCall = new SimpleJdbcCall(dataSource);
	}
	
	public List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt; get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@Type"/><xsl:text> </xsl:text><xsl:value-of select="@Name"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>) {	
		LOG.info("Calling '<xsl:value-of select="/Class/Dao/@Command"/>'<xsl:if test="/Class/Dao/Parameters/Parameter"> with </xsl:if><xsl:for-each select="/Class/Dao/Parameters/Parameter">[{}]<xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>"<xsl:if test="/Class/Dao/Parameters/Parameter">, </xsl:if><xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@Name"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>);
		
		simpleJdbcCall.withProcedureName("<xsl:value-of select="/Class/Dao/@Command"/>")<xsl:for-each select="/Class/Dao/Parameters/Parameter">
			.declareParameters(new SqlParameter("@<xsl:value-of select="@Name"/>", <xsl:choose>
				<xsl:when test="@Type = 'String'">Types.VARCHAR</xsl:when>
				<xsl:when test="@Type = 'Integer'">Types.INTEGER</xsl:when></xsl:choose>))</xsl:for-each>
			.returningResultSet("Result", (rs, rowNum) -> <xsl:value-of select="@Name"/>Mapper(rs));
		
		Map&lt;String, Object&gt; result = simpleJdbcCall.execute(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@Name"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>);
		
		return (List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt;) result;
	}
	
	private static <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/><xsl:text> </xsl:text><xsl:value-of select="@Name"/>Mapper(ResultSet rs) throws SQLException {
		<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/> o = new <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>();
		<xsl:for-each select="/Class/Fields/Field">o.set<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(rs.get<xsl:value-of select="@Type"/>("<xsl:value-of select="@Column"/>"));
		</xsl:for-each>return o;
	}
}	
	</xsl:template>
</xsl:stylesheet>
