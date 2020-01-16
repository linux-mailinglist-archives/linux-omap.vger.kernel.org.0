Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96DF13D851
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgAPKvI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:51:08 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44882 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgAPKvD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:51:03 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAolLC050198;
        Thu, 16 Jan 2020 04:50:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171848;
        bh=4g/35Gsgc1IREjTOLyGG4YbzvNoV+ijmSZyUxwM03Z0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=u4ARFZp4e1m8hyy7+T81vvJexrQf9YQWzX1RjMvXCHzaQR61mN65wQzGx8xn5tTR5
         ytIGyDpE9bhT8RWHLdRZlYiSxuCWujv7LKFsp1gOgy9PrvstHFLssOy8xSbwNFnG/9
         prBF01SyuUqBFs9MuaqGy7XZi/M8RKW1FZZ8C8RU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GAolb5088306
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 04:50:47 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:50:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:50:47 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdX000589;
        Thu, 16 Jan 2020 04:50:44 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 05/10] mmc: sdhci: Convert sdhci_set_timeout_irq() to non-static
Date:   Thu, 16 Jan 2020 16:21:49 +0530
Message-ID: <20200116105154.7685-6-faiz_abbas@ti.com>
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

Export sdhci_set_timeout_irq() so that it is accessible from platform drivers.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci.c | 3 ++-
 drivers/mmc/host/sdhci.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 4d48129de5e4..37561333fda4 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -993,7 +993,7 @@ static void sdhci_set_transfer_irqs(struct sdhci_host *host)
 	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
 }
 
-static void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
+void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
 {
 	if (enable)
 		host->ier |= SDHCI_INT_DATA_TIMEOUT;
@@ -1002,6 +1002,7 @@ static void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
 	sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
 	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
 }
+EXPORT_SYMBOL_GPL(sdhci_set_data_timeout_irq);
 
 static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
 {
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 3166b3ecef89..928c6f35fcad 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -803,5 +803,6 @@ void sdhci_reset_tuning(struct sdhci_host *host);
 void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
+void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable);
 
 #endif /* __SDHCI_HW_H */
-- 
2.19.2

