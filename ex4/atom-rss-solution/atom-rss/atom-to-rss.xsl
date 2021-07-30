<xsl:transform version="1.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:atom="http://www.w3.org/2005/Atom"
               exclude-result-prefixes="atom">

    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <rss version="2.0">
            <channel>
                <xsl:apply-templates select="atom:feed" />
            </channel>
        </rss>
    </xsl:template>

    <xsl:template match="atom:feed">
        <title>
            <xsl:value-of select="atom:title" />
        </title>
        <description>
            <xsl:value-of select="atom:title" />
        </description>

        <link>
            <xsl:variable name="entryLink" select="atom:link[not(@rel) or @rel='alternate'][1]/@href" />
            <xsl:choose>
                <xsl:when test="$entryLink">
                    <xsl:value-of select="$entryLink" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="atom:id" />
                </xsl:otherwise>
            </xsl:choose>
        </link>

        <xsl:apply-templates select="atom:entry" />
    </xsl:template>

    <xsl:template match="atom:entry">
        <item>
            <title>
                <xsl:value-of select="atom:title" />
            </title>
            <xsl:if test="atom:summary">
                <description>
                    <xsl:value-of select="atom:summary" />
                </description>
            </xsl:if>

            <xsl:variable name="entryLink" select="atom:link[not(@rel) or @rel='alternate'][1]/@href" />
            <xsl:if test="$entryLink">
                <link>
                    <xsl:value-of select="$entryLink" />
                </link>
            </xsl:if>
        </item>
    </xsl:template>

</xsl:transform>