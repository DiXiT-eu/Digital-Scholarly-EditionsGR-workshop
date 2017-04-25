<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:kp="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> April 18, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> elli</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
<!-- line break in output file; improves human readability of xml output -->
<xsl:variable name="newline"><xsl:text> 
</xsl:text></xsl:variable>
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Proofreading</title>
                <link rel="stylesheet" type="text/css" href="tsirkasProof.css" media="screen" />
            </head>
  
            <body>
               <xsl:apply-templates/>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="kp:teiHeader"/>
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="kp:div[@type='verse']">
        <h2 class="pageTitle">Επιμέλεια Ποιήματος: <xsl:value-of select="kp:lg/kp:head"/></h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="kp:div/kp:head">
        <h3 class="{parent::kp:div/@type}"><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="kp:lg/kp:head">
        <h3 class="{parent::kp:lg/@type}"><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="kp:lg">
        <div class="verse-{@type}">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
   
    <xsl:template match="kp:l">
       <br />
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="kp:rhyme">
        <span class="rhyme-{@label}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:q">
        <span class="{name()}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:lb">
        <xsl:if test="@break='no'">
            <xsl:text>-</xsl:text>
        </xsl:if>
        <xsl:text> | </xsl:text>
    </xsl:template>
    
    <!-- Tsirkas file -->
    
    <xsl:template match="kp:opener | kp:closer">
        <div class="{name()}"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="kp:date | kp:salute | kp:signed">
        <p class="{name()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="kp:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="kp:persName">
        <span class="{name()}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:lb">
        <xsl:if test="@break='no'">
            <xsl:text></xsl:text>
        </xsl:if>
        <xsl:text> | </xsl:text>
    </xsl:template>
    
    <!--
         <xsl:template match="kp:milestone">
        <span class="milestone"><xsl:value-of select="@n"/></span>
    </xsl:template>
    
    <xsl:template match="kp:pb">
        <span class="pb"><xsl:value-of select="@n"/></span>
    </xsl:template>
    
    <xsl:template match="kp:lb">
        <xsl:if test="@break='no'">
        <xsl:text>-</xsl:text>
        </xsl:if>
        <br />
    </xsl:template>
    
    <xsl:template match="kp:ab">
        <div class="ab">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="kp:choice | kp:reg">  
        <span class="{name()}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:orig">      
        <xsl:choose>
            <xsl:when test="parent::kp:choice"><span class="orig"><xsl:apply-templates/></span></xsl:when>
            <xsl:otherwise><span class="orig-solo"><xsl:apply-templates/></span></xsl:otherwise>
        </xsl:choose>      
    </xsl:template>
        
          <xsl:template match="kp:teiHeader"/>
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="kp:body">
        <xsl:apply-templates/>
    </xsl:template>
        <xsl:template match="kp:div[@type='title | epigram | discourse']">
        <h3 class="label"><xsl:value-of select="upper-case(@type)"/></h3>
        <div class="{name()}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

        
        <xsl:template match="kp:unclear | kp:supplied | kp:subst | kp:add | kp:del | kp:pc | kp:fw">
       <span class="{name()}">
           <xsl:apply-templates/>
       </span>
   </xsl:template>
    
    <xsl:template match="kp:seg[@rend='underline']">
        <span class="underline"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:seg[@rend='superscript']">
        <span class="superscript"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="kp:note">*
        <xsl:if test="@place='margin'">
            <div class="margin-note"><xsl:text>[*] </xsl:text><xsl:apply-templates/>
        </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="c">
        <xsl:choose>
            <xsl:when test="@rend='double-hyphen'">
            <xsl:text>=</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    -->

        
</xsl:stylesheet>
