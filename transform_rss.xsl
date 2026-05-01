<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:g="http://base.google.com/ns/1.0"
  xmlns:ns="http://www.knime.org/json2xml/originalKey/"
  exclude-result-prefixes="ns">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <!-- Raíz: genera la estructura RSS -->
  <xsl:template match="/">
    <rss xmlns:g="http://base.google.com/ns/1.0" version="2.0">
      <channel>
        <xsl:apply-templates select="//Json/item"/>
      </channel>
    </rss>
  </xsl:template>

  <!-- Cada item del feed -->
  <xsl:template match="item">
    <item>
      <g:id><xsl:value-of select="SKU"/></g:id>
      <g:title><xsl:value-of select="Nombre"/></g:title>
      <g:description><xsl:value-of select="DescripcinparaSEO"/></g:description>
      <g:link><xsl:value-of select="URL"/></g:link>
      <g:price><xsl:value-of select="Precio"/></g:price>
      <g:sale_price><xsl:value-of select="Preciopromocional"/></g:sale_price>
      <g:product_type><xsl:value-of select="Categoras"/></g:product_type>
      <g:shipping_weight><xsl:value-of select="Pesokg"/> kg</g:shipping_weight>
      <g:availability>
        <xsl:choose>
          <xsl:when test="normalize-space(Stock) != ''">in stock</xsl:when>
          <xsl:otherwise>out of stock</xsl:otherwise>
        </xsl:choose>
      </g:availability>
    </item>
  </xsl:template>

</xsl:stylesheet>