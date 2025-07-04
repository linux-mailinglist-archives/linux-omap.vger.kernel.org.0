Return-Path: <linux-omap+bounces-4058-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC8AF8ABD
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 10:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8738F3AB303
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 08:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1D52EF29F;
	Fri,  4 Jul 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVgZjWwr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF92EBBB5;
	Fri,  4 Jul 2025 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615691; cv=none; b=iwy/wLubGT9HtLCvB1YtffjuiKUBZL2LKbtHHrVwApQFAWmr963sxTxO4iAZ9dxm2WSsnA2M+IIEAGN4Qqd357TVGJ2CT0cSiTirtCVhYsg2C/YYxOtgSAvu403cQZ8+oPeJWW+hbUzMgUC2Q5yhbA11ACCYultBamkXalpxGm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615691; c=relaxed/simple;
	bh=bnuZewOjDRj5uj/Q1wY38bM+p730Axef1k5VeKg2H+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tx4lJ71lmBm/bEWsFXNdl3WsTTtn/gNyJXmhaUesIgLo+/KjGWejkbPRlNU8zmTmAHTpVLN+QQToiIe2BHA+Rieqf2EXWrKQdZQUk7Tm9PSaCk43ARZapEzcH1OiI625eOgkiZSQpfya78sKzEY9mlTdYWMZYXM07nnS5wf4KaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVgZjWwr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615689; x=1783151689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bnuZewOjDRj5uj/Q1wY38bM+p730Axef1k5VeKg2H+A=;
  b=cVgZjWwrKrWtokBiZ299eIVyY7+xUZouZKxcLre2rUq1GxdXu8regUmZ
   6cXKe9/28ZKi67tGXNxKcVgvokG+frkNQ3gW2SyOw+lWOwju8AuOXce3O
   ohSzl8ZKzYnt+De/akrXPN5vRRZhZD8JvbpEZ/7aA+zGWcdTb+jYr7wKY
   Edcx/UYtBvMnx6co8gHr1MxXXLXRvMSqR9fOfPWWrIn8WJ3MzTPC8IcLM
   +sSXIkTXLI+mOhwrURdTMWG0pxb/2eLsiP6Gsh2THxoxfVQpT59Bzc/w/
   lpyoTzmu+k9F9TP2uMDztcsXnStTnExzCyUnHYb/FlN9vpDoJSoh9Am8D
   w==;
X-CSE-ConnectionGUID: vLyisTqVQFOn/o8r0UuJCA==
X-CSE-MsgGUID: b8DxJt/HT5Cobgd7qR+C0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194151"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:45 -0700
X-CSE-ConnectionGUID: vHcFFC2QSWGmYwlOvBh9Cw==
X-CSE-MsgGUID: zaZUVbpaQBiQnQCYrl+S7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616609"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:36 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 66F5344419;
	Fri,  4 Jul 2025 10:54:34 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Aubin Constans <aubin.constans@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:34 +0300
Message-Id: <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/mmc/core/core.c            | 1 -
 drivers/mmc/host/atmel-mci.c       | 2 --
 drivers/mmc/host/mmci.c            | 1 -
 drivers/mmc/host/omap_hsmmc.c      | 3 ---
 drivers/mmc/host/sdhci-esdhc-imx.c | 1 -
 drivers/mmc/host/sdhci-msm.c       | 1 -
 drivers/mmc/host/sdhci-omap.c      | 2 --
 drivers/mmc/host/sdhci-pxav3.c     | 2 --
 drivers/mmc/host/sdhci-sprd.c      | 1 -
 drivers/mmc/host/sdhci_am654.c     | 1 -
 drivers/mmc/host/tmio_mmc_core.c   | 1 -
 11 files changed, 16 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index a0e2dce70434..874c6fe92855 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -882,7 +882,6 @@ void mmc_put_card(struct mmc_card *card, struct mmc_ctx *ctx)
 	WARN_ON(ctx && host->claimer != ctx);
 
 	mmc_release_host(host);
-	pm_runtime_mark_last_busy(&card->dev);
 	pm_runtime_put_autosuspend(&card->dev);
 }
 EXPORT_SYMBOL(mmc_put_card);
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index c885c04e938a..43f92f48590f 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -541,7 +541,6 @@ static int atmci_regs_show(struct seq_file *s, void *v)
 	memcpy_fromio(buf, host->regs, ATMCI_REGS_SIZE);
 	spin_unlock_bh(&host->lock);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	seq_printf(s, "MR:\t0x%08x%s%s ",
@@ -2567,7 +2566,6 @@ static int atmci_probe(struct platform_device *pdev)
 	dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
 		 host->mapbase, irq, nr_slots);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index c70c64f8adc4..8367283647a9 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2082,7 +2082,6 @@ static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	if (!enable) {
-		pm_runtime_mark_last_busy(mmc_dev(mmc));
 		pm_runtime_put_autosuspend(mmc_dev(mmc));
 	}
 }
diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index bf3b9f5b067c..adc0d0b6ae37 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1663,7 +1663,6 @@ static int mmc_regs_show(struct seq_file *s, void *data)
 	seq_printf(s, "CAPA:\t\t0x%08x\n",
 			OMAP_HSMMC_READ(host->base, CAPA));
 
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 
 	return 0;
@@ -1954,7 +1953,6 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
 	}
 
 	omap_hsmmc_debugfs(mmc);
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 
 	return 0;
@@ -2031,7 +2029,6 @@ static int omap_hsmmc_resume(struct device *dev)
 	if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
 		omap_hsmmc_conf_bus_power(host);
 
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 64c27349d79f..a040c0896a7b 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2108,7 +2108,6 @@ static int sdhci_esdhc_resume(struct device *dev)
 	    esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_restore(host);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 732b65d4b61a..68e56251d5e8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2750,7 +2750,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto pm_runtime_disable;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 429d8a517fb6..cdb09605e009 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1370,7 +1370,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 		host->mmc->pm_caps |= MMC_PM_KEEP_POWER | MMC_PM_WAKE_SDIO_IRQ;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -1379,7 +1378,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	sdhci_cleanup_host(host);
 
 err_rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 err_rpm_disable:
 	pm_runtime_dont_use_autosuspend(dev);
diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index 34abf986573f..1371960e34eb 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -494,7 +494,6 @@ static int sdhci_pxav3_suspend(struct device *dev)
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
 		mmc_retune_needed(host->mmc);
 	ret = sdhci_suspend_host(host);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -507,7 +506,6 @@ static int sdhci_pxav3_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	ret = sdhci_resume_host(host);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index a5dec1a0e934..fe2fe52b23b2 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -863,7 +863,6 @@ static int sdhci_sprd_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_host;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index ea14d56558c4..e2c4a0049d61 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -986,7 +986,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 	/* Setting up autosuspend */
 	pm_runtime_set_autosuspend_delay(dev, SDHCI_AM654_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return 0;
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2cec463b5e00..21c2f9095bac 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -160,7 +160,6 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 
 		host->sdio_irq_enabled = false;
-		pm_runtime_mark_last_busy(mmc_dev(mmc));
 		pm_runtime_put_autosuspend(mmc_dev(mmc));
 	}
 }
-- 
2.39.5


