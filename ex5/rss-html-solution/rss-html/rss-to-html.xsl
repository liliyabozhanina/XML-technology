<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" />
    <!--
        Ако използвате XSLT версия 3.0 може да замените горното с:
        <xsl:output method="html" encoding="utf-8" html-version="5" />
    -->

    <xsl:template match="/">

        <html>
            <xsl:attribute name="lang">
                <xsl:choose>
                    <xsl:when test="rss/channel/language">
                            <xsl:value-of select="rss/channel/language" />
                    </xsl:when>
                    <xsl:otherwise>en</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <xsl:apply-templates select="rss/channel" mode="head" />
            <xsl:apply-templates select="rss/channel" mode="body" />
        </html>

    </xsl:template>

    <xsl:template match="channel" mode="head">

        <head>
            <title>
                <xsl:value-of select="title" />
            </title>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
            <style>
                a:hover {
                    text-decoration: none;
                }

                h1 {
                    text-align:center;
                    color: blue;
                }

                h2 {
                    font-size: 1.5rem;
                }
            </style>
        </head>

    </xsl:template>

    <xsl:template match="channel" mode="body">

        <body class="bg-light">
            <header>
                <h1>
                    <xsl:value-of select="title" />
                </h1>
            </header>
            <main class="container">
                <xsl:apply-templates select="item" />
            </main>
        </body>

    </xsl:template>

    <xsl:template match="item">

        <article class="m-3 p-3 rounded shadow">
            <h2>
                <a target="_blank" href="{link}">
                    <xsl:value-of select="title" />
                </a>
            </h2>
            <div class="media">
                <xsl:apply-templates select="enclosure[@type  = 'image/jpeg'][1]" />
                <p>
                    <xsl:value-of select="description" />
                </p>
            </div>
        </article>

    </xsl:template>

    <xsl:template match="enclosure">
        <img class="m-2 rounded" alt="Снимка" src="{@url}" />
    </xsl:template>

</xsl:stylesheet>
