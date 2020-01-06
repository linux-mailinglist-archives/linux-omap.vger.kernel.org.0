Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008121310F1
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgAFLAd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:00:33 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59174 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgAFLAc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:00:32 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B0OjR070841;
        Mon, 6 Jan 2020 05:00:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308424;
        bh=KIZMMqKpRdY+w4c8mvaDYXMr0ZWEtjVlt61MDaw0y4k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rVyHDuZHv0649bLCRwQ8d+r+Kav51mvlGLHJc7qjX8fyEoIBTd7hM1PMJnxQnaFUc
         6MU7LnP0BbSm4J5rRQyab+wyOXn2G3rUaT+ukWKzFw2riVKPkW93wjrwJRuxz+LIQ6
         PAl9YJ+aMPn4BmbnC2wqMjajVogwyAYN9QtBmFNU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006B0OmV033783
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:00:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:00:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:00:23 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00Jr007044;
        Mon, 6 Jan 2020 05:00:16 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 02/11] mmc: sdhci: Factor out some operations set to their own functions
Date:   Mon, 6 Jan 2020 16:31:24 +0530
Message-ID: <20200106110133.13791-3-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200106110133.13791-1-faiz_abbas@ti.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
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
---
 drivers/mmc/host/sdhci.c | 96 +++++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 41 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 1b1c26da3fe0..f6999054abcf 100644
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
@@ -1048,6 +1039,36 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
 	host->data_early = 0;
 	host->data->bytes_xfered = 0;
 
+}
+
+static inline void sdhci_set_block_info(struct sdhci_host *host,
+					struct mmc_data *data)
+{
+
+	/* Set the DMA boundary value and block size */
+	sdhci_writew(host,
+		     SDHCI_MAKE_BLKSZ(host->sdma_boundary, host->data->blksz),
+		     SDHCI_BLOCK_SIZE);
+	/*
+	 * For Version 4.10 onwards, if v4 mode is enabled, 32-bit Block Count
+	 * can be supported, in that case 16-bit block count register must be 0.
+	 */
+	if (host->version >= SDHCI_SPEC_410 && host->v4_mode &&
+	    (host->quirks2 & SDHCI_QUIRK2_USE_32BIT_BLK_CNT)) {
+		if (sdhci_readw(host, SDHCI_BLOCK_COUNT))
+			sdhci_writew(host, 0, SDHCI_BLOCK_COUNT);
+		sdhci_writew(host, host->data->blocks, SDHCI_32BIT_BLK_CNT);
+	} else {
+		sdhci_writew(host, host->data->blocks, SDHCI_BLOCK_COUNT);
+	}
+}
+
+static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
+{
+	struct mmc_data *data = cmd->data;
+
+	sdhci_initialize_data(host, data);
+
 	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
 		struct scatterlist *sg;
 		unsigned int length_mask, offset_mask;
@@ -1133,22 +1154,7 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
 
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
@@ -1245,22 +1251,10 @@ static bool sdhci_needs_reset(struct sdhci_host *host, struct mmc_request *mrq)
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
@@ -1276,6 +1270,23 @@ static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
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
 
@@ -1390,12 +1401,15 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
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

