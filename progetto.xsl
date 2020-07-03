<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlsn="http://www.w3.org/1999/xhtml" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>
                <xsl:value-of select="//tei:msIdentifier//tei:idno"/> - Edizione digitale
            </title>
            <link href="stile.css" rel="stylesheet" type="text/css"/>
            <script src="progetto.js"></script>
        </head>
        <body>
          <div class="home">
            <h1>LL1.23 I-II</h1>
            <h2 class="center">Edizione digitale</h2>
            <p class="link">
              <a href="#23.I" id="link1">LL1.23 I</a> &#160; <!--spazio-->
              <b>|</b>
              &#160; <!--spazio--> <a href="#23.II" id="link2">LL1.23 II</a>
            </p>

            <div class="descrizione">
              <xsl:apply-templates select="//tei:msDesc"/>
              <xsl:apply-templates select="//tei:msContens"/>
              <xsl:apply-templates select="//tei:physDesc"/>
              <xsl:apply-templates select="//tei:additional"/>
            </div>
          
            <a name="23.I"></a>
            <div class="left">
              <h2>LL1.23 I</h2>
              <xsl:apply-templates select="//tei:titleStmt/tei:title[@n='1']"/>
              <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
              <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
              <xsl:apply-templates select="//tei:body[@n='1']"/>
              <xsl:apply-templates select="//tei:back[@n='1']"/>
            </div>

            <a name="23.II"></a>
            <div class="right">
              <h2>LL1.23 II</h2>
              <xsl:apply-templates select="//tei:titleStmt/tei:title[@n='2']"/>
              <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
              <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
              <xsl:apply-templates select="//tei:titleStmt[@n='2']"/>
              <xsl:apply-templates select="//tei:body[@n='2']"/>
              <xsl:apply-templates select="//tei:back[@n='2']"/>
            </div>
          </div>
            
          <footer>
            <xsl:apply-templates select="//tei:editionStmt"/>
            <xsl:apply-templates select="//tei:licence"/>
          </footer>
        </body>
    </html>
</xsl:template>

<xsl:template match="tei:msDesc"> 
  <p>
    <b>Ubicazione: </b>
    <xsl:value-of select="//tei:country"/>,
    <xsl:value-of select="//tei:settlement"/>,
    <xsl:value-of select="//tei:repository"/>.
  </p>
  <p>
    <xsl:value-of select="//tei:altIdentifier/tei:idno"/>
  </p>
  <p>
    <b>Lingua: </b>
    <xsl:value-of select="//tei:textLang"/>
  </p>
</xsl:template>

<xsl:template match="tei:physDesc"> 
  <b>Formato: </b>
  <xsl:value-of select="//tei:measure"/> folio, mm
  <xsl:value-of select="//tei:height"/> x
  <xsl:value-of select="//tei:width"/>
  <br/>
  <br/>
  <xsl:value-of select="//tei:support/tei:p"/>
  <p>
    <xsl:value-of select="//tei:physDesc//tei:foliation/tei:p"/>
  </p>
  <xsl:for-each select="//tei:handNote">
    <xsl:value-of select="./tei:p"/>
    <br/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="tei:additional">
  <p>
    <xsl:apply-templates/>
  </p>
  <img id="foto"/>
  <br/>
  <span id="descImg"></span> 
  <br/>
  <input type="image" src="freccia-sinistra.png" id="avanti"/>
  <input type="image" src="freccia-destra.png" id="indietro"/>
</xsl:template>

<xsl:template match="tei:titleStmt/tei:title">
  <p>
    <b>Titolo: </b> 
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="tei:titleStmt/tei:author">
  <p>
    <b>Autore: </b> 
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="tei:respStmt">
  <p>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="tei:name[@ref='#SM']">
  <xsl:apply-templates/> e
</xsl:template>

<xsl:template match="tei:body">
  <div id="testo">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="tei:lb">
  <xsl:apply-templates/>
  <br/>
</xsl:template>

<xsl:template match="tei:dateline">
  <p id="dateline">
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="tei:supplied">
  <i>
    <xsl:apply-templates/>
  </i>
</xsl:template>

<xsl:template match="tei:hi[@rend='first_line_indented']">
  &#160;
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:expan">
  [<xsl:apply-templates/>]
</xsl:template>

<xsl:template match="tei:del">
  <del>
    <xsl:apply-templates/>
  </del>
</xsl:template>

<xsl:template match="tei:del[@xml:id='apice']">
  <sup>
    <del>
      <xsl:apply-templates/>
    </del>
  </sup>
</xsl:template>

<xsl:template match="tei:back">
  <div id="back">
    <b>Note</b>  
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="tei:back//tei:note/tei:p | tei:back//tei:bibl//tei:bibl">
  <ul>
    <li>
      <xsl:apply-templates/>
    </li>
  </ul>
</xsl:template>

<xsl:template match="tei:back//tei:head">
  <br/>
  <b>
    <xsl:apply-templates/>
  </b>
</xsl:template>
    
</xsl:stylesheet>   