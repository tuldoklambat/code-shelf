<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Fields">
		<xsl:param name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
		<xsl:param name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
/***
* Created by <xsl:value-of select="@Author"/>.
*/		
public class <xsl:value-of select="@ClassName"/> {
		<xsl:for-each select="Field">
	private <xsl:value-of select="@Type"/><xsl:text> </xsl:text><xsl:value-of select="@Name"/>;</xsl:for-each>		
		<xsl:for-each select="Field">
		
	public <xsl:value-of select="@Type"/><xsl:text> </xsl:text>get<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>() {
		return <xsl:value-of select="@Name"/>;
	}
		
	public void<xsl:text> </xsl:text>set<xsl:value-of select="concat(translate(substring(@Name, 1, 1), $lowercase, $uppercase), substring(@Name, 2))"/>(<xsl:value-of select="@Type"/><xsl:text> </xsl:text><xsl:value-of select="@Name"/>) {
		this.<xsl:value-of select="@Name"/> = <xsl:value-of select="@Name"/>;
	}</xsl:for-each>
}	
	</xsl:template>
</xsl:stylesheet>
