Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803E976E64A
	for <lists+linux-omap@lfdr.de>; Thu,  3 Aug 2023 13:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbjHCLDc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Aug 2023 07:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235668AbjHCLDD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Aug 2023 07:03:03 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF01E3A95;
        Thu,  3 Aug 2023 04:02:54 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 373B2S7m010391;
        Thu, 3 Aug 2023 06:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691060548;
        bh=CoQHbB7ASV/+6Bp+MG8mFHgYRak2hFdXnN3fvXrjZeg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HYbA4WIHBpEb8TA/Cte4BbfNV1sPAhQFOw56VMRPcGQh32mJjnWsMduppB516OEaF
         cyYf3gyX7ZxixgzPg6BMOwKm0WBPfHjBihME3KUqkFl35KqcR2GMZGo4b/jshAHQIQ
         5ZgxMc0n7zXh4fir/12uWQKKqpwMrF/0uwyVJGq4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 373B2SQQ049893
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Aug 2023 06:02:28 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 06:02:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 06:02:27 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 373B2R9V026296;
        Thu, 3 Aug 2023 06:02:27 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 373B2Qva022634;
        Thu, 3 Aug 2023 06:02:27 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        MD Danish Anwar <danishanwar@ti.com>
CC:     <nm@ti.com>, <srk@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/4] net: ti: icssg-prueth: am65x SR2.0 add 10M full duplex support
Date:   Thu, 3 Aug 2023 16:31:53 +0530
Message-ID: <20230803110153.3309577-5-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803110153.3309577-1-danishanwar@ti.com>
References: <20230803110153.3309577-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko@ti.com>

For AM65x SR2.0 it's required to enable IEP1 in raw 64bit mode which is
used by PRU FW to monitor the link and apply w/a for 10M link issue.
Note. No public errata available yet.

Without this w/a the PRU FW will stuck if link state changes under TX
traffic pressure.

Hence, add support for 10M full duplex for AM65x SR2.0:
 - add new IEP API to enable IEP, but without PTP support
 - add pdata quirk_10m_link_issue to enable 10M link issue w/a.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icss_iep.c     | 26 ++++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icss_iep.h     |  2 ++
 drivers/net/ethernet/ti/icssg/icssg_config.c |  6 +++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 17 +++++++++++--
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ee333cf14776..dfb836aef2e5 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -721,6 +721,32 @@ void icss_iep_put(struct icss_iep *iep)
 }
 EXPORT_SYMBOL_GPL(icss_iep_put);
 
+void icss_iep_init_fw(struct icss_iep *iep)
+{
+	/* start IEP for FW use in raw 64bit mode, no PTP support */
+	iep->clk_tick_time = iep->def_inc;
+	iep->cycle_time_ns = 0;
+	iep->ops = NULL;
+	iep->clockops_data = NULL;
+	icss_iep_set_default_inc(iep, iep->def_inc);
+	icss_iep_set_compensation_inc(iep, iep->def_inc);
+	icss_iep_set_compensation_count(iep, 0);
+	regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, iep->refclk_freq / 10); /* 100 ms pulse */
+	regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
+	if (iep->plat_data->flags & ICSS_IEP_SLOW_COMPEN_REG_SUPPORT)
+		icss_iep_set_slow_compensation_count(iep, 0);
+
+	icss_iep_enable(iep);
+	icss_iep_settime(iep, 0);
+}
+EXPORT_SYMBOL_GPL(icss_iep_init_fw);
+
+void icss_iep_exit_fw(struct icss_iep *iep)
+{
+	icss_iep_disable(iep);
+}
+EXPORT_SYMBOL_GPL(icss_iep_exit_fw);
+
 int icss_iep_init(struct icss_iep *iep, const struct icss_iep_clockops *clkops,
 		  void *clockops_data, u32 cycle_time_ns)
 {
diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.h b/drivers/net/ethernet/ti/icssg/icss_iep.h
index 9c7f4d0a0916..803a4b714893 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.h
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.h
@@ -35,5 +35,7 @@ int icss_iep_exit(struct icss_iep *iep);
 int icss_iep_get_count_low(struct icss_iep *iep);
 int icss_iep_get_count_hi(struct icss_iep *iep);
 int icss_iep_get_ptp_clock_idx(struct icss_iep *iep);
+void icss_iep_init_fw(struct icss_iep *iep);
+void icss_iep_exit_fw(struct icss_iep *iep);
 
 #endif /* __NET_TI_ICSS_IEP_H */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
index ab648d3efe85..4c2b5d496670 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
@@ -210,6 +210,9 @@ void icssg_config_ipg(struct prueth_emac *emac)
 	case SPEED_100:
 		icssg_mii_update_ipg(prueth->mii_rt, slice, MII_RT_TX_IPG_100M);
 		break;
+	case SPEED_10:
+		icssg_mii_update_ipg(prueth->mii_rt, slice, MII_RT_TX_IPG_100M);
+		break;
 	default:
 		/* Other links speeds not supported */
 		netdev_err(emac->ndev, "Unsupported link speed\n");
@@ -440,6 +443,9 @@ void icssg_config_set_speed(struct prueth_emac *emac)
 	case SPEED_100:
 		fw_speed = FW_LINK_SPEED_100M;
 		break;
+	case SPEED_10:
+		fw_speed = FW_LINK_SPEED_10M;
+		break;
 	default:
 		/* Other links speeds not supported */
 		netdev_err(emac->ndev, "Unsupported link speed\n");
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 28a6deb8d4aa..40cb86872470 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1131,7 +1131,6 @@ static int emac_phy_connect(struct prueth_emac *emac)
 
 	/* remove unsupported modes */
 	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
-	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
 	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
 	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
 	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
@@ -2081,13 +2080,20 @@ static int prueth_probe(struct platform_device *pdev)
 		goto free_pool;
 	}
 
+	if (prueth->pdata.quirk_10m_link_issue) {
+		/* Enable IEP1 for FW in 64bit mode as W/A for 10M FD link detect issue under TX
+		 * traffic.
+		 */
+		icss_iep_init_fw(prueth->iep1);
+	}
+
 	/* setup netdev interfaces */
 	if (eth0_node) {
 		ret = prueth_netdev_init(prueth, eth0_node);
 		if (ret) {
 			dev_err_probe(dev, ret, "netdev init %s failed\n",
 				      eth0_node->name);
-			goto netdev_exit;
+			goto exit_iep;
 		}
 		prueth->emac[PRUETH_MAC0]->iep = prueth->iep0;
 	}
@@ -2158,6 +2164,10 @@ static int prueth_probe(struct platform_device *pdev)
 		prueth_netdev_exit(prueth, eth_node);
 	}
 
+exit_iep:
+	if (prueth->pdata.quirk_10m_link_issue)
+		icss_iep_exit_fw(prueth->iep1);
+
 free_pool:
 	gen_pool_free(prueth->sram_pool,
 		      (unsigned long)prueth->msmcram.va, msmc_ram_size);
@@ -2203,6 +2213,9 @@ static void prueth_remove(struct platform_device *pdev)
 		prueth_netdev_exit(prueth, eth_node);
 	}
 
+	if (prueth->pdata.quirk_10m_link_issue)
+		icss_iep_exit_fw(prueth->iep1);
+
 	icss_iep_put(prueth->iep1);
 	icss_iep_put(prueth->iep0);
 
-- 
2.34.1

