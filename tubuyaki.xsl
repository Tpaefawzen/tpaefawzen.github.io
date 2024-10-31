<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html lang="ja">
<head>
<meta charset="UTF-8" />
<title><xsl:value-of="/rss/channel/title" /></title>
</head>
<body>
<h1><xsl:value-of="/rss/channel/title" /></h1>
<p><xsl:value-of="/rss/channel/description" /></p>
<xsl:for-each select="/rss/channel/item">
  <section>
  <h2><xsl:value-of="title" /></h2>
  <p>
    🕛️<xsl:value-of="pubDate" />
  </p>
  <p>
    <xsl:value-of="description" />
  </p>
  </section>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
