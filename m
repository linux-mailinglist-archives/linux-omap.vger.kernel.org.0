Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC599DA7E
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 02:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfH0AP3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 20:15:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36484 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfH0AP3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 20:15:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FDbd125373;
        Mon, 26 Aug 2019 19:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566864914;
        bh=mnHv973q0dOpbd7f75qTbhxIJ1t6I0awvec5sSakySk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=AUdAaUMNLb2enSgGlL1aHDDa98aWN1S1YSu41FGXNtFbw4JNNbSKABbfJWwZxDzTz
         O4ZwYaABz5ZEeO+EuP3fKM0gcNZpZgqa6C1qMl3UF9d09LmDn4X+YpG0RW2xedYtt5
         Gt4+DvjZlC2hMD9a9SSozZMAY8EMxIHkZgWVfca4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R0FDPx020478
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 19:15:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 19:15:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 19:15:13 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FDLX005041;
        Mon, 26 Aug 2019 19:15:13 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x7R0FCZ19052;
        Mon, 26 Aug 2019 19:15:12 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Joerg Roedel <joro@8bytes.org>, Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] ARM: OMAP2+: Plug in device_enable/idle ops for IOMMUs
Date:   Mon, 26 Aug 2019 19:14:51 -0500
Message-ID: <20190827001452.31930-2-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827001452.31930-1-s-anna@ti.com>
References: <20190827001452.31930-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP IOMMU driver requires the device_enable/idle platform
data ops on all the IOMMU devices to be able to enable and disable
the clocks after commit db8918f61d51 ("iommu/omap: streamline
enable/disable through runtime pm callbacks"). Plug in these
pdata ops for all the existing IOMMUs through pdata quirks to
maintain functionality.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 6c6f8fce854e..dbe8d9718f70 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -89,6 +89,8 @@ static struct iommu_platform_data omap3_iommu_pdata = {
 	.reset_name = "mmu",
 	.assert_reset = omap_device_assert_hardreset,
 	.deassert_reset = omap_device_deassert_hardreset,
+	.device_enable = omap_device_enable,
+	.device_idle = omap_device_idle,
 };
 
 static int omap3_sbc_t3730_twl_callback(struct device *dev,
@@ -424,6 +426,8 @@ static struct iommu_platform_data omap4_iommu_pdata = {
 	.reset_name = "mmu_cache",
 	.assert_reset = omap_device_assert_hardreset,
 	.deassert_reset = omap_device_deassert_hardreset,
+	.device_enable = omap_device_enable,
+	.device_idle = omap_device_idle,
 };
 #endif
 
-- 
2.22.0

