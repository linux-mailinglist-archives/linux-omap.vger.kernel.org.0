Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B595D11BDCC
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 21:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfLKUYp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 15:24:45 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34034 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLKUYp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 15:24:45 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBKOaU7106830;
        Wed, 11 Dec 2019 14:24:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576095876;
        bh=XOokrT+freFORqVJ8mOrjS85/EC9e13R8A2WaBBWr8o=;
        h=From:To:CC:Subject:Date;
        b=SSE5Z1gpd8cEZ+Yv2G4LqsDhfgfhTaufX81SZc19PLwM5rD255jkhBFtT2zYZ6RJD
         09npLkZxbY1L96PhL+Yadgt2rvAPvQGQmDGDKEpjZqE5CQq4kxF6PJ1DVRcNCOJFGE
         qMsuEOM9u+rQzMgV9Oeq7GZbl0A+YUzXMWGjijwM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBKOaZZ011827
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 14:24:36 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 14:24:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 14:24:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBKOaew059579;
        Wed, 11 Dec 2019 14:24:36 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
CC:     Tony Lindgren <tony@atomide.com>, Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH] ARM: OMAP2+: am43xx: Add lcdc clockdomain
Date:   Wed, 11 Dec 2019 14:25:58 -0600
Message-ID: <20191211202558.5988-1-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As described in AM437x TRM, spruhl7h, Revised January 2018, there is
an LCDC clockdomain present in the PER power domain. Although it is
entirely unused on AM437x, it should be defined along with the other
clockdomains so it can be shut off by Linux as there are no users.

Reported-by: Munan Xu <munan@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/mach-omap2/clockdomains43xx_data.c | 10 ++++++++++
 arch/arm/mach-omap2/prcm43xx.h              |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/mach-omap2/clockdomains43xx_data.c b/arch/arm/mach-omap2/clockdomains43xx_data.c
index 751708d727af..c96a2b1efbad 100644
--- a/arch/arm/mach-omap2/clockdomains43xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains43xx_data.c
@@ -84,6 +84,15 @@ static struct clockdomain l3s_tsc_43xx_clkdm = {
 	.flags		  = CLKDM_CAN_SWSUP,
 };
 
+static struct clockdomain lcdc_43xx_clkdm = {
+	.name		  = "lcdc_clkdm",
+	.pwrdm		  = { .name = "per_pwrdm" },
+	.prcm_partition	  = AM43XX_CM_PARTITION,
+	.cm_inst	  = AM43XX_CM_PER_INST,
+	.clkdm_offs	  = AM43XX_CM_PER_LCDC_CDOFFS,
+	.flags		  = CLKDM_CAN_SWSUP,
+};
+
 static struct clockdomain dss_43xx_clkdm = {
 	.name		  = "dss_clkdm",
 	.pwrdm		  = { .name = "per_pwrdm" },
@@ -173,6 +182,7 @@ static struct clockdomain *clockdomains_am43xx[] __initdata = {
 	&pruss_ocp_43xx_clkdm,
 	&ocpwp_l3_43xx_clkdm,
 	&l3s_tsc_43xx_clkdm,
+	&lcdc_43xx_clkdm,
 	&dss_43xx_clkdm,
 	&l3_aon_43xx_clkdm,
 	&emif_43xx_clkdm,
diff --git a/arch/arm/mach-omap2/prcm43xx.h b/arch/arm/mach-omap2/prcm43xx.h
index e2ad14e77064..7078a61c1d3f 100644
--- a/arch/arm/mach-omap2/prcm43xx.h
+++ b/arch/arm/mach-omap2/prcm43xx.h
@@ -68,6 +68,7 @@
 #define AM43XX_CM_PER_ICSS_CDOFFS			0x0300
 #define AM43XX_CM_PER_L4LS_CDOFFS			0x0400
 #define AM43XX_CM_PER_EMIF_CDOFFS			0x0700
+#define AM43XX_CM_PER_LCDC_CDOFFS			0x0800
 #define AM43XX_CM_PER_DSS_CDOFFS			0x0a00
 #define AM43XX_CM_PER_CPSW_CDOFFS			0x0b00
 #define AM43XX_CM_PER_OCPWP_L3_CDOFFS			0x0c00
-- 
2.20.1

