Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CE7315708
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 20:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhBITml (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 14:42:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38594 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbhBITkK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 14:40:10 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119Jb0N7021006;
        Tue, 9 Feb 2021 13:37:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612899420;
        bh=L+EEqaOk39l/ZK4/cPCownGGhtcahLhY6Hqaye2jMSw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nTXw431atg3CpzIkKKPonnVVZR4eM0vjE8XBfgnuQcTm5r+zlZCjATmpaTDwFtisr
         s/1MV9rUe6GlToKp/wzwEe1bxtyl0Ibf40ua3d/dRDZfLgqlbUVal9aqIDxJTuVFBc
         un6uyw7doYYPD1jBt6xZqSoJA2ctyq+jvOLebsgE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119JaxN0054756
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 13:36:59 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 13:36:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 13:36:59 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119JaxsS117600;
        Tue, 9 Feb 2021 13:36:59 -0600
Received: from localhost ([10.250.35.110])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 119JaxQW082160;
        Tue, 9 Feb 2021 13:36:59 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: omap: Update binding for AM64x SoCs
Date:   Tue, 9 Feb 2021 13:36:42 -0600
Message-ID: <20210209193643.24824-2-s-anna@ti.com>
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

Update the existing OMAP Mailbox binding to include the info for
AM64x SoCs. There are some minor IP integration differences between
the AM64x SoCs and the previous AM65x and J721E SoC families.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Remove AM64x example as per Rob's comments
v1: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210127195600.23501-2-s-anna@ti.com/

 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
index 5fe80c1c19fc..12371f5c6cd9 100644
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
-- 
2.29.2

