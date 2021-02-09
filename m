Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD8A31570F
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 20:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbhBITpH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 14:45:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38610 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhBITkK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 14:40:10 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119Jb6fX021023;
        Tue, 9 Feb 2021 13:37:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612899427;
        bh=L9YNORugLibqxGGcKUb7I7kHap34krhtwxZBPRsk79I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=A8FoptXT3H0vp39VQ0D4plELeFt6ZT38OLGqyM0GcgoCP2faAwuDMTExeAHDGdu2Y
         58OENQU/gh9e/HqteVyj7m+UgBbiyK60KvJJTNEUcsRpyqrraLweaIttrrrn7vgf7F
         0pEUzoDudHd855vMXQgfUyJon1bL5Fm0JYnayjCk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119Jb6Jo115654
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 13:37:06 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 13:37:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 13:37:06 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119Jb6Q1080251;
        Tue, 9 Feb 2021 13:37:06 -0600
Received: from localhost ([10.250.35.110])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 119Jb6Ah082592;
        Tue, 9 Feb 2021 13:37:06 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/2] mailbox: omap: Add support for K3 AM64x SoCs
Date:   Tue, 9 Feb 2021 13:36:43 -0600
Message-ID: <20210209193643.24824-3-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209193643.24824-1-s-anna@ti.com>
References: <20210209193643.24824-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AM64x SoC contains a Mailbox IP instance with multiple clusters
in the MAIN domain, and is a variant of the IP on current AM65x and
J721E SoCs. The AM64x SoC has only 8 clusters with no interrupts
routed to the A53 core on the first 2 clusters. The interrupt outputs
from the IP do not go through any Interrupt Routers and are hard-wired
to each processor, with only couple of interrupts from each cluster
reaching the A53 core. The IP is also not built with the K3 safety
feature in hardware.

Add the support for this IP through a new compatible.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes

 drivers/mailbox/omap-mailbox.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 93fe08aef3ca..7295e3835e30 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -3,7 +3,7 @@
  * OMAP mailbox driver
  *
  * Copyright (C) 2006-2009 Nokia Corporation. All rights reserved.
- * Copyright (C) 2013-2019 Texas Instruments Incorporated - https://www.ti.com
+ * Copyright (C) 2013-2021 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
  *          Suman Anna <s-anna@ti.com>
@@ -663,6 +663,10 @@ static const struct of_device_id omap_mailbox_of_match[] = {
 		.compatible	= "ti,am654-mailbox",
 		.data		= &omap4_data,
 	},
+	{
+		.compatible	= "ti,am64-mailbox",
+		.data		= &omap4_data,
+	},
 	{
 		/* end */
 	},
-- 
2.29.2

