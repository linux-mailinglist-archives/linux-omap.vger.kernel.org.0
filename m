Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70C0B113128
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 18:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfLDRxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 12:53:54 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50782 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfLDRxy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 12:53:54 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrR3P079725;
        Wed, 4 Dec 2019 11:53:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575482007;
        bh=F0nt7Pmnh68/O5Kde/RiIQN8BvHVUZTNfgFgZMTCYBA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gPv5tYmPE1KQ25A9KFhR+W/RUdD4u5Y+xbYFN5sivADptIxq8DU56lOlH19oAAh3n
         4MA827H5nsAum7axEp5scWPXKIRFuD8VcgJrv/UXdaXdPfrUOkNbcncgpINt1zewQ8
         wg4kaVpr0+DoRXEHXIGFk1dfSBv/TbgV++j7N0vI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4HrR1t125780
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 11:53:27 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:53:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:53:20 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrBuB048941;
        Wed, 4 Dec 2019 11:53:17 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH 2/2] dt-bindings: display: Add obsolete note to "ti,tilcdc,panel" binding
Date:   Wed, 4 Dec 2019 19:53:11 +0200
Message-ID: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575481630.git.jsarha@ti.com>
References: <cover.1575481630.git.jsarha@ti.com>
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

