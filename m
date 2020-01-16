Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF41813D83C
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgAPKus (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:50:48 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44806 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAPKur (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:50:47 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAobJQ050150;
        Thu, 16 Jan 2020 04:50:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171837;
        bh=e7mhL131meFfHXqNLxcDF2mevdid+GzhZqStQmQYOhQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=etswpo4oob4XHPc3Urmi3b6TqNeGER5JgWlZNvxM7I5TDFLY5I6upTkfsbezqcDpK
         owN1g2g4QtFqM+/mK7XYpd36YBL1HWjReYrmpTzu25S9eEvGMHnFCVVsyFGpT1oxDz
         Sv1KgEok9EKlAMhKhCp1uob7N7sWtMhODJJxWrdM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAobD0085076;
        Thu, 16 Jan 2020 04:50:37 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:50:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:50:37 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdU000589;
        Thu, 16 Jan 2020 04:50:34 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 02/10] mmc: sdhci: Factor out some operations set to their own functions
Date:   Thu, 16 Jan 2020 16:21:46 +0530
Message-ID: <20200116105154.7685-3-faiz_abbas@ti.com>
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

In preparation for adding external dma support, factor out data initialization,
block info and mrq_done to their own functions.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Tested-by: Baolin Wang <baolin.wang7@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci.c | 94 ++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 1b1c26da3fe0..53cd5d0c4290 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1025,18 +1025,9 @@ static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
 	}
 }
 
-static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
+static void sdhci_initialize_data(struct sdhci_host *host,
+				  struct mmc_data *data)
 {
-	struct mmc_data *data = cmd->data;
-
-	host->data_timeout = 0;
-
-	if (sdhci_data_line_cmd(cmd))
-		sdhci_set_timeout(host, cmd);
-
-	if (!data)
-		return;
-
 	WARN_ON(host->data);
 
 	/* Sanity checks */
@@ -1047,6 +1038,34 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
 	host->data = data;
 	host->data_early = 0;
 	host->data->bytes_xfered = 0;
+}
+
+static inline void sdhci_set_block_info(struct sdhci_host *host,
+					struct mmc_data *data)
+{
+	/* Set the DMA boundary value and block size */
+	sdhci_writew(host,
+		     SDHCI_MAKE_BLKSZ(host->sdma_boundary, data->blksz),
+		     SDHCI_BLOCK_SIZE);
+	/*
+	 * For Version 4.10 onwards, if v4 mode is enabled, 32-bit Block Count
+	 * can be supported, in that case 16-bit block count register must be 0.
+	 */
+	if (host->version >= SDHCI_SPEC_410 && host->v4_mode &&
+	    (host->quirks2 & SDHCI_QUIRK2_USE_32BIT_BLK_CNT)) {
+		if (sdhci_readw(host, SDHCI_BLOCK_COUNT))
+			sdhci_writew(host, 0, SDHCI_BLOCK_COUNT);
+		sdhci_writew(host, data->blocks, SDHCI_32BIT_BLK_CNT);
+	} else {
+		sdhci_writew(host, data->blocks, SDHCI_BLOCK_COUNT);
+	}
+}
+
+static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
+{
+	struct mmc_data *data = cmd->data;
+
+	sdhci_initialize_data(host, data);
 
 	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
 		struct scatterlist *sg;
@@ -1133,22 +1152,7 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
 
 	sdhci_set_transfer_irqs(host);
 
-	/* Set the DMA boundary value and block size */
-	sdhci_writew(host, SDHCI_MAKE_BLKSZ(host->sdma_boundary, data->blksz),
-		     SDHCI_BLOCK_SIZE);
-
-	/*
-	 * For Version 4.10 onwards, if v4 mode is enabled, 32-bit Block Count
-	 * can be supported, in that case 16-bit block count register must be 0.
-	 */
-	if (host->version >= SDHCI_SPEC_410 && host->v4_mode &&
-	    (host->quirks2 & SDHCI_QUIRK2_USE_32BIT_BLK_CNT)) {
-		if (sdhci_readw(host, SDHCI_BLOCK_COUNT))
-			sdhci_writew(host, 0, SDHCI_BLOCK_COUNT);
-		sdhci_writew(host, data->blocks, SDHCI_32BIT_BLK_CNT);
-	} else {
-		sdhci_writew(host, data->blocks, SDHCI_BLOCK_COUNT);
-	}
+	sdhci_set_block_info(host, data);
 }
 
 static inline bool sdhci_auto_cmd12(struct sdhci_host *host,
@@ -1245,22 +1249,10 @@ static bool sdhci_needs_reset(struct sdhci_host *host, struct mmc_request *mrq)
 		 (host->quirks & SDHCI_QUIRK_RESET_AFTER_REQUEST)));
 }
 
-static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
+static void sdhci_set_mrq_done(struct sdhci_host *host, struct mmc_request *mrq)
 {
 	int i;
 
-	if (host->cmd && host->cmd->mrq == mrq)
-		host->cmd = NULL;
-
-	if (host->data_cmd && host->data_cmd->mrq == mrq)
-		host->data_cmd = NULL;
-
-	if (host->data && host->data->mrq == mrq)
-		host->data = NULL;
-
-	if (sdhci_needs_reset(host, mrq))
-		host->pending_reset = true;
-
 	for (i = 0; i < SDHCI_MAX_MRQS; i++) {
 		if (host->mrqs_done[i] == mrq) {
 			WARN_ON(1);
@@ -1276,6 +1268,23 @@ static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
 	}
 
 	WARN_ON(i >= SDHCI_MAX_MRQS);
+}
+
+static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
+{
+	if (host->cmd && host->cmd->mrq == mrq)
+		host->cmd = NULL;
+
+	if (host->data_cmd && host->data_cmd->mrq == mrq)
+		host->data_cmd = NULL;
+
+	if (host->data && host->data->mrq == mrq)
+		host->data = NULL;
+
+	if (sdhci_needs_reset(host, mrq))
+		host->pending_reset = true;
+
+	sdhci_set_mrq_done(host, mrq);
 
 	sdhci_del_timer(host, mrq);
 
@@ -1390,12 +1399,15 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
 	}
 
 	host->cmd = cmd;
+	host->data_timeout = 0;
 	if (sdhci_data_line_cmd(cmd)) {
 		WARN_ON(host->data_cmd);
 		host->data_cmd = cmd;
+		sdhci_set_timeout(host, cmd);
 	}
 
-	sdhci_prepare_data(host, cmd);
+	if (cmd->data)
+		sdhci_prepare_data(host, cmd);
 
 	sdhci_writel(host, cmd->arg, SDHCI_ARGUMENT);
 
-- 
2.19.2

