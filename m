Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A095306489
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 20:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhA0T5z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Jan 2021 14:57:55 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53808 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhA0T5t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Jan 2021 14:57:49 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu3AP032953;
        Wed, 27 Jan 2021 13:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611777363;
        bh=DCCrToReH6eXlJZ57Np7e3COK3zFm1KkQuCb2WzGcC4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=U/oREB/R43BwBXPwGsLyrQcRRAy4/ZgRaQLLiSgVvv7NIkCiXs60Ax1ZZfnBi7gvF
         LXorYkcDTmEyfqfelAHrb4892+GtAaYmsLjMQ9uqBe9r/v0IWC9vBx5DrUYr8dlzX1
         J9Ky3qdT4/X184NRuwbJIElLx5xYVLzZRi/bcBxA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RJu2mN006262
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Jan 2021 13:56:03 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 13:56:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 13:56:03 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu3Md081572;
        Wed, 27 Jan 2021 13:56:03 -0600
Received: from localhost ([10.250.69.64])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10RJu3kP082367;
        Wed, 27 Jan 2021 13:56:03 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] mailbox: omap: Add support for K3 AM64x SoCs
Date:   Wed, 27 Jan 2021 13:56:00 -0600
Message-ID: <20210127195600.23501-3-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127195600.23501-1-s-anna@ti.com>
References: <20210127195600.23501-1-s-anna@ti.com>
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

