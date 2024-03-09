<!DOCTYPE html>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- The output will be HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Match the root element of the XML document -->
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>3H Bookstore</title> 
                <link rel="icon" href="assets/book-stack.png" type="image/png"/>
                <link rel="stylesheet" href="styles2.css"/>
                <style>
                    .footer-image-phone {
                        position: relative;
                        bottom: 9px;
                        left: -20px;
                    }
                    .footer-image-location {
                        position: relative;
                        bottom: 12px;
                        left: 77%;
                    }
                    .footer-image-email { 
                        position: relative;
                        bottom: 10px;
                        left: 37.5%;
                    }
                </style>
            </head>
            <header></header>
            <body>  
                <div class="container">
                    <div class="buttons-bar">
                        <a class="button" href="Home.html">HOME</a>
                        <a class="button" href="Library.xml">CATALOG</a>
                        <a class="button" href="#myFooter">ABOUT US</a>
                    </div>

                    <div class="image-container">
                        <img src="assets/library.svg" alt="Library Background"/>
                    </div>  

                    <!--
                    <div class="search-bar">
                        <input type="text" placeholder="Search..."/>
                    </div>
                    -->

                    <div class="blue-bar"></div>
                    <div class="black-bar"></div>  
                    
                    <div class="grey-bar">
                        <div class="white-rectangle-small">
                            <h1>BOOK COVER</h1>
                        </div>
                        <div class="white-rectangle-big">
                            <h1>BOOK INFO</h1>
                        </div>
                    </div>

                    <div class="big-blue-rectangle">
                        <xsl:for-each select="library/book">
                            <!-- Calculate the top position based on the current position() -->
                            <xsl:variable name="topPosition" select="(position() - 1) * 550"/>

                            <div class="white-rectangle-cover" style="top: {$topPosition}px;">
                                <img src="{image/file_path}" alt="{image/description}"/>
                            </div>
                            <div class="white-rectangle-details" style="top: {$topPosition}px;">   
                            <p>
                                <h2 style="text-align: center;">
                                    <xsl:value-of select="title"/>
                                <br/>
                                <strong>Author:</strong> <xsl:value-of select="author"/>
                                <br/>
                                <strong>Release Date:</strong> <xsl:value-of select="release_date"/>
                                <br/>
                                <strong>Genre:</strong> <xsl:value-of select="genre"/>
                                <br/>
                                <strong>Language:</strong> <xsl:value-of select="language"/>
                                </h2>
                             </p>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="grey-bar"></div>
                    <div class="black-bar"></div>     
                </div>

                <footer id="myFooter">
                    <img src="assets/smartphone.png" alt="Phone Icon" width="25" height="25" class="footer-image-phone"/>
                    <div class="footer-phone-number">5420 6900</div>

                    <img src="assets/email.png" alt="Email Icon" width="25" height="25" class="footer-image-email"/>
                    <div class="footer-email">tripleh@bookstore.net</div>

                    <img src="assets/map.png" alt="Location Icon" width="25" height="25" class="footer-image-location"/>
                    <div class="footer-location">Royal Road Port Louis</div>
                </footer>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="book">

        <xsl:variable name="coverImagePath" select="image/file_path"/>
        <xsl:variable name="coverDescription" select="image/description"/>

        <!-- Create the book cover and info elements -->
        <div class="white-rectangle-cover">
            <img src="{$coverImagePath}" alt="{$coverDescription}"/>
        </div>
        <div class="white-rectangle-details">   
            <p>
                <h2 style="text-align: center;">
                    <xsl:value-of select="title"/>
                <br/>
                <strong>Author:</strong> <xsl:value-of select="author"/>
                <br/>
                <strong>Release Date:</strong> <xsl:value-of select="release_date"/>
                <br/>
                <strong>Genre:</strong> <xsl:value-of select="genre"/>
                <br/>
                <strong>Language:</strong> <xsl:value-of select="language"/>
                </h2>
            </p>
        </div>
        <br/> <!-- Add a line break between book entries -->
    </xsl:template>

</xsl:stylesheet>
