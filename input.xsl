<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:str="http://exslt.org/strings"
extension-element-prefixes="str">

<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/result">
    <xsl:text>User Name | Blood Group | Id | col1 | col2 | col3 | col4&#10;</xsl:text>
    <xsl:for-each select="users/user">
      <xsl:for-each select="*[starts-with(local-name(), 'col')]">
        <xsl:value-of select="str:align(../user-name, '          | ', 'left')" />
        <xsl:value-of select="str:align(../blood-group, '            | ', 'left')" />
        <xsl:value-of select="str:align(../id, '   | ', 'left')" />
        <xsl:value-of select="str:align(self::col1, '     | ', 'left')" />
        <xsl:value-of select="str:align(self::col2, '     | ', 'left')" />
        <xsl:value-of select="str:align(self::col3, '     | ', 'left')" />
        <xsl:value-of select="self::col4" />
        <xsl:if test="position()!=last()">
            <xsl:text>&#10;</xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="position()!=last()">
          <xsl:text>&#10;</xsl:text>
      </xsl:if>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>