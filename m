Return-Path: <linux-omap+bounces-4057-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0BAF8AB3
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 10:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499575A249D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEE02ECD20;
	Fri,  4 Jul 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA7g8DpE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A72E9749;
	Fri,  4 Jul 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615688; cv=none; b=liXG2B63lmdV+pXPCThnHzGlb412aDdk02+WU3Oq2hEQ1xf+DosSaLagnPrt0nT8v2wh/DaLcj00jnQp+9AMlQujZZ+esrD81S0B20gfLxrMF3hP4i9mwnmSeIL5Qx7YsBXFgN8e7ZkNbN5he5oPmX99wijTmH30e01iIDHmPAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615688; c=relaxed/simple;
	bh=SFpwLRZISop0furwoQJo8BG1JtgCAauHXFOG/4Gn+xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dSK/Clg1H3sLT3AWp012kDlJqIzcJoddFhPWko0jnfQatvCCKj1Gd3tcpLfsfaWIeNas6czme7YBsH4RkOn35Yva+1LcICTf6vxQ1EYNOIIZhWxvM00shuIKeYxMVL0d65LrUfr5umleitE8D6mgZVtPMgUBu+cWhDRwh9cRQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA7g8DpE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615686; x=1783151686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SFpwLRZISop0furwoQJo8BG1JtgCAauHXFOG/4Gn+xk=;
  b=KA7g8DpEWRX7+46zZC8okEsgHPyvISFY1eVp0gzhu7QqlwTTVJ0dRwc7
   pky38ITuBiK+12kzap/Tsf8z02ENlZcCoWAwUd3OZ6f7WAu88WopQMLYF
   5vK5YwhgxyXjM3Yg7uS58FfMewbO5iLqxmLBgn88kFh8xOa2epLfYXSTy
   2BPLwGEwZuUTaGiv/CAsjkH1AfHytfd+Vfb+hRUprGTJ4rVVnhXdss2C8
   6VCMJx6mi+hCaZu7heJtjBGfxNGELIYqjG96RvvCiTghjczm3z7CADywk
   +JbVhgyCOFZ6Eterii1Ox3eqal+KoVYi0LMnPnGRAstyK0sB5heRvCY7T
   A==;
X-CSE-ConnectionGUID: HfRR6UElRG+Gruv4lCFTTA==
X-CSE-MsgGUID: 7v3tsprhS2yAYHALoDA6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194133"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194133"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:45 -0700
X-CSE-ConnectionGUID: djc62gbKTxiURws2GKOgUA==
X-CSE-MsgGUID: e/Hfg5C4SBehYt7AQVbbsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616576"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:38 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 184434445A;
	Fri,  4 Jul 2025 10:54:36 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 46/80] net: ethernet: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:35 +0300
Message-Id: <20250704075435.3220683-1-sakari.ailus@linux.intel.com>
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

 drivers/net/ethernet/cadence/macb_main.c  | 5 -----
 drivers/net/ethernet/freescale/fec_main.c | 8 --------
 drivers/net/ethernet/renesas/ravb_main.c  | 4 ----
 drivers/net/ethernet/ti/davinci_mdio.c    | 7 -------
 4 files changed, 24 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 53aaf6b08e39..9b7cbb3e3108 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -360,7 +360,6 @@ static int macb_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
 	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
 
 mdio_read_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -406,7 +405,6 @@ static int macb_mdio_read_c45(struct mii_bus *bus, int mii_id, int devad,
 	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
 
 mdio_read_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -438,7 +436,6 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 		goto mdio_write_exit;
 
 mdio_write_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -484,7 +481,6 @@ static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
 		goto mdio_write_exit;
 
 mdio_write_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -5358,7 +5354,6 @@ static int macb_probe(struct platform_device *pdev)
 		    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
 		    dev->base_addr, dev->irq, dev->dev_addr);
 
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index d4eed252ad40..e6979599ae7e 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2207,7 +2207,6 @@ static int fec_enet_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
 	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2256,7 +2255,6 @@ static int fec_enet_mdio_read_c45(struct mii_bus *bus, int mii_id,
 	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2288,7 +2286,6 @@ static int fec_enet_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	if (ret)
 		netdev_err(fep->netdev, "MDIO write timeout\n");
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2332,7 +2329,6 @@ static int fec_enet_mdio_write_c45(struct mii_bus *bus, int mii_id,
 		netdev_err(fep->netdev, "MDIO write timeout\n");
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2814,7 +2810,6 @@ static void fec_enet_get_regs(struct net_device *ndev,
 		buf[off] = readl(&theregs[off]);
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -3590,7 +3585,6 @@ fec_enet_open(struct net_device *ndev)
 err_enet_alloc:
 	fec_enet_clk_enable(ndev, false);
 clk_enable:
-	pm_runtime_mark_last_busy(&fep->pdev->dev);
 	pm_runtime_put_autosuspend(&fep->pdev->dev);
 	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
 	return ret;
@@ -3621,7 +3615,6 @@ fec_enet_close(struct net_device *ndev)
 		cpu_latency_qos_remove_request(&fep->pm_qos_req);
 
 	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
-	pm_runtime_mark_last_busy(&fep->pdev->dev);
 	pm_runtime_put_autosuspend(&fep->pdev->dev);
 
 	fec_enet_free_buffers(ndev);
@@ -4568,7 +4561,6 @@ fec_probe(struct platform_device *pdev)
 
 	INIT_WORK(&fep->tx_timeout_work, fec_enet_timeout_work);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c9f4976a3527..b8bfc3cdbb6b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1974,7 +1974,6 @@ static int ravb_open(struct net_device *ndev)
 out_set_reset:
 	ravb_set_opmode(ndev, CCC_OPC_RESET);
 out_rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 out_napi_off:
 	if (info->nc_queues)
@@ -2383,7 +2382,6 @@ static int ravb_close(struct net_device *ndev)
 	if (error)
 		return error;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -3089,7 +3087,6 @@ static int ravb_probe(struct platform_device *pdev)
 	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
 		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
@@ -3274,7 +3271,6 @@ static int ravb_resume(struct device *dev)
 
 out_rpm_put:
 	if (!priv->wol_enabled) {
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 
diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 68507126be8e..9f049ebbf107 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -234,7 +234,6 @@ static int davinci_mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
 
 	ret = mdiobb_read_c22(bus, phy, reg);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -251,7 +250,6 @@ static int davinci_mdiobb_write_c22(struct mii_bus *bus, int phy, int reg,
 
 	ret = mdiobb_write_c22(bus, phy, reg, val);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -268,7 +266,6 @@ static int davinci_mdiobb_read_c45(struct mii_bus *bus, int phy, int devad,
 
 	ret = mdiobb_read_c45(bus, phy, devad, reg);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -285,7 +282,6 @@ static int davinci_mdiobb_write_c45(struct mii_bus *bus, int phy, int devad,
 
 	ret = mdiobb_write_c45(bus, phy, devad, reg, val);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -332,7 +328,6 @@ static int davinci_mdio_common_reset(struct davinci_mdio_data *data)
 	data->bus->phy_mask = phy_mask;
 
 done:
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return 0;
@@ -441,7 +436,6 @@ static int davinci_mdio_read(struct mii_bus *bus, int phy_id, int phy_reg)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 	return ret;
 }
@@ -478,7 +472,6 @@ static int davinci_mdio_write(struct mii_bus *bus, int phy_id,
 		break;
 	}
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
-- 
2.39.5


