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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.sql.DataSource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
		
/***
* Created by <xsl:value-of select="@Author"/> on <xsl:value-of select="@CreationDate"/>.
*/
@RequestController()
@RequestMapping("<xsl:value-of select="@Name"/>")
public class <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Controller {
	private static final Logger LOG = LoggerFactory.getLogger(<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Controller.class);
	
	@Autowired
	DataSource dataSource;

	@RequestMapping(value = "/get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>", method = { RequestMethod.POST }) 
	public ResponseEntity&lt;List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt;&gt; get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@Type"/><xsl:text> </xsl:text><xsl:value-of select="@Name"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>) {
		List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt; result = Arrays.asList(new <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>());
		try {
			<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Dao dao = new <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Dao(dataSource);			
			result = dao.get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@Name"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>);
		} catch(Exception ex) {
			return ResponseEntity.status(HttpRequest.BAD_REQUEST)
				.header("Exception", ex.getMessage())
				.body("Error retrieving list of <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>");
		}
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
}	
	</xsl:template>
</xsl:stylesheet>
