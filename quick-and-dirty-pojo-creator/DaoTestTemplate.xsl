<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Class">
		<xsl:param name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
		<xsl:param name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
import static org.hamcrest.CoreMatchers.*;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import javax.sql.DataSource;

/***
* Created by <xsl:value-of select="@Author"/> on <xsl:value-of select="@CreationDate"/>.
*/
@RunWith(PowerMockRunner.class)
@PrepareForTest(<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>DaoTest.class)
public class <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>DaoTest {
	private <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Dao classToTest;
	private SimpleJdbcCall mockSimpleJdbcCall;
	private DataSource mockDataSource;
	private statis List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt; test<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Data;

	@BeforeClass
	public static void init() {
		test<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Data = Arrays.asList(new <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>());
	}
	
	@Before
	public void setup() {
		mockSimpleJdbcCall = Mockito.mock(SimpleJdbcCall.class);
		mockDataSource = Mockito.mock(DataSource.class);
		
		PowerMockito.whenNew(SimpleJdbcCall.class).withAnyArguments().thenReturn(mockSimpleJdbcCall);
		
		Mockito.when(mockSimpleJdbcCall.withProcedureName(Mockito.anyString())).thenReturn(mockSimpleJdbcCall);
		Mockito.when(mockSimpleJdbcCall.declareParameters(Mockito.any(SqlParameter.class))).thenReturn(mockSimpleJdbcCall);
		Mockito.when(mockSimpleJdbcCall.returningResultSet(Mockito.anyString(), Mockito.anyObject())).thenReturn(mockSimpleJdbcCall);
		
		classToTest = <xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Dao();
	}

	@Test		
	public void test_get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>_should_call_stored_procedure() {
		classToTest.get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@TestValue"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>);
		Mockito.verify(mockSimpleJdbcCall.withProcedureName("<xsl:value-of select="/Class/Dao/@Command"/>"),
			Mockito.times(1));
	}
	
	@Test
	public void test_get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>_should_return_list() {
		Mockito.when(mockSimpleJdbcCall.execute(Mockito.anyVararg()).thenReturn(new HashMap&lt;String, Object&gt;() {{
			put("Result", test<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Data);
		}});
		List&lt;<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>&gt; result = classToTest.get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:for-each select="/Class/Dao/Parameters/Parameter"><xsl:value-of select="@TestValue"/><xsl:if test="following-sibling::Parameter">, </xsl:if></xsl:for-each>);
		Assert.assertThat(result, is(test<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>Data));
	}
}	
	</xsl:template>
</xsl:stylesheet>
