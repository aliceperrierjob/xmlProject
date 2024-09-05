<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	>

	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
			<style>
			ul{
			background-color : lightgray;
			border-color: black;
			} </style>
			</head>
			<body>
				<h1>Robot</h1>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="robot">
		<h2> Robot : <xsl:value-of select="./@name" /> </h2>
		<ul>
	 <xsl:apply-templates />
<li> Nombre de roues :	<xsl:value-of select="count(./axe/roue)" /></li>
<li> Nombre de roues motrices :	<xsl:value-of select="count(.//roue[./@moteur='oui'])" /></li>
 </ul>

	</xsl:template>

	<xsl:template match="corps">
		<li>Largeur : <xsl:value-of select="./@w" /> </li>
		<li>Longueur : <xsl:value-of select="./@h" /> </li>
		<li> Surface : <xsl:value-of select="./@w * ./@h" /></li>
	</xsl:template>

	<xsl:template match="axe">
			<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="roue">
		<li>Roue : <xsl:value-of select="./@position" />
		-
		<xsl:value-of select="./@position" /> :
		<xsl:choose>
			<xsl:when test="./@moteur ='oui'">
				Motorisée
			</xsl:when>
			<xsl:when test="./@moteur ='non'">
				Non motorisée
			</xsl:when>
		</xsl:choose>
	</li>

</xsl:template>


</xsl:stylesheet>
