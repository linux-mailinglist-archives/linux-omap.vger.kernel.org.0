Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5193116F4D
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 15:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfLIOmj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 09:42:39 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33962 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbfLIOmi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 09:42:38 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgTk8068969;
        Mon, 9 Dec 2019 08:42:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575902549;
        bh=F0nt7Pmnh68/O5Kde/RiIQN8BvHVUZTNfgFgZMTCYBA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EktQOM3I1jgvia9epVUaczD73PM3XUEPLoMnwGlJciybUUyZlxrbsBWuHR7sTXFkm
         1Y+tip7VHcx6zXDH/QzpXsgK4mecYnDd5fkDq1Ot7Ngy9tbdIA0d/Se4aDWmzbewX9
         nmnHkvhU0iOD6FfxXsrdrza4466wYtyIz14vwluU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgTWJ099070;
        Mon, 9 Dec 2019 08:42:29 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:24 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGvg122297;
        Mon, 9 Dec 2019 08:42:22 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH v2 2/3] dt-bindings: display: Add obsolete note to "ti,tilcdc,panel" binding
Date:   Mon, 9 Dec 2019 16:42:15 +0200
Message-ID: <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575901747.git.jsarha@ti.com>
References: <cover.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
is fully capable of using generic drm panels like panel-simple and
panel-common binding. However, the obsolete binding is still widely
used in many mainline supported platforms that I do not have access to
and who knows how many custom platforms. So I am afraid we have to
keep the old bundled tilcdc panel driver around.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 Documentation/devicetree/bindings/display/tilcdc/panel.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
index 808216310ea2..54963f9173cc 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
@@ -1,5 +1,11 @@
 Device-Tree bindings for tilcdc DRM generic panel output driver
 
+NOTE: This binding (and the related driver) is obsolete and should not
+      be used anymore. Please refer to drm panel-common binding (and
+      to a generic drm panel driver like panel-simple).
+      Documentation/devicetree/bindings/display/panel/panel-common.yaml
+      (drivers/gpu/drm/panel/panel-simple.c)
+
 Required properties:
  - compatible: value should be "ti,tilcdc,panel".
  - panel-info: configuration info to configure LCDC correctly for the panel
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

