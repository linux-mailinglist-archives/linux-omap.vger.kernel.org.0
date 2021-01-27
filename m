Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA24306483
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 20:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhA0T5G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Jan 2021 14:57:06 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53798 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhA0T5F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Jan 2021 14:57:05 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu3Ll032949;
        Wed, 27 Jan 2021 13:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611777363;
        bh=9TbAGQ3SS7VueTbjv88F6OHq3CLUtcuXkBHqFCcIsnw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gZjsZ29hox8Ic9fTYNtw7YcdrpqgosMsN6fZLgZE1OGljbbOr3qJaf6e2Fx+Joe+N
         Aulf869ky1dfz1niqaJaLqwziFOf860N2K9Uyk28yO50yETswVS78HliwD3u+Sqk8e
         i83Yw3FTE0Wp+uFWXq9U1/uZIVSj+waVVaCWQy8U=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RJu2dh051693
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Jan 2021 13:56:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 13:56:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 13:56:02 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RJu2xW107661;
        Wed, 27 Jan 2021 13:56:02 -0600
Received: from localhost ([10.250.69.64])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10RJu2i0082234;
        Wed, 27 Jan 2021 13:56:02 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] dt-bindings: mailbox: omap: Update binding for AM64x SoCs
Date:   Wed, 27 Jan 2021 13:55:59 -0600
Message-ID: <20210127195600.23501-2-s-anna@ti.com>
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

Update the existing OMAP Mailbox binding to include the info for
AM64x SoCs. There are some minor IP integration differences between
the AM64x SoCs and the previous AM65x and J721E SoC families.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../bindings/mailbox/omap-mailbox.txt         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
index 5fe80c1c19fc..c993d1a5c14a 100644
--- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
@@ -28,6 +28,9 @@ SoCs has each of these instances form a cluster and combine multiple clusters
 into a single IP block present within the Main NavSS. The interrupt lines from
 all these clusters are multiplexed and routed to different processor subsystems
 over a limited number of common interrupt output lines of an Interrupt Router.
+The AM64x SoCS also uses a single IP block comprising of multiple clusters,
+but the number of clusters are smaller, and the interrupt output lines are
+connected directly to various processors.
 
 Mailbox Device Node:
 ====================
@@ -42,6 +45,7 @@ Required properties:
 			    "ti,omap4-mailbox" for OMAP44xx, OMAP54xx, AM33xx,
 						   AM43xx and DRA7xx SoCs
 			    "ti,am654-mailbox" for K3 AM65x and J721E SoCs
+			    "ti,am64-mailbox" for K3 AM64x SoCs
 - reg:			Contains the mailbox register address range (base
 			address and length)
 - interrupts:		Contains the interrupt information for the mailbox
@@ -178,3 +182,21 @@ mailbox: mailbox@480c8000 {
 		};
 	};
 };
+
+4. /* AM64x */
+&cbass_main {
+	mailbox0_cluster2: mailbox@29020000 {
+		compatible = "ti,am64-mailbox";
+		reg = <0x00 0x29020000 0x00 0x200>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+		ti,mbox-num-users = <4>;
+		ti,mbox-num-fifos = <16>;
+
+		mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
+			ti,mbox-rx = <0 0 2>;
+			ti,mbox-tx = <1 0 2>;
+		};
+	};
+};
-- 
2.29.2

