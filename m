Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1A413D848
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgAPKvB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:51:01 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35784 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgAPKu6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:50:58 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAopJa038790;
        Thu, 16 Jan 2020 04:50:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171851;
        bh=dsSiYWssGg/q7Zj16AozoGy4moKRnlNy0tuzhz3QozQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rZMDz4Q+QEm6FIM+NZ5FsaCPNN9+6OQKFVlP5xlA2Y6u/HL7UsMkkzvscSIj2TPQp
         SvIaS7eXpo+HE9S7t1aqDz657p/rUDKlHlPT+5N3rf7JoIKb/Pcy9uxcLz9ejEfVQz
         1GXhxTp4fGSyH4YGrpiKjTZ3AMs17CdR1Lwyxq4o=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GAopF4016835
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 04:50:51 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:50:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:50:51 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdY000589;
        Thu, 16 Jan 2020 04:50:48 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 06/10] mmc: sdhci: Refactor sdhci_set_timeout()
Date:   Thu, 16 Jan 2020 16:21:50 +0530
Message-ID: <20200116105154.7685-7-faiz_abbas@ti.com>
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

Refactor sdhci_set_timeout() such that platform drivers can do some
functionality in a set_timeout() callback and then call
__sdhci_set_timeout() to complete the operation.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci.c | 36 +++++++++++++++++++-----------------
 drivers/mmc/host/sdhci.h |  1 +
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 37561333fda4..104203addd70 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1004,27 +1004,29 @@ void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
 }
 EXPORT_SYMBOL_GPL(sdhci_set_data_timeout_irq);
 
-static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
+void __sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
 {
-	u8 count;
+	bool too_big = false;
+	u8 count = sdhci_calc_timeout(host, cmd, &too_big);
 
-	if (host->ops->set_timeout) {
-		host->ops->set_timeout(host, cmd);
-	} else {
-		bool too_big = false;
-
-		count = sdhci_calc_timeout(host, cmd, &too_big);
+	if (too_big &&
+	    host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) {
+		sdhci_calc_sw_timeout(host, cmd);
+		sdhci_set_data_timeout_irq(host, false);
+	} else if (!(host->ier & SDHCI_INT_DATA_TIMEOUT)) {
+		sdhci_set_data_timeout_irq(host, true);
+	}
 
-		if (too_big &&
-		    host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) {
-			sdhci_calc_sw_timeout(host, cmd);
-			sdhci_set_data_timeout_irq(host, false);
-		} else if (!(host->ier & SDHCI_INT_DATA_TIMEOUT)) {
-			sdhci_set_data_timeout_irq(host, true);
-		}
+	sdhci_writeb(host, count, SDHCI_TIMEOUT_CONTROL);
+}
+EXPORT_SYMBOL_GPL(__sdhci_set_timeout);
 
-		sdhci_writeb(host, count, SDHCI_TIMEOUT_CONTROL);
-	}
+static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
+{
+	if (host->ops->set_timeout)
+		host->ops->set_timeout(host, cmd);
+	else
+		__sdhci_set_timeout(host, cmd);
 }
 
 static void sdhci_initialize_data(struct sdhci_host *host,
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 928c6f35fcad..1fe230c2ed84 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -804,5 +804,6 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
 void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable);
+void __sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd);
 
 #endif /* __SDHCI_HW_H */
-- 
2.19.2

