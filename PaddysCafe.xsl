<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <head>
            <title>Paddy's Cafe Menu</title>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
            <style>
				XML {
					display:none;
				}
				body {
					font-family: Arial, Helvetica, sans-serif;
					background-color: #FFFFFF;
					margin: 5px;
					text-align: left;
					color: #523819;
				}
				h2 {
					font-size: 140%;
					color: #0D3427;
					margin-top: 10px;
				}
				p {
					font-size: 80%;
					color: #523819;
				}
				table {
					background-color: #DACFE5;
					border-color: #000000;
					border-width: thin;
					border-collapse: collapse;
					width: 75%;
				}
				th {
					border-color: #000000;
					font-size: 120%;
					color: #0D3427;
				}
				td {
					border-color: #000000;
					font-size: 100%;
					color: #523819;
					padding: 5px;
				}
				img {
					float: left;
					margin-left: 10px;
					margin-right: 10px;
					border: 0px;
				}
				.indent {
					margin-left: 78px;
				}
			</style>
        </head>
            <body>
                <h2>
                    <img src="data:image/gif;base64,R0lGODlhOgBkANUAAP///7TWer3bi5rO0NHmr+Xx0QGEibW6tymWhsrm57zY2ZHGfdzswYeQi0yorMLdkubn52a1uPH35t/w8Nfa2G22hL3aeVOqgsbeefDy8sfhnvn78w6Kj/H4+BiOh/b67h2RljCbn6vSe/j8/AB/irjYgfv9+LjYev7+/bXXffz++vv9/bTWe/b4+Oz13ZzLfPz8/KKopT2ghP///rbXerXWejmfo4nGyHq/wbDUepifm/7//v7//7XWe4TBfv3+/CH5BAAAAAAALAAAAAA6AGQAAAb/QIBwSCwCTAzGzshsOp9QYUFQ+kSv2KuJEAgQsuAwcaPpBlziNNb0MFfVcCeq7N7E70WGuVuy4/EfJXsBKVZ/d1yDAQWHcRuCihqNcAWKfH6TYYmWDJlhJgKWXQImnlkSLKJdnaZXLqqjpa1QlbBes7S2hGi4TbW2D7K9Rb+2X8NFr7pdjMhDEst8Es5Cj9EBwdQzdNHHznrXAazIytcszcMobeEl08jg4QKYuIHhXRo/yJvh3rgbofbEIStmDh2ufdfaDWMTMIC8YR8A2tMwY5iLHg3H4YJnz+AshNEU9trBLVy2Xv8a9pslAVLHdw0fDgO5bGUrhgE9tmoZkNTA/4zOaNp6s3AdP2cuUoUrFLQLjRM0FD21YOHEKjArJnQg0mLCCCFZtxLp4PUBjRwvREQ1YwGtjwUiLNB4oELIhAQJJjiZwOHGEBQODEQQMiJEiBVDRtgIAcCFhQskZJyo0cWCDw8kDGi+EOCEiwk2NGu2kYDJBAM4hiQwEIKDXgADDAwYokC2EAIcEJDwYSGAZRIeKrxYAPkChgcg+uK9wQFEBiOnUwtxECIDh8EARoA4LCQECLE3DLxAgMBCDQsySCzAcKJqhQqPSSggUttvkehCVs8O/zr2/NqzAWBdBRj4sFtVCHhAw1q+USUDCEaAgB0R+AEQ2A0D4CCYEC2A4P8AAN59BYCGOLxnQHkWJLhgFyeI8MIJDyI2RAvXGbGaX6txoOOOz8GGmm0A8LWjjrthABmBFmAgQoInVECCfUKEFyAAEVSZnF4OuNbBlqtJ16EBIIgYgQEJbKnBCydaIAJmMlRwAWbw0aCbAzfcEJgDIoIIAgg2zDdBCFAKEYENYg0QQoAd2DChYxV48IKaF3BgQG4+WGUBAQMk19wNeYIlIwAr8MDECiiM+qkQGljFYlsiiNCeGZ3wsKWowxRQA4MBLEgDZWboNIwKEsHCSxwtHBAGR6L04A4cP0CgQwY9tkABBERkMG0+jelSgjBqZBBDAwcYS4EO4T4LwAExhBv/A7U/GCWKTWm0EAOHDVAwQrHzQpABBBSAe5stvorhbakQNBDDwenCcAC5CqQrBLKD9BHGEkZ4Sy+1AECgcQNDOAwAxHvAS4sGyxJG7gEw9FsuBS2c/K2xHwsrhh4lMFDXENZSkE/O0VIwbQstPKwKRTOb8UDAWJS0RwolZ4GsBgVwi4UEKbyrBkGjECBBqVds4O4ePqVRjiUPEFDABhQb8cMUyQ4rxgdVD/WABgwU4MLdBRAQrCIaifHD3g1ZfYfSgUcidRpCFY7NPJQoTjbjcNTjuBkaHA4HCoAHTgDXjSSeUN+HjN0Qya1YExPSh3guigAMQO4J1kZroJRDUFtuWQooligkQQEFSIAtNQDQ9ADwToh+D/FNzBEJ8r4oMjzzRpAUsevMG4868QiBDj0AKVG+PRMFzM7U93nscT3xO2wi8vYzMJDK8+Qb4cIDAvwePxEuMGD/LEEAADs=" alt="Javaco Tea Logo" width="58" height="100" />Welcome to Paddy's Cafe</h2>
                <p>Select your entrees from the menu below. To calculate the amount of the bill, click the Calculate Bill button. Check the "Highlight Vegetarian Meals" box to highlight vegetarian dishes.</p>
                <table id="menuTable" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">Paddy's Cafe Menu</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Item</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/cafemenu/section">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="entree">
                                <tr>
                                    <xsl:attribute name="vegetarian">
                                        <xsl:value-of select="boolean(@vegetarian)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="item" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="price" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
                <form class="indent">
                    <p>
                        <input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill" />
                Total: &#128;
                <input type="text" name="txtBillAmt" /><input type="checkbox" name="cbOpts" value="isVeg" id="showVeg" /><label for="showVeg">Highlight Vegetarian Meals</label></p>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>