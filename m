Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47D59DA7B
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 02:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfH0APZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 20:15:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36472 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbfH0APY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 20:15:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FE6h125381;
        Mon, 26 Aug 2019 19:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566864914;
        bh=VGvGOml4Hwxt6/SECSn+6qFGSur7ryz1rS5cpT5i08g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kPSZQov1pPjdwZfruXOz4Zm80SrtwoBlTne7gijLBHKqlGmaXL2ByWbE7iLwrYu74
         gOTmcjdHysMtmmrdPRbwf3ovO2wFw+NU8p4JAbvUQb1vb5JWifV6OQMvxt58DxFm0j
         B0/oUj58sPSfGOUfmXf9YDbLTY1a8vNLSDs7tHRI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R0FEga022369
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 19:15:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 19:15:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 19:15:14 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FEKU005062;
        Mon, 26 Aug 2019 19:15:14 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x7R0FEZ19069;
        Mon, 26 Aug 2019 19:15:14 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Joerg Roedel <joro@8bytes.org>, Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] ARM: OMAP2+: Add pdata for OMAP3 ISP IOMMU
Date:   Mon, 26 Aug 2019 19:14:52 -0500
Message-ID: <20190827001452.31930-3-s-anna@ti.com>
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

The OMAP3 ISP IOMMU does not have any reset lines, so it didn't
need any pdata previously. The OMAP IOMMU driver now requires the
platform data ops for device_enable/idle on all the IOMMU devices
after commit db8918f61d51 ("iommu/omap: streamline enable/disable
through runtime pm callbacks") to enable/disable the clocks properly
and maintain the reference count and the omap_hwmod state machine.
So, add these callbacks through iommu pdata quirks for the OMAP3
ISP IOMMU.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index dbe8d9718f70..3d597fb962e9 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -93,6 +93,11 @@ static struct iommu_platform_data omap3_iommu_pdata = {
 	.device_idle = omap_device_idle,
 };
 
+static struct iommu_platform_data omap3_iommu_isp_pdata = {
+	.device_enable = omap_device_enable,
+	.device_idle = omap_device_idle,
+};
+
 static int omap3_sbc_t3730_twl_callback(struct device *dev,
 					   unsigned gpio,
 					   unsigned ngpio)
@@ -621,6 +626,8 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 #ifdef CONFIG_ARCH_OMAP3
 	OF_DEV_AUXDATA("ti,omap2-iommu", 0x5d000000, "5d000000.mmu",
 		       &omap3_iommu_pdata),
+	OF_DEV_AUXDATA("ti,omap2-iommu", 0x480bd400, "480bd400.mmu",
+		       &omap3_iommu_isp_pdata),
 	OF_DEV_AUXDATA("ti,omap3-smartreflex-core", 0x480cb000,
 		       "480cb000.smartreflex", &omap_sr_pdata[OMAP_SR_CORE]),
 	OF_DEV_AUXDATA("ti,omap3-smartreflex-mpu-iva", 0x480c9000,
-- 
2.22.0

