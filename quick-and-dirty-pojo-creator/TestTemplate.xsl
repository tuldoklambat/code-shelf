<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Fields">
		<xsl:param name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
		<xsl:param name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
import static org.hamcrest.CoreMatchers.*;
import org.junit.Assert;
import org.junit.Before;
import org.junit.After;

/***
* Created by <xsl:value-of select="@Author"/>.
*/
public class <xsl:value-of select="@ClassName"/>Test {
	private <xsl:value-of select="@ClassName"/> classToTest;
	
	@Before
	public void setup() {
		classToTest = new <xsl:value-of select="@ClassName"/>();
	}
	<xsl:for-each select="Field">
	@Test		
	public void<xsl:text> </xsl:text>test_get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>_should_return_the_same_value() {
		classToTest.set<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:value-of select="@TestValue"/>);
		Asset.assertThat(classToTest.get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(), is(<xsl:value-of select="@TestValue"/>));
	}</xsl:for-each>
}	
	</xsl:template>
</xsl:stylesheet>