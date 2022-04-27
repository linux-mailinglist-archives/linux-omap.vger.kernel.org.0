Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4523E511FB0
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 20:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240166AbiD0Pou (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 11:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240197AbiD0Pop (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 11:44:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF3010FD3;
        Wed, 27 Apr 2022 08:41:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C76E61798;
        Wed, 27 Apr 2022 15:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C186C385AD;
        Wed, 27 Apr 2022 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651074082;
        bh=rE+qwrcYq1YEDwagHt9bw0Dmvq2A/QwK2cQtgGYtZKA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t+rRpvTelqAmnOxdhSnJBNQ97HYVO1XodTEWwDfdhbxiVpvUs+NWkAu00L0KAWCjP
         PcSQuS0lYSCwzFvNFQabbm9RTHxWFPt7HKSNJfJlwDdMEE8CRTiKRdFFSq1BcqRW5F
         Mld1jCYk7HsQSNZXkm00T4qPUjKnsHAcRqBYRN6thrfPCsmggIfeRUpFL78tLsBd/n
         RleASA3ke4E/qVXBqnOgH8c5zlPm8j0hYYNrt1nynlzoZRhN4Ol44vbGoMFmIhQXOL
         36VdePnn7Vku9k2R4p7RdwiICc+qF+FVqkxEWAfz3MvAstn5GaB2tKbZOvn7vvx3G/
         f8GLg0Qwv5hhA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        ulli.kroll@googlemail.com, linus.walleij@linaro.org,
        mlindner@marvell.com, stephen@networkplumber.org, nbd@nbd.name,
        john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
        matthias.bgg@gmail.com, grygorii.strashko@ti.com,
        wei.liu@kernel.org, paul@xen.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH net-next 01/14] eth: remove copies of the NAPI_POLL_WEIGHT define
Date:   Wed, 27 Apr 2022 08:40:58 -0700
Message-Id: <20220427154111.529975-2-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427154111.529975-1-kuba@kernel.org>
References: <20220427154111.529975-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Defining local versions of NAPI_POLL_WEIGHT with the same
values in the drivers just makes refactoring harder.

Drop the special defines in a bunch of drivers where the
removal is relatively simple so grouping into one patch
does not impact reviewability.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: ulli.kroll@googlemail.com
CC: linus.walleij@linaro.org
CC: mlindner@marvell.com
CC: stephen@networkplumber.org
CC: nbd@nbd.name
CC: john@phrozen.org
CC: sean.wang@mediatek.com
CC: Mark-MC.Lee@mediatek.com
CC: matthias.bgg@gmail.com
CC: grygorii.strashko@ti.com
CC: wei.liu@kernel.org
CC: paul@xen.org
CC: prabhakar.mahadev-lad.rj@bp.renesas.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-omap@vger.kernel.org
CC: xen-devel@lists.xenproject.org
---
 drivers/net/ethernet/cortina/gemini.c         | 4 +---
 drivers/net/ethernet/marvell/skge.c           | 3 +--
 drivers/net/ethernet/marvell/sky2.c           | 3 +--
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
 drivers/net/ethernet/ti/davinci_emac.c        | 3 +--
 drivers/net/ethernet/ti/netcp_core.c          | 5 ++---
 drivers/net/xen-netback/interface.c           | 3 +--
 7 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 8014eb33937c..9e6de2f968fa 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -68,7 +68,6 @@ MODULE_PARM_DESC(debug, "Debug level (0=none,...,16=all)");
 #define DEFAULT_GMAC_RXQ_ORDER		9
 #define DEFAULT_GMAC_TXQ_ORDER		8
 #define DEFAULT_RX_BUF_ORDER		11
-#define DEFAULT_NAPI_WEIGHT		64
 #define TX_MAX_FRAGS			16
 #define TX_QUEUE_NUM			1	/* max: 6 */
 #define RX_MAX_ALLOC_ORDER		2
@@ -2472,8 +2471,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	netdev->max_mtu = 10236 - VLAN_ETH_HLEN;
 
 	port->freeq_refill = 0;
-	netif_napi_add(netdev, &port->napi, gmac_napi_poll,
-		       DEFAULT_NAPI_WEIGHT);
+	netif_napi_add(netdev, &port->napi, gmac_napi_poll, NAPI_POLL_WEIGHT);
 
 	ret = of_get_mac_address(np, mac);
 	if (!ret) {
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index cf03c67fbf40..c1e985416c0e 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -50,7 +50,6 @@
 #define PHY_RETRIES	        1000
 #define ETH_JUMBO_MTU		9000
 #define TX_WATCHDOG		(5 * HZ)
-#define NAPI_WEIGHT		64
 #define BLINK_MS		250
 #define LINK_HZ			HZ
 
@@ -3833,7 +3832,7 @@ static struct net_device *skge_devinit(struct skge_hw *hw, int port,
 		dev->features |= NETIF_F_HIGHDMA;
 
 	skge = netdev_priv(dev);
-	netif_napi_add(dev, &skge->napi, skge_poll, NAPI_WEIGHT);
+	netif_napi_add(dev, &skge->napi, skge_poll, NAPI_POLL_WEIGHT);
 	skge->netdev = dev;
 	skge->hw = hw;
 	skge->msg_enable = netif_msg_init(debug, default_msg);
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index ea16b1dd6a98..a1e907c85217 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -63,7 +63,6 @@
 #define TX_DEF_PENDING		63
 
 #define TX_WATCHDOG		(5 * HZ)
-#define NAPI_WEIGHT		64
 #define PHY_RETRIES		1000
 
 #define SKY2_EEPROM_MAGIC	0x9955aabb
@@ -4938,7 +4937,7 @@ static int sky2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		}
 	}
 
-	netif_napi_add(dev, &hw->napi, sky2_poll, NAPI_WEIGHT);
+	netif_napi_add(dev, &hw->napi, sky2_poll, NAPI_POLL_WEIGHT);
 
 	err = register_netdev(dev);
 	if (err) {
diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 4cd0747edaff..95839fd84dab 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -30,7 +30,6 @@
 #define MTK_STAR_WAIT_TIMEOUT			300
 #define MTK_STAR_MAX_FRAME_SIZE			1514
 #define MTK_STAR_SKB_ALIGNMENT			16
-#define MTK_STAR_NAPI_WEIGHT			64
 #define MTK_STAR_HASHTABLE_MC_LIMIT		256
 #define MTK_STAR_HASHTABLE_SIZE_MAX		512
 
@@ -1551,7 +1550,7 @@ static int mtk_star_probe(struct platform_device *pdev)
 	ndev->netdev_ops = &mtk_star_netdev_ops;
 	ndev->ethtool_ops = &mtk_star_ethtool_ops;
 
-	netif_napi_add(ndev, &priv->napi, mtk_star_poll, MTK_STAR_NAPI_WEIGHT);
+	netif_napi_add(ndev, &priv->napi, mtk_star_poll, NAPI_POLL_WEIGHT);
 
 	return devm_register_netdev(dev, ndev);
 }
diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 9d1e98db308b..2a3e4e842fa5 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -113,7 +113,6 @@ static const char emac_version_string[] = "TI DaVinci EMAC Linux v6.1";
 #define EMAC_DEF_RX_NUM_DESC		(128)
 #define EMAC_DEF_MAX_TX_CH		(1) /* Max TX channels configured */
 #define EMAC_DEF_MAX_RX_CH		(1) /* Max RX channels configured */
-#define EMAC_POLL_WEIGHT		(64) /* Default NAPI poll weight */
 
 /* Buffer descriptor parameters */
 #define EMAC_DEF_TX_MAX_SERVICE		(32) /* TX max service BD's */
@@ -1949,7 +1948,7 @@ static int davinci_emac_probe(struct platform_device *pdev)
 
 	ndev->netdev_ops = &emac_netdev_ops;
 	ndev->ethtool_ops = &ethtool_ops;
-	netif_napi_add(ndev, &priv->napi, emac_poll, EMAC_POLL_WEIGHT);
+	netif_napi_add(ndev, &priv->napi, emac_poll, NAPI_POLL_WEIGHT);
 
 	pm_runtime_enable(&pdev->dev);
 	rc = pm_runtime_resume_and_get(&pdev->dev);
diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 16507bff652a..21b0e961eab5 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -24,7 +24,6 @@
 #include "netcp.h"
 
 #define NETCP_SOP_OFFSET	(NET_IP_ALIGN + NET_SKB_PAD)
-#define NETCP_NAPI_WEIGHT	64
 #define NETCP_TX_TIMEOUT	(5 * HZ)
 #define NETCP_PACKET_SIZE	(ETH_FRAME_LEN + ETH_FCS_LEN)
 #define NETCP_MIN_PACKET_SIZE	ETH_ZLEN
@@ -2096,8 +2095,8 @@ static int netcp_create_interface(struct netcp_device *netcp_device,
 	}
 
 	/* NAPI register */
-	netif_napi_add(ndev, &netcp->rx_napi, netcp_rx_poll, NETCP_NAPI_WEIGHT);
-	netif_tx_napi_add(ndev, &netcp->tx_napi, netcp_tx_poll, NETCP_NAPI_WEIGHT);
+	netif_napi_add(ndev, &netcp->rx_napi, netcp_rx_poll, NAPI_POLL_WEIGHT);
+	netif_tx_napi_add(ndev, &netcp->tx_napi, netcp_tx_poll, NAPI_POLL_WEIGHT);
 
 	/* Register the network device */
 	ndev->dev_id		= 0;
diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index fe8e21ad8ed9..8e035374a370 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -42,7 +42,6 @@
 #include <xen/balloon.h>
 
 #define XENVIF_QUEUE_LENGTH 32
-#define XENVIF_NAPI_WEIGHT  64
 
 /* Number of bytes allowed on the internal guest Rx queue. */
 #define XENVIF_RX_QUEUE_BYTES (XEN_NETIF_RX_RING_SIZE/2 * PAGE_SIZE)
@@ -739,7 +738,7 @@ int xenvif_connect_data(struct xenvif_queue *queue,
 	atomic_set(&queue->inflight_packets, 0);
 
 	netif_napi_add(queue->vif->dev, &queue->napi, xenvif_poll,
-			XENVIF_NAPI_WEIGHT);
+			NAPI_POLL_WEIGHT);
 
 	queue->stalled = true;
 
-- 
2.34.1

