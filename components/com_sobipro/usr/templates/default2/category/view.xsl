<?xml version="1.0" encoding="UTF-8"?>
<!--
 @version: $Id: view.xsl 3024 2013-01-19 19:40:34Z Radek Suski $
 @package: SobiPro Component for Joomla!

 @author
 Name: Sigrid Suski & Radek Suski, Sigsiu.NET GmbH
 Email: sobi[at]sigsiu.net
 Url: http://www.Sigsiu.NET

 @copyright Copyright (C) 2006 - 2013 Sigsiu.NET GmbH (http://www.sigsiu.net). All rights reserved.
 @license GNU/GPL Version 3
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3
 as published by the Free Software Foundation, and under the additional terms according section 7 of GPL v3.
 See http://www.gnu.org/licenses/gpl.html and http://sobipro.sigsiu.net/licenses.

 This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

 $Date: 2013-01-19 20:40:34 +0100 (Sat, 19 Jan 2013) $
 $Revision: 3024 $
 $Author: Radek Suski $
 File location: components/com_sobipro/usr/templates/default2/category/view.xsl $
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
	<xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" />

	<xsl:include href="../common/navigation.xsl" />
	<xsl:include href="../common/topmenu.xsl" />
	<xsl:include href="../common/alphamenu.xsl" />
	<xsl:include href="../common/entries.xsl" />
	<xsl:include href="../common/categories.xsl" />
	<xsl:include href="../common/messages.xsl"/>
	<xsl:template match="/category">
		<xsl:variable name="rssUrlSection">{"sid":"<xsl:value-of select="section/@id" />","sptpl":"feeds.rss","out":"raw"}
		</xsl:variable>
		<xsl:variable name="sectionName"><xsl:value-of select="section" /></xsl:variable>
		<xsl:value-of select="php:function( 'SobiPro::AlternateLink', $rssUrlSection, 'application/atom+xml', $sectionName )" />
		<xsl:variable name="rssUrl">{"sid":"<xsl:value-of select="id" />","sptpl":"feeds.rss","out":"raw"}</xsl:variable>
		<xsl:variable name="categoryName"><xsl:value-of select="name" /></xsl:variable>
		<xsl:value-of select="php:function( 'SobiPro::AlternateLink', $rssUrl, 'application/atom+xml', $categoryName )" />

		<xsl:call-template name="topMenu">
			<xsl:with-param name="searchbox">true</xsl:with-param>
		</xsl:call-template>
		<xsl:apply-templates select="messages"/>

		<xsl:apply-templates select="alphaMenu" />

		<xsl:value-of select="description" disable-output-escaping="yes" />

		<xsl:call-template name="categoriesLoop" />
		<xsl:call-template name="entriesLoop" />
		<xsl:apply-templates select="navigation" />
	</xsl:template>
</xsl:stylesheet>
