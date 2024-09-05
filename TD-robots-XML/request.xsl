<?xml version="1.0" ?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
>
<xsl:variable name="robots" select="document('robot.xml')"/>
<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
		type="text/xsl"
		href="robot2html.xsl"
	</xsl:processing-instruction>
	<xsl:apply-templates />
</xsl:template>
*
<xsl:template match="request">
	<robots> <xsl:apply-templates /> </robots>
</xsl:template>


<xsl:template match="all">
	<xsl:copy-of select="$robots//robot" />
</xsl:template>

<xsl:template match="name">
	<xsl:variable name="key" select="./@string"/>
	<xsl:copy-of select="$robots//robot[./@name = $key]" />
</xsl:template>

<xsl:template match="engine">
	<xsl:variable name="key" select="./@count"/>
	<xsl:copy-of select="$robots//robot[count(.//roue[./@moteur ='oui']) = $key]" />
</xsl:template>
</xsl:stylesheet>
