Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026B42DE190
	for <lists+linux-omap@lfdr.de>; Fri, 18 Dec 2020 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389242AbgLRKy7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Dec 2020 05:54:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37104 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733166AbgLRKy6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Dec 2020 05:54:58 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BIAsG05016450;
        Fri, 18 Dec 2020 04:54:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608288856;
        bh=oTRxV2IyqNSUE36KrapQkMdH1dL/miePT0pftXoRbWc=;
        h=From:To:CC:Subject:Date;
        b=Gds3qzIFXDtCzwlG9urilE/l55epds0bVWykDrQGNp+hgWbCFwClG75PCBYBU3ID4
         zEnB2Co+UIOKIYB5AdttuQS9ezzkgiwziHlrgO4f04ZddbrQtVcgno9+tT0Aglk5Z8
         n8pOWFe+r42pDT85xADff0BDJdzU5x43QT17U4Ak=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BIAsGk0043653
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Dec 2020 04:54:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Dec 2020 04:54:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Dec 2020 04:54:15 -0600
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BIAsCd5117948;
        Fri, 18 Dec 2020 04:54:14 -0600
From:   Roger Quadros <rogerq@ti.com>
To:     <tony@atomide.com>
CC:     <nm@ti.com>, <nsekhar@ti.com>, <linux-omap@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH] MAINTAINERS: Update address for OMAP GPMC driver
Date:   Fri, 18 Dec 2020 12:54:11 +0200
Message-ID: <20201218105411.17424-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Updates my email address for OMAP GPMC driver.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d7784a5cb88..148a3fdb06d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12887,7 +12887,7 @@ S:	Orphan
 F:	drivers/video/fbdev/omap/
 
 OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT
-M:	Roger Quadros <rogerq@ti.com>
+M:	Roger Quadros <rogerq@kernel.org>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

