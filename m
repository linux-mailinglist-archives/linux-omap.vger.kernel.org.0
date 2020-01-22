Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B14DC145AB1
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2020 18:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgAVRUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jan 2020 12:20:33 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40858 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVRUd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jan 2020 12:20:33 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MHKV1E129763;
        Wed, 22 Jan 2020 11:20:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579713631;
        bh=t6KGLVYJQpwHj2sIUybz6rM+CLp37Y5hIdiuP1wCRxo=;
        h=From:To:CC:Subject:Date;
        b=YzAMhUR0DquXSFOOmTufYa4XuIVVkfuLC3zGh6p+/mPVvbRVWvJS1vwq1Lhf4OTlT
         aphqpcBH1t3IRF8JBXUqIAno1WJVr4C6ISCIBU63KdaJf05hAv4gduIi4amEipXjYL
         s9Hm2mPmVdFpkHVdQC+3N8F8Gw2KJhTXq+7jc2yw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MHKV8a069535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jan 2020 11:20:31 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 11:20:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 11:20:30 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MHKU1P029533;
        Wed, 22 Jan 2020 11:20:30 -0600
Received: from localhost ([10.250.69.73])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 00MHKT326225;
        Wed, 22 Jan 2020 11:20:29 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Dan Murphy <dmurphy@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH] ARM: OMAP2+: Fix undefined reference to omap_secure_init
Date:   Wed, 22 Jan 2020 12:20:17 -0500
Message-ID: <20200122172017.4791-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap_secure_init() is now called from all OMAP2+ platforms during their
init_early() call. This function is in omap-secure.o so include that
in the build for these platforms.

Fixes: db711893eac8 ("ARM: OMAP2+: Add omap_secure_init callback hook for secure initialization")
Reported-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
index f07cfda85156..e1135b9d67c6 100644
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -16,11 +16,11 @@ hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
 clock-common				= clock.o
 secure-common				= omap-smc.o omap-secure.o
 
-obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
+obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
-obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common)
-obj-$(CONFIG_SOC_OMAP5)	 += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_OMAP5)  += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_AM43XX) += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_DRA7XX) += $(hwmod-common) $(secure-common)
 
-- 
2.17.1

