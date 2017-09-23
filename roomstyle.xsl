<?xml version="1.0" encoding="UTF-8"?> 
<!-- romstyle.xsl
     Author: Emelie Ekenstedt
     Last modified: 21/10/2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" /> <!-- Transform xml to html-->

    <xsl:template match="/rooms"> <!-- Match root tag -->
        <html>
            <head>
                <title>Room details</title>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" type="text/css" href="style.css" />
                <!-- For special fonts -->
                <link href="https://fonts.googleapis.com/css?family=Railway" rel="stylesheet" /> 
                <link href="https://fonts.googleapis.com/css?family=Corben:700" rel="stylesheet" />
                <!-- Documentlayer styling for imgages on this page: move to right, roomnames get smaller -->
                <style>  
                    img {
                        float: right;
                        Position: relative;
                        top: 0.5cm;
                        margin-bottom: 1cm;
                    }
                    h2.roomName {
                        font-size: 20px;
                    }
                </style>
                <style>
            
        </style>
            </head>
            <body>
                <section>
                    <header>
                        <h1>Air head BnB</h1>
                        <h2>Air Body BnB</h2>
                    </header>
                    <nav>
                        <a href="index.html">Home</a>
                        <a href="http://www.blogtyrant.com/best-about-us-pages/">About us</a>
                        <a href="luxury.xml">Luxury</a>
                        <a href="budget.xml">Budget</a> 
                        <a href="http://www.blogtyrant.com/best-contact-us-pages/">Contact</a> 
                        <a href="survey.html">Leave a review</a>
                        <a href="https://www.visser.com.au/blog/generic-privacy-policy-for-australian-websites/">Privacy Policy</a>
                        <a href="https://media.termsfeed.com/pdf/terms-and-conditions-template.pdf">Terms and Conditions</a>
                    </nav>
                    <main class="roomDescription">

                        <h1 class="mainHeader"><xsl:value-of select="room/@type" /> rooms</h1> <!-- Main header for lower part of page -->
                        <ul> 
                            <xsl:for-each select="room">
                                <xsl:sort select="name" order="ascending" data-type="text" /> <!-- Sort rooms according to name, ascending -->
                                <li style="list-style-type: none">
                                    <div class="subsectionRoom">

                                        <img> <!-- Add image of room -->
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="photo" />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="@type" /> bedroom
                                            </xsl:attribute>
                                        </img>

                                        <h2 class="roomName"><xsl:value-of select="name" /></h2> <!-- Roomname -->

                                        <p> <!-- Add Number of beds, location, cost, bathroom, TV, reviewlinks -->
                                        Accomodates: <xsl:value-of select="@nbrOfOccupants" /> <br />
                                        Location in house: <xsl:value-of select="name(level/*)" /><br />
                                        Lease
                                        <ul>
                                            <li>Short term: $<xsl:value-of select="cost/shortTerm" /> per day</li>
                                            <li>Short long: $<xsl:value-of select="cost/longTerm" /> per week</li>
                                        </ul>                                     

                                        Hygienic facilities: <xsl:value-of select="bathroom" /> bathroom <br/>
                                        <xsl:if test="TV">
                                            TV: <xsl:value-of select="TV" /> <br/>
                                        </xsl:if>

                                        <xsl:apply-templates select="level" /> 

                                        Link to reviews: 
                                        <ul style="list-style-type: none">
                                            <xsl:for-each select="linkList/link">
                                                <li> <a href="{.}">
                                                    <xsl:value-of select="." /> 
                                                </a></li>
                                            </xsl:for-each>
                                        </ul>

                                        </p>
                                    </div>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </main>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="level">
            <xsl:if test="name(./*)='downstairs'">
                <!-- if the following was entered, include -->
                <xsl:if test="downstairs/veranda">
                    Veranda type: <xsl:value-of select="downstairs/veranda" /> <br/>
                </xsl:if>
                <xsl:if test="downstairs/courtyard">
                    Courtyard type: <xsl:value-of select="downstairs/courtyard" /> <br/>
                </xsl:if>
                Flooring: <xsl:value-of select="downstairs/flooring/@type" /> <br/>
                View: <xsl:value-of select="downstairs/view" /> <br/>
            </xsl:if>
            <xsl:if test="name(./*)='upstairs'">
                <xsl:if test="upstairs/roofWindow">
                    Has roof windows <br/> <!-- Text here since defined as empty tag (it a matter of existence or not) -->
                </xsl:if>
                <xsl:if test="upstairs/balcony">
                    Balcony type: <xsl:value-of select="upstairs/balcony" /> <br/>
                </xsl:if>
                View: <xsl:value-of select="upstairs/view" /> <br/>
            </xsl:if>
  
    </xsl:template>

</xsl:stylesheet>