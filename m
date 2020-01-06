Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8F4131101
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgAFLA7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:00:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59216 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgAFLA7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:00:59 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B0qqb071019;
        Mon, 6 Jan 2020 05:00:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308452;
        bh=tyR7RY4j5vigXodKKfJc6EaOKgFAKmeLtj9iUUvThaE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=n5N0lsLr0DZLD1GL9d41e8uPO/H+7tk0r/+FRyh0vQEHsWM1tArJxPq0I8KehFcuH
         +5SmSIKT6yUuVkjWGtk+r9rYzeIQADWnNEiimEuY0LlMlGXas76Arei1wcWk8EGlYL
         d02IW+QEAIbCvU3Dq/BCgDlV519s4v66kdUidI7M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006B0qt6101400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:00:52 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:00:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:00:52 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00Jv007044;
        Mon, 6 Jan 2020 05:00:46 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 06/11] mmc: sdhci: Refactor sdhci_set_timeout()
Date:   Mon, 6 Jan 2020 16:31:28 +0530
Message-ID: <20200106110133.13791-7-faiz_abbas@ti.com>
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

Refactor sdhci_set_timeout() such that platform drivers can do some
functionality in a set_timeout() callback and then call
__sdhci_set_timeout() to complete the operation.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 drivers/mmc/host/sdhci.c | 36 +++++++++++++++++++-----------------
 drivers/mmc/host/sdhci.h |  1 +
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 56f46bd7cdad..adb3e8ccefb8 100644
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

