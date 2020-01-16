Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F380F13D858
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAPKvQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:51:16 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40842 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgAPKvM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:51:12 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAp4LP013250;
        Thu, 16 Jan 2020 04:51:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171864;
        bh=2vmT1E2KmhvC/4bKeChwhgsTaQiClx8DyYkTcheakOk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tlu6dSYK0uthVCPcS1PLXL7JORir3zURuC3byoD9vDqfdgXO2rNpXiqazCaKcTeN4
         od6MwOgWDfW6LV7+n6YAFTx5/2OZ0seMCt04ORYKeLOjE84RrNAbId1G1G/PcG5TDJ
         eTiSeleQCt0HdTUBCtDB5ImcKtWhL6TbVCDUYu3k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GAp4el101636
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 04:51:04 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:51:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:51:04 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdc000589;
        Thu, 16 Jan 2020 04:51:01 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 10/10] mmc: sdhci-omap: Add special reset capability
Date:   Thu, 16 Jan 2020 16:21:54 +0530
Message-ID: <20200116105154.7685-11-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200116105154.7685-1-faiz_abbas@ti.com>
References: <20200116105154.7685-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some omap controllers need software to monitor a 0->1->0 for software
reset. Add a SDHCI_OMAP_SPECIAL_RESET flag to indicate this.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-omap.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 5433c9e6ac10..882053151a47 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -86,6 +86,7 @@
 
 /* sdhci-omap controller flags */
 #define SDHCI_OMAP_REQUIRE_IODELAY	BIT(0)
+#define SDHCI_OMAP_SPECIAL_RESET	BIT(1)
 
 struct sdhci_omap_data {
 	u32 offset;
@@ -779,15 +780,35 @@ static void sdhci_omap_set_uhs_signaling(struct sdhci_host *host,
 	sdhci_omap_start_clock(omap_host);
 }
 
+#define MMC_TIMEOUT_US		20000		/* 20000 micro Sec */
 static void sdhci_omap_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned long limit = MMC_TIMEOUT_US;
+	unsigned long i = 0;
 
 	/* Don't reset data lines during tuning operation */
 	if (omap_host->is_tuning)
 		mask &= ~SDHCI_RESET_DATA;
 
+	if (omap_host->flags & SDHCI_OMAP_SPECIAL_RESET) {
+		sdhci_writeb(host, mask, SDHCI_SOFTWARE_RESET);
+		while ((!(sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)) &&
+		       (i++ < limit))
+			udelay(1);
+		i = 0;
+		while ((sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask) &&
+		       (i++ < limit))
+			udelay(1);
+
+		if (sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)
+			dev_err(mmc_dev(host->mmc),
+				"Timeout waiting on controller reset in %s\n",
+				__func__);
+		return;
+	}
+
 	sdhci_reset(host, mask);
 }
 
@@ -900,10 +921,12 @@ static const struct sdhci_omap_data k2g_data = {
 
 static const struct sdhci_omap_data am335_data = {
 	.offset = 0x200,
+	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data am437_data = {
 	.offset = 0x200,
+	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data dra7_data = {
-- 
2.19.2

