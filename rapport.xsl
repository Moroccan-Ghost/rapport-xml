<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Rapport</title>
            </head>
            <body>
                <p>Table des rapports</p>
                <table border="1">
                    <tr>
                        <th>Num mandat</th>
                        <th>Date</th>
                        <th>Expediteur</th>
                        <th>Destinataire</th>
                        <th>Etat</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="/rapport/mandat">
                        <tr>
                            <td><xsl:value-of select="@num"></xsl:value-of></td>
                            <td><xsl:value-of select="@date"></xsl:value-of></td>
                            <td>
                                <xsl:for-each select="expediteur">
                                    <ul>
                                        <li><xsl:value-of select="@nom"></xsl:value-of></li>
                                        <li><xsl:value-of select="@prenom"></xsl:value-of></li>
                                    </ul>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="destinataire">
                                    <ul>
                                        <li><xsl:value-of select="@nom"></xsl:value-of></li>
                                        <li><xsl:value-of select="@prenom"></xsl:value-of></li>
                                    </ul>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="@etat"></xsl:value-of></td>
                            <td><xsl:value-of select="@montant"></xsl:value-of></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td>Total Mondat</td>
                        <td colspan="5">
                            <xsl:value-of select="sum(/rapport/mandat/@montant)"></xsl:value-of>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Mondat recu</td>
                        <td colspan="5">
                            <xsl:value-of select="sum(/rapport/mandat[@etat='recu']/@montant)"></xsl:value-of>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Mondat non recu</td>
                        <td colspan="5">
                            <xsl:value-of select="sum(/rapport/mandat[@etat='nonRecu']/@montant)"></xsl:value-of>
                        </td>
                    </tr>
                </table>
               
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>