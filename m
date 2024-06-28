Return-Path: <linux-omap+bounces-1612-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD291BE0B
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4519E284A33
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50753158878;
	Fri, 28 Jun 2024 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXYkDGyM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90F158219;
	Fri, 28 Jun 2024 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576129; cv=none; b=sbXMZJd8PGuRsWsioX0sj3ynxrR376gclmTmrxyjZZk8QOSwUuEBGabt2T4KmJfkON4eBk3kKdzIoUJNM9H8CLtJ/y64Yl/HnUD3/phQzZbs7KKkOGiEBfwSCFQYjq594+rLPeAJ0H5UIxPj7De/i30lr3MLUlY/RToF7qwlBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576129; c=relaxed/simple;
	bh=DFZ+DpUdYBlf0BVEHrX6jkQ9kCwsFKSKnquvFKSm0rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kn85Ud3yrxjuppaPz7TLGePShr+bbD2WfPMs3kSk035aJ+LDCRIu2znEoQdmDPqt42rKk389DEfDwC6R0yUbZdiKWgL/o8hvfDjH9wUfc4CSmmZsKOaPDwCOCPNy2yvAj6+0wyPBUX1mLLJB3Sbc0kCSEqrYHZziGdXZ56Oded4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXYkDGyM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25C7C32786;
	Fri, 28 Jun 2024 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576128;
	bh=DFZ+DpUdYBlf0BVEHrX6jkQ9kCwsFKSKnquvFKSm0rM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fXYkDGyMDzU4+C2TVpGEXXbVPBU8xjVTNtUUMRHEIWpjOV1da5C6QQftpwc+4ORyN
	 IMuHjad8i0Qab5w6mJgG+fzg1amK0u1588ZnLQh1JsqecFjJUuqNS8tlRYRA7F696u
	 wjPhaoDv3mSp8VKIz6aTUPSfl1gHu8esCjhl2ISxzzjpi3eFnXppydykdwAUv6eXju
	 V2L1KB0vThwSEhWJciiJzxrMjGCkC9QbFkhyjPXPtdNbAqMau2kydZzZGfzccZkqWs
	 GAiLwiiFO5FUaKX72oizZYYFcbUZ2TaBGJWnrpn10i3pLaT4g2CBl4b0zBwUsvIf4+
	 DkGNyMC+EliKg==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:50 +0300
Subject: [PATCH net-next v2 1/7] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-1-c399cb77db56@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=31448; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=DFZ+DpUdYBlf0BVEHrX6jkQ9kCwsFKSKnquvFKSm0rM=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4KI+qa2ZdDHBrlS/suRyhSLRmSUgxcg/eS
 YaKyYoM0JSJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 k0C0D/9Iybzzq4h1XXVDwtS5dIiT/zmZzaSj/qazpDqSrDgC9t1xTYtgeLg97ClWXRYQyIoiTlG
 mJX1otOScaoknrlagxUr2j9fF/7fO5KzGZuW5KYh+yOrZ9L01xpjc/3MxcFD2mRF5SBwnyVhsd0
 JGcN8Z0410ritFf1QYBqL4BqE+0AiY6YPpZpWgV5HrnyhqwDd0Wt31Y+OxBXLebXA8O8BbTWvGc
 bybtmoPzQka1I1BqOTecBfgazXxCb61g2rZ/vB061Uja+uF9SGoFbEHuqCzX4QPr547Y1fFWl1s
 5veTSFEmaw87hFdn1+kcnpBPnmcCutIHySfAE1kz/8v7jPprhQHpZGJ+KMocQSdaybYv7kX7jS+
 mlpjq8dJRjqgAZblrAKvMEvp9hIZqGsAVScxx1cu5bWWbkmqQ2RpSDwQxB3zW4vynOr8/9uHvUt
 t52dCcSwMi4sGbHJGXCEyIJO1glFrY5QTkHNF8/vci1un3iXjVArVgIf1B7oOhhujWkjrq83iWD
 YLfRO0gueNum78ZtzzMf7jVIBjLyp4ten2x5H/LYDVc9gLrNfs+uSOECP3p5TbMNkOspws3x7EJ
 d5HZgitIcTBvwnsDwohgNFf3BjJx+SQRgukz41nL62NF0DCrcRLMK6pQ1700JO6YCBdCR6tpZ6X
 kZQoXEpiVy51XPA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

am65-cpsw can support up to 8 queues at Rx.
Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
As there is only one DMA channel for RX traffic, the
8 queues come as 8 flows in that channel.

By default, we will start with 1 flow as defined by the
macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.

User can change the number of flows by ethtool like so
'ethtool -L ethx rx <N>'

All traffic will still come on flow 0. To get traffic on
different flows the Classifiers will need to be set up.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  59 +++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 358 ++++++++++++++++------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  35 +--
 3 files changed, 272 insertions(+), 180 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index a1d0935d1ebe..3106bf07eb1a 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
@@ -429,7 +429,7 @@ static void am65_cpsw_get_channels(struct net_device *ndev,
 
 	ch->max_rx = AM65_CPSW_MAX_RX_QUEUES;
 	ch->max_tx = AM65_CPSW_MAX_TX_QUEUES;
-	ch->rx_count = AM65_CPSW_MAX_RX_QUEUES;
+	ch->rx_count = common->rx_ch_num_flows;
 	ch->tx_count = common->tx_ch_num;
 }
 
@@ -448,8 +448,9 @@ static int am65_cpsw_set_channels(struct net_device *ndev,
 		return -EBUSY;
 
 	am65_cpsw_nuss_remove_tx_chns(common);
+	am65_cpsw_nuss_remove_rx_chns(common);
 
-	return am65_cpsw_nuss_update_tx_chns(common, chs->tx_count);
+	return am65_cpsw_nuss_update_tx_rx_chns(common, chs->tx_count, chs->rx_count);
 }
 
 static void
@@ -921,10 +922,12 @@ static int am65_cpsw_get_coalesce(struct net_device *ndev, struct ethtool_coales
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_tx_chn *tx_chn;
+	struct am65_cpsw_rx_flow *rx_flow;
 
 	tx_chn = &common->tx_chns[0];
+	rx_flow = &common->rx_chns.flows[0];
 
-	coal->rx_coalesce_usecs = common->rx_pace_timeout / 1000;
+	coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
 	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
 
 	return 0;
@@ -935,13 +938,24 @@ static int am65_cpsw_get_per_queue_coalesce(struct net_device *ndev, u32 queue,
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_tx_chn *tx_chn;
+	struct am65_cpsw_rx_flow *rx_flow;
 
-	if (queue >= AM65_CPSW_MAX_TX_QUEUES)
+	if (queue >= AM65_CPSW_MAX_TX_QUEUES && queue >= AM65_CPSW_MAX_RX_QUEUES)
 		return -EINVAL;
 
-	tx_chn = &common->tx_chns[queue];
+	if (queue < AM65_CPSW_MAX_TX_QUEUES) {
+		tx_chn = &common->tx_chns[queue];
+		coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
+	} else {
+		coal->tx_coalesce_usecs = ~0;
+	}
 
-	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
+	if (queue < AM65_CPSW_MAX_RX_QUEUES) {
+		rx_flow = &common->rx_chns.flows[queue];
+		coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
+	} else {
+		coal->rx_coalesce_usecs = ~0;
+	}
 
 	return 0;
 }
@@ -952,8 +966,10 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_tx_chn *tx_chn;
+	struct am65_cpsw_rx_flow *rx_flow;
 
 	tx_chn = &common->tx_chns[0];
+	rx_flow = &common->rx_chns.flows[0];
 
 	if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20)
 		return -EINVAL;
@@ -961,7 +977,7 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
 	if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20)
 		return -EINVAL;
 
-	common->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
+	rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
 	tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
 
 	return 0;
@@ -972,19 +988,34 @@ static int am65_cpsw_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_tx_chn *tx_chn;
+	struct am65_cpsw_rx_flow *rx_flow;
 
-	if (queue >= AM65_CPSW_MAX_TX_QUEUES)
+	if (queue >= AM65_CPSW_MAX_TX_QUEUES && queue >= AM65_CPSW_MAX_RX_QUEUES)
 		return -EINVAL;
 
-	tx_chn = &common->tx_chns[queue];
+	if (queue < AM65_CPSW_MAX_TX_QUEUES) {
+		tx_chn = &common->tx_chns[queue];
+
+		if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
+			dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
+				 queue);
+			coal->tx_coalesce_usecs = 20;
+		}
 
-	if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
-		dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
-			 queue);
-		coal->tx_coalesce_usecs = 20;
+		tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
 	}
 
-	tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
+	if (queue < AM65_CPSW_MAX_RX_QUEUES) {
+		rx_flow = &common->rx_chns.flows[queue];
+
+		if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20) {
+			dev_info(common->dev, "defaulting to min value of 20us for rx-usecs for rx-%u\n",
+				 queue);
+			coal->rx_coalesce_usecs = 20;
+		}
+
+		rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
+	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 81d9f21086ec..f6c664dfc1fa 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -138,7 +138,7 @@
 	 AM65_CPSW_PN_TS_CTL_RX_ANX_F_EN)
 
 #define AM65_CPSW_ALE_AGEOUT_DEFAULT	30
-/* Number of TX/RX descriptors */
+/* Number of TX/RX descriptors per channel/flow */
 #define AM65_CPSW_MAX_TX_DESC	500
 #define AM65_CPSW_MAX_RX_DESC	500
 
@@ -150,6 +150,7 @@
 			 NETIF_MSG_RX_ERR | NETIF_MSG_TX_ERR)
 
 #define AM65_CPSW_DEFAULT_TX_CHNS	8
+#define AM65_CPSW_DEFAULT_RX_CHN_FLOWS	1
 
 /* CPPI streaming packet interface */
 #define AM65_CPSW_CPPI_TX_FLOW_ID  0x3FFF
@@ -330,7 +331,7 @@ static void am65_cpsw_nuss_ndo_host_tx_timeout(struct net_device *ndev,
 }
 
 static int am65_cpsw_nuss_rx_push(struct am65_cpsw_common *common,
-				  struct page *page)
+				  struct page *page, u32 flow_idx)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct cppi5_host_desc_t *desc_rx;
@@ -363,7 +364,8 @@ static int am65_cpsw_nuss_rx_push(struct am65_cpsw_common *common,
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
 	*((void **)swdata) = page_address(page);
 
-	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, 0, desc_rx, desc_dma);
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, flow_idx,
+					desc_rx, desc_dma);
 }
 
 void am65_cpsw_nuss_set_p0_ptype(struct am65_cpsw_common *common)
@@ -398,22 +400,27 @@ static void am65_cpsw_init_port_emac_ale(struct am65_cpsw_port *port);
 static void am65_cpsw_destroy_xdp_rxqs(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_rx_flow *flow;
 	struct xdp_rxq_info *rxq;
-	int i;
+	int id, port;
 
-	for (i = 0; i < common->port_num; i++) {
-		if (!common->ports[i].ndev)
-			continue;
+	for (id = 0; id < common->rx_ch_num_flows; id++) {
+		flow = &rx_chn->flows[id];
 
-		rxq = &common->ports[i].xdp_rxq;
+		for (port = 0; port < common->port_num; port++) {
+			if (!common->ports[port].ndev)
+				continue;
 
-		if (xdp_rxq_info_is_reg(rxq))
-			xdp_rxq_info_unreg(rxq);
-	}
+			rxq = &common->ports[port].xdp_rxq[id];
 
-	if (rx_chn->page_pool) {
-		page_pool_destroy(rx_chn->page_pool);
-		rx_chn->page_pool = NULL;
+			if (xdp_rxq_info_is_reg(rxq))
+				xdp_rxq_info_unreg(rxq);
+		}
+
+		if (flow->page_pool) {
+			page_pool_destroy(flow->page_pool);
+			flow->page_pool = NULL;
+		}
 	}
 }
 
@@ -427,31 +434,42 @@ static int am65_cpsw_create_xdp_rxqs(struct am65_cpsw_common *common)
 		.nid = dev_to_node(common->dev),
 		.dev = common->dev,
 		.dma_dir = DMA_BIDIRECTIONAL,
-		.napi = &common->napi_rx,
+		/* .napi set dynamically */
 	};
+	struct am65_cpsw_rx_flow *flow;
 	struct xdp_rxq_info *rxq;
 	struct page_pool *pool;
-	int i, ret;
-
-	pool = page_pool_create(&pp_params);
-	if (IS_ERR(pool))
-		return PTR_ERR(pool);
+	int id, port, ret;
+
+	for (id = 0; id < common->rx_ch_num_flows; id++) {
+		flow = &rx_chn->flows[id];
+		pp_params.napi = &flow->napi_rx;
+		pool = page_pool_create(&pp_params);
+		if (IS_ERR(pool)) {
+			ret = PTR_ERR(pool);
+			goto err;
+		}
 
-	rx_chn->page_pool = pool;
+		flow->page_pool = pool;
 
-	for (i = 0; i < common->port_num; i++) {
-		if (!common->ports[i].ndev)
-			continue;
+		/* using same page pool is allowed as no running rx handlers
+		 * simultaneously for both ndevs
+		 */
+		for (port = 0; port < common->port_num; port++) {
+			if (!common->ports[port].ndev)
+				continue;
 
-		rxq = &common->ports[i].xdp_rxq;
+			rxq = &common->ports[port].xdp_rxq[id];
 
-		ret = xdp_rxq_info_reg(rxq, common->ports[i].ndev, i, 0);
-		if (ret)
-			goto err;
+			ret = xdp_rxq_info_reg(rxq, common->ports[port].ndev,
+					       id, flow->napi_rx.napi_id);
+			if (ret)
+				goto err;
 
-		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
-		if (ret)
-			goto err;
+			ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
+			if (ret)
+				goto err;
+		}
 	}
 
 	return 0;
@@ -496,25 +514,27 @@ static enum am65_cpsw_tx_buf_type am65_cpsw_nuss_buf_type(struct am65_cpsw_tx_ch
 								       desc_idx);
 }
 
-static inline void am65_cpsw_put_page(struct am65_cpsw_rx_chn *rx_chn,
+static inline void am65_cpsw_put_page(struct am65_cpsw_rx_flow *flow,
 				      struct page *page,
 				      bool allow_direct,
 				      int desc_idx)
 {
-	page_pool_put_full_page(rx_chn->page_pool, page, allow_direct);
-	rx_chn->pages[desc_idx] = NULL;
+	page_pool_put_full_page(flow->page_pool, page, allow_direct);
+	flow->pages[desc_idx] = NULL;
 }
 
 static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
-	struct am65_cpsw_rx_chn *rx_chn = data;
+	struct am65_cpsw_rx_flow *flow = data;
 	struct cppi5_host_desc_t *desc_rx;
+	struct am65_cpsw_rx_chn *rx_chn;
 	dma_addr_t buf_dma;
 	u32 buf_dma_len;
 	void *page_addr;
 	void **swdata;
 	int desc_idx;
 
+	rx_chn = &flow->common->rx_chns;
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
 	page_addr = *swdata;
@@ -525,7 +545,7 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 
 	desc_idx = am65_cpsw_nuss_desc_idx(rx_chn->desc_pool, desc_rx,
 					   rx_chn->dsize_log2);
-	am65_cpsw_put_page(rx_chn, virt_to_page(page_addr), false, desc_idx);
+	am65_cpsw_put_page(flow, virt_to_page(page_addr), false, desc_idx);
 }
 
 static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
@@ -601,7 +621,8 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 	struct am65_cpsw_host *host_p = am65_common_get_host(common);
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct am65_cpsw_tx_chn *tx_chn = common->tx_chns;
-	int port_idx, i, ret, tx;
+	int port_idx, i, ret, tx, flow_idx;
+	struct am65_cpsw_rx_flow *flow;
 	u32 val, port_mask;
 	struct page *page;
 
@@ -669,27 +690,32 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		return ret;
 	}
 
-	for (i = 0; i < rx_chn->descs_num; i++) {
-		page = page_pool_dev_alloc_pages(rx_chn->page_pool);
-		if (!page) {
-			ret = -ENOMEM;
-			if (i)
-				goto fail_rx;
+	for (flow_idx = 0; flow_idx < common->rx_ch_num_flows; flow_idx++) {
+		flow = &rx_chn->flows[flow_idx];
+		for (i = 0; i < AM65_CPSW_MAX_RX_DESC; i++) {
+			page = page_pool_dev_alloc_pages(flow->page_pool);
+			if (!page) {
+				dev_err(common->dev, "cannot allocate page in flow %d\n",
+					flow_idx);
+				ret = -ENOMEM;
+				if (i)
+					goto fail_rx;
 
-			return ret;
-		}
-		rx_chn->pages[i] = page;
+				return ret;
+			}
+			flow->pages[i] = page;
 
-		ret = am65_cpsw_nuss_rx_push(common, page);
-		if (ret < 0) {
-			dev_err(common->dev,
-				"cannot submit page to channel rx: %d\n",
-				ret);
-			am65_cpsw_put_page(rx_chn, page, false, i);
-			if (i)
-				goto fail_rx;
+			ret = am65_cpsw_nuss_rx_push(common, page, flow_idx);
+			if (ret < 0) {
+				dev_err(common->dev,
+					"cannot submit page to rx channel flow %d, error %d\n",
+					flow_idx, ret);
+				am65_cpsw_put_page(flow, page, false, i);
+				if (i)
+					goto fail_rx;
 
-			return ret;
+				return ret;
+			}
 		}
 	}
 
@@ -699,6 +725,14 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		goto fail_rx;
 	}
 
+	for (i = 0; i < common->rx_ch_num_flows ; i++) {
+		napi_enable(&common->rx_chns.flows[i].napi_rx);
+		if (common->rx_chns.flows[i].irq_disabled) {
+			common->rx_chns.flows[i].irq_disabled = false;
+			enable_irq(common->rx_chns.flows[i].irq);
+		}
+	}
+
 	for (tx = 0; tx < common->tx_ch_num; tx++) {
 		ret = k3_udma_glue_enable_tx_chn(tx_chn[tx].tx_chn);
 		if (ret) {
@@ -710,12 +744,6 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		napi_enable(&tx_chn[tx].napi_tx);
 	}
 
-	napi_enable(&common->napi_rx);
-	if (common->rx_irq_disabled) {
-		common->rx_irq_disabled = false;
-		enable_irq(rx_chn->irq);
-	}
-
 	dev_dbg(common->dev, "cpsw_nuss started\n");
 	return 0;
 
@@ -726,11 +754,24 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		tx--;
 	}
 
+	for (flow_idx = 0; i < common->rx_ch_num_flows; flow_idx++) {
+		flow = &rx_chn->flows[flow_idx];
+		if (!flow->irq_disabled) {
+			disable_irq(flow->irq);
+			flow->irq_disabled = true;
+		}
+		napi_disable(&flow->napi_rx);
+	}
+
 	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
 
 fail_rx:
-	k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, 0, rx_chn,
-				  am65_cpsw_nuss_rx_cleanup, 0);
+	for (i = 0; i < common->rx_ch_num_flows; i--)
+		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
+					  am65_cpsw_nuss_rx_cleanup, !!i);
+
+	am65_cpsw_destroy_xdp_rxqs(common);
+
 	return ret;
 }
 
@@ -779,12 +820,12 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 			dev_err(common->dev, "rx teardown timeout\n");
 	}
 
-	napi_disable(&common->napi_rx);
-	hrtimer_cancel(&common->rx_hrtimer);
-
-	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
-		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, rx_chn,
+	for (i = 0; i < common->rx_ch_num_flows; i++) {
+		napi_disable(&common->rx_chns.flows[i].napi_rx);
+		hrtimer_cancel(&common->rx_chns.flows[i].rx_hrtimer);
+		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
 					  am65_cpsw_nuss_rx_cleanup, !!i);
+	}
 
 	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
 
@@ -793,10 +834,6 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 	writel(0, common->cpsw_base + AM65_CPSW_REG_CTL);
 	writel(0, common->cpsw_base + AM65_CPSW_REG_STAT_PORT_EN);
 
-	for (i = 0; i < rx_chn->descs_num; i++) {
-		if (rx_chn->pages[i])
-			am65_cpsw_put_page(rx_chn, rx_chn->pages[i], false, i);
-	}
 	am65_cpsw_destroy_xdp_rxqs(common);
 
 	dev_dbg(common->dev, "cpsw_nuss stopped\n");
@@ -867,7 +904,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 		goto runtime_put;
 	}
 
-	ret = netif_set_real_num_rx_queues(ndev, AM65_CPSW_MAX_RX_QUEUES);
+	ret = netif_set_real_num_rx_queues(ndev, common->rx_ch_num_flows);
 	if (ret) {
 		dev_err(common->dev, "cannot set real number of rx queues\n");
 		goto runtime_put;
@@ -990,12 +1027,12 @@ static int am65_cpsw_xdp_tx_frame(struct net_device *ndev,
 	return ret;
 }
 
-static int am65_cpsw_run_xdp(struct am65_cpsw_common *common,
+static int am65_cpsw_run_xdp(struct am65_cpsw_rx_flow *flow,
 			     struct am65_cpsw_port *port,
 			     struct xdp_buff *xdp,
 			     int desc_idx, int cpu, int *len)
 {
-	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_common *common = flow->common;
 	struct net_device *ndev = port->ndev;
 	int ret = AM65_CPSW_XDP_CONSUMED;
 	struct am65_cpsw_tx_chn *tx_chn;
@@ -1055,7 +1092,7 @@ static int am65_cpsw_run_xdp(struct am65_cpsw_common *common,
 	}
 
 	page = virt_to_head_page(xdp->data);
-	am65_cpsw_put_page(rx_chn, page, true, desc_idx);
+	am65_cpsw_put_page(flow, page, true, desc_idx);
 
 out:
 	return ret;
@@ -1094,11 +1131,11 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
 	}
 }
 
-static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
-				     u32 flow_idx, int cpu)
+static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow, int cpu)
 {
-	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_rx_chn *rx_chn = &flow->common->rx_chns;
 	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
+	struct am65_cpsw_common *common = flow->common;
 	struct am65_cpsw_ndev_priv *ndev_priv;
 	struct am65_cpsw_ndev_stats *stats;
 	struct cppi5_host_desc_t *desc_rx;
@@ -1108,6 +1145,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	struct am65_cpsw_port *port;
 	int headroom, desc_idx, ret;
 	struct net_device *ndev;
+	u32 flow_idx = flow->id;
 	struct sk_buff *skb;
 	struct xdp_buff	xdp;
 	void *page_addr;
@@ -1161,12 +1199,12 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	}
 
 	if (port->xdp_prog) {
-		xdp_init_buff(&xdp, AM65_CPSW_MAX_PACKET_SIZE, &port->xdp_rxq);
+		xdp_init_buff(&xdp, AM65_CPSW_MAX_PACKET_SIZE, &port->xdp_rxq[flow->id]);
 
 		xdp_prepare_buff(&xdp, page_addr, skb_headroom(skb),
 				 pkt_len, false);
 
-		ret = am65_cpsw_run_xdp(common, port, &xdp, desc_idx,
+		ret = am65_cpsw_run_xdp(flow, port, &xdp, desc_idx,
 					cpu, &pkt_len);
 		if (ret != AM65_CPSW_XDP_PASS)
 			return ret;
@@ -1184,7 +1222,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	skb_mark_for_recycle(skb);
 	skb->protocol = eth_type_trans(skb, ndev);
 	am65_cpsw_nuss_rx_csum(skb, csum_info);
-	napi_gro_receive(&common->napi_rx, skb);
+	napi_gro_receive(&flow->napi_rx, skb);
 
 	stats = this_cpu_ptr(ndev_priv->stats);
 
@@ -1193,21 +1231,21 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	stats->rx_bytes += pkt_len;
 	u64_stats_update_end(&stats->syncp);
 
-	new_page = page_pool_dev_alloc_pages(rx_chn->page_pool);
+	new_page = page_pool_dev_alloc_pages(flow->page_pool);
 	if (unlikely(!new_page))
 		return -ENOMEM;
-	rx_chn->pages[desc_idx] = new_page;
+	flow->pages[desc_idx] = new_page;
 
 	if (netif_dormant(ndev)) {
-		am65_cpsw_put_page(rx_chn, new_page, true, desc_idx);
+		am65_cpsw_put_page(flow, new_page, true, desc_idx);
 		ndev->stats.rx_dropped++;
 		return 0;
 	}
 
 requeue:
-	ret = am65_cpsw_nuss_rx_push(common, new_page);
+	ret = am65_cpsw_nuss_rx_push(common, new_page, flow_idx);
 	if (WARN_ON(ret < 0)) {
-		am65_cpsw_put_page(rx_chn, new_page, true, desc_idx);
+		am65_cpsw_put_page(flow, new_page, true, desc_idx);
 		ndev->stats.rx_errors++;
 		ndev->stats.rx_dropped++;
 	}
@@ -1217,38 +1255,32 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 
 static enum hrtimer_restart am65_cpsw_nuss_rx_timer_callback(struct hrtimer *timer)
 {
-	struct am65_cpsw_common *common =
-			container_of(timer, struct am65_cpsw_common, rx_hrtimer);
+	struct am65_cpsw_rx_flow *flow =
+			container_of(timer, struct am65_cpsw_rx_flow, rx_hrtimer);
 
-	enable_irq(common->rx_chns.irq);
+	enable_irq(flow->irq);
 	return HRTIMER_NORESTART;
 }
 
 static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 {
-	struct am65_cpsw_common *common = am65_cpsw_napi_to_common(napi_rx);
-	int flow = AM65_CPSW_MAX_RX_FLOWS;
+	struct am65_cpsw_rx_flow *flow = am65_cpsw_napi_to_rx_flow(napi_rx);
+	struct am65_cpsw_common *common = flow->common;
 	int cpu = smp_processor_id();
 	bool xdp_redirect = false;
 	int cur_budget, ret;
 	int num_rx = 0;
 
-	/* process every flow */
-	while (flow--) {
-		cur_budget = budget - num_rx;
-
-		while (cur_budget--) {
-			ret = am65_cpsw_nuss_rx_packets(common, flow, cpu);
-			if (ret) {
-				if (ret == AM65_CPSW_XDP_REDIRECT)
-					xdp_redirect = true;
-				break;
-			}
-			num_rx++;
-		}
-
-		if (num_rx >= budget)
+	/* process only this flow */
+	cur_budget = budget;
+	while (cur_budget--) {
+		ret = am65_cpsw_nuss_rx_packets(flow, cpu);
+		if (ret) {
+			if (ret == AM65_CPSW_XDP_REDIRECT)
+				xdp_redirect = true;
 			break;
+		}
+		num_rx++;
 	}
 
 	if (xdp_redirect)
@@ -1257,14 +1289,14 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 	dev_dbg(common->dev, "%s num_rx:%d %d\n", __func__, num_rx, budget);
 
 	if (num_rx < budget && napi_complete_done(napi_rx, num_rx)) {
-		if (common->rx_irq_disabled) {
-			common->rx_irq_disabled = false;
-			if (unlikely(common->rx_pace_timeout)) {
-				hrtimer_start(&common->rx_hrtimer,
-					      ns_to_ktime(common->rx_pace_timeout),
+		if (flow->irq_disabled) {
+			flow->irq_disabled = false;
+			if (unlikely(flow->rx_pace_timeout)) {
+				hrtimer_start(&flow->rx_hrtimer,
+					      ns_to_ktime(flow->rx_pace_timeout),
 					      HRTIMER_MODE_REL_PINNED);
 			} else {
-				enable_irq(common->rx_chns.irq);
+				enable_irq(flow->irq);
 			}
 		}
 	}
@@ -1512,11 +1544,11 @@ static int am65_cpsw_nuss_tx_poll(struct napi_struct *napi_tx, int budget)
 
 static irqreturn_t am65_cpsw_nuss_rx_irq(int irq, void *dev_id)
 {
-	struct am65_cpsw_common *common = dev_id;
+	struct am65_cpsw_rx_flow *flow = dev_id;
 
-	common->rx_irq_disabled = true;
+	flow->irq_disabled = true;
 	disable_irq_nosync(irq);
-	napi_schedule(&common->napi_rx);
+	napi_schedule(&flow->napi_rx);
 
 	return IRQ_HANDLED;
 }
@@ -2315,19 +2347,23 @@ static void am65_cpsw_nuss_free_rx_chns(void *data)
 		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
 }
 
-static void am65_cpsw_nuss_remove_rx_chns(void *data)
+void am65_cpsw_nuss_remove_rx_chns(void *data)
 {
 	struct am65_cpsw_common *common = data;
 	struct device *dev = common->dev;
 	struct am65_cpsw_rx_chn *rx_chn;
+	struct am65_cpsw_rx_flow *flows;
+	int i;
 
 	rx_chn = &common->rx_chns;
+	flows = rx_chn->flows;
 	devm_remove_action(dev, am65_cpsw_nuss_free_rx_chns, common);
 
-	if (!(rx_chn->irq < 0))
-		devm_free_irq(dev, rx_chn->irq, common);
-
-	netif_napi_del(&common->napi_rx);
+	for (i = 0; i < common->rx_ch_num_flows; i++) {
+		if (!(flows[i].irq < 0))
+			devm_free_irq(dev, flows[i].irq, &flows[i]);
+		netif_napi_del(&flows[i].napi_rx);
+	}
 
 	am65_cpsw_nuss_free_rx_chns(common);
 
@@ -2340,6 +2376,7 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 	struct k3_udma_glue_rx_channel_cfg rx_cfg = { 0 };
 	u32  max_desc_num = AM65_CPSW_MAX_RX_DESC;
 	struct device *dev = common->dev;
+	struct am65_cpsw_rx_flow *flow;
 	u32 hdesc_size, hdesc_size_out;
 	u32 fdqring_id;
 	int i, ret = 0;
@@ -2348,12 +2385,21 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 					   AM65_CPSW_NAV_SW_DATA_SIZE);
 
 	rx_cfg.swdata_size = AM65_CPSW_NAV_SW_DATA_SIZE;
-	rx_cfg.flow_id_num = AM65_CPSW_MAX_RX_FLOWS;
+	rx_cfg.flow_id_num = common->rx_ch_num_flows;
 	rx_cfg.flow_id_base = common->rx_flow_id_base;
 
 	/* init all flows */
 	rx_chn->dev = dev;
-	rx_chn->descs_num = max_desc_num;
+	rx_chn->descs_num = max_desc_num * rx_cfg.flow_id_num;
+
+	for (i = 0; i < common->rx_ch_num_flows; i++) {
+		flow = &rx_chn->flows[i];
+		flow->page_pool = NULL;
+		flow->pages = devm_kcalloc(dev, AM65_CPSW_MAX_RX_DESC,
+					   sizeof(*flow->pages), GFP_KERNEL);
+		if (!flow->pages)
+			return -ENOMEM;
+	}
 
 	rx_chn->rx_chn = k3_udma_glue_request_rx_chn(dev, "rx", &rx_cfg);
 	if (IS_ERR(rx_chn->rx_chn)) {
@@ -2376,13 +2422,6 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 	rx_chn->dsize_log2 = __fls(hdesc_size_out);
 	WARN_ON(hdesc_size_out != (1 << rx_chn->dsize_log2));
 
-	rx_chn->page_pool = NULL;
-
-	rx_chn->pages = devm_kcalloc(dev, rx_chn->descs_num,
-				     sizeof(*rx_chn->pages), GFP_KERNEL);
-	if (!rx_chn->pages)
-		return -ENOMEM;
-
 	common->rx_flow_id_base =
 			k3_udma_glue_rx_get_flow_id_base(rx_chn->rx_chn);
 	dev_info(dev, "set new flow-id-base %u\n", common->rx_flow_id_base);
@@ -2406,6 +2445,10 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 				K3_UDMA_GLUE_SRC_TAG_LO_USE_REMOTE_SRC_TAG,
 		};
 
+		flow = &rx_chn->flows[i];
+		flow->id = i;
+		flow->common = common;
+
 		rx_flow_cfg.ring_rxfdq0_id = fdqring_id;
 		rx_flow_cfg.rx_cfg.size = max_desc_num;
 		rx_flow_cfg.rxfdq_cfg.size = max_desc_num;
@@ -2422,28 +2465,31 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 				k3_udma_glue_rx_flow_get_fdq_id(rx_chn->rx_chn,
 								i);
 
-		rx_chn->irq = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
-
-		if (rx_chn->irq < 0) {
+		flow->irq = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
+		if (flow->irq <= 0) {
 			dev_err(dev, "Failed to get rx dma irq %d\n",
-				rx_chn->irq);
-			ret = rx_chn->irq;
+				flow->irq);
+			ret = flow->irq;
 			goto err;
 		}
-	}
 
-	netif_napi_add(common->dma_ndev, &common->napi_rx,
-		       am65_cpsw_nuss_rx_poll);
-	hrtimer_init(&common->rx_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
-	common->rx_hrtimer.function = &am65_cpsw_nuss_rx_timer_callback;
+		snprintf(flow->name,
+			 sizeof(flow->name), "%s-rx%d",
+			 dev_name(dev), i);
+		netif_napi_add(common->dma_ndev, &flow->napi_rx,
+			       am65_cpsw_nuss_rx_poll);
+		hrtimer_init(&flow->rx_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
+		flow->rx_hrtimer.function = &am65_cpsw_nuss_rx_timer_callback;
 
-	ret = devm_request_irq(dev, rx_chn->irq,
-			       am65_cpsw_nuss_rx_irq,
-			       IRQF_TRIGGER_HIGH, dev_name(dev), common);
-	if (ret) {
-		dev_err(dev, "failure requesting rx irq %u, %d\n",
-			rx_chn->irq, ret);
-		goto err;
+		ret = devm_request_irq(dev, flow->irq,
+				       am65_cpsw_nuss_rx_irq,
+				       IRQF_TRIGGER_HIGH,
+				       flow->name, flow);
+		if (ret) {
+			dev_err(dev, "failure requesting rx %d irq %u, %d\n",
+				i, flow->irq, ret);
+			goto err;
+		}
 	}
 
 err:
@@ -3287,8 +3333,8 @@ static int am65_cpsw_nuss_register_ndevs(struct am65_cpsw_common *common)
 		k3_udma_glue_disable_tx_chn(tx_chan[i].tx_chn);
 	}
 
-	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
-		k3_udma_glue_reset_rx_chn(rx_chan->rx_chn, i, rx_chan,
+	for (i = 0; i < common->rx_ch_num_flows; i++)
+		k3_udma_glue_reset_rx_chn(rx_chan->rx_chn, i, &rx_chan->flows[i],
 					  am65_cpsw_nuss_rx_cleanup, !!i);
 
 	k3_udma_glue_disable_rx_chn(rx_chan->rx_chn);
@@ -3330,12 +3376,17 @@ static int am65_cpsw_nuss_register_ndevs(struct am65_cpsw_common *common)
 	return ret;
 }
 
-int am65_cpsw_nuss_update_tx_chns(struct am65_cpsw_common *common, int num_tx)
+int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common, int num_tx, int num_rx)
 {
 	int ret;
 
 	common->tx_ch_num = num_tx;
+	common->rx_ch_num_flows = num_rx;
 	ret = am65_cpsw_nuss_init_tx_chns(common);
+	if (ret)
+		return ret;
+
+	ret = am65_cpsw_nuss_init_rx_chns(common);
 
 	return ret;
 }
@@ -3465,6 +3516,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	common->rx_flow_id_base = -1;
 	init_completion(&common->tdown_complete);
 	common->tx_ch_num = AM65_CPSW_DEFAULT_TX_CHNS;
+	common->rx_ch_num_flows = AM65_CPSW_DEFAULT_RX_CHN_FLOWS;
 	common->pf_p0_rx_ptype_rrobin = false;
 	common->default_vlan = 1;
 
@@ -3656,8 +3708,10 @@ static int am65_cpsw_nuss_resume(struct device *dev)
 		return ret;
 
 	/* If RX IRQ was disabled before suspend, keep it disabled */
-	if (common->rx_irq_disabled)
-		disable_irq(common->rx_chns.irq);
+	for (i = 0; i < common->rx_ch_num_flows; i++) {
+		if (common->rx_chns.flows[i].irq_disabled)
+			disable_irq(common->rx_chns.flows[i].irq);
+	}
 
 	am65_cpts_resume(common->cpts);
 
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index e2ce2be320bd..a644bd09a071 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -22,8 +22,7 @@ struct am65_cpts;
 #define HOST_PORT_NUM		0
 
 #define AM65_CPSW_MAX_TX_QUEUES	8
-#define AM65_CPSW_MAX_RX_QUEUES	1
-#define AM65_CPSW_MAX_RX_FLOWS	1
+#define AM65_CPSW_MAX_RX_QUEUES	8
 
 #define AM65_CPSW_PORT_VLAN_REG_OFFSET	0x014
 
@@ -58,7 +57,7 @@ struct am65_cpsw_port {
 	struct am65_cpsw_qos		qos;
 	struct devlink_port		devlink_port;
 	struct bpf_prog			*xdp_prog;
-	struct xdp_rxq_info		xdp_rxq;
+	struct xdp_rxq_info		xdp_rxq[AM65_CPSW_MAX_RX_QUEUES];
 	/* Only for suspend resume context */
 	u32				vid_context;
 };
@@ -94,16 +93,27 @@ struct am65_cpsw_tx_chn {
 	u32 rate_mbps;
 };
 
+struct am65_cpsw_rx_flow {
+	u32 id;
+	struct napi_struct napi_rx;
+	struct am65_cpsw_common	*common;
+	int irq;
+	bool irq_disabled;
+	struct hrtimer rx_hrtimer;
+	unsigned long rx_pace_timeout;
+	struct page_pool *page_pool;
+	struct page **pages;
+	char name[32];
+};
+
 struct am65_cpsw_rx_chn {
 	struct device *dev;
 	struct device *dma_dev;
 	struct k3_cppi_desc_pool *desc_pool;
 	struct k3_udma_glue_rx_channel *rx_chn;
-	struct page_pool *page_pool;
-	struct page **pages;
 	u32 descs_num;
 	unsigned char dsize_log2;
-	int irq;
+	struct am65_cpsw_rx_flow flows[AM65_CPSW_MAX_RX_QUEUES];
 };
 
 #define AM65_CPSW_QUIRK_I2027_NO_TX_CSUM BIT(0)
@@ -149,12 +159,8 @@ struct am65_cpsw_common {
 	struct completion	tdown_complete;
 	atomic_t		tdown_cnt;
 
+	int			rx_ch_num_flows;
 	struct am65_cpsw_rx_chn	rx_chns;
-	struct napi_struct	napi_rx;
-
-	bool			rx_irq_disabled;
-	struct hrtimer		rx_hrtimer;
-	unsigned long		rx_pace_timeout;
 
 	u32			nuss_ver;
 	u32			cpsw_ver;
@@ -203,8 +209,8 @@ struct am65_cpsw_ndev_priv {
 #define am65_common_get_host(common) (&(common)->host)
 #define am65_common_get_port(common, id) (&(common)->ports[(id) - 1])
 
-#define am65_cpsw_napi_to_common(pnapi) \
-	container_of(pnapi, struct am65_cpsw_common, napi_rx)
+#define am65_cpsw_napi_to_rx_flow(pnapi) \
+	container_of(pnapi, struct am65_cpsw_rx_flow, napi_rx)
 #define am65_cpsw_napi_to_tx_chn(pnapi) \
 	container_of(pnapi, struct am65_cpsw_tx_chn, napi_tx)
 
@@ -216,7 +222,8 @@ extern const struct ethtool_ops am65_cpsw_ethtool_ops_slave;
 
 void am65_cpsw_nuss_set_p0_ptype(struct am65_cpsw_common *common);
 void am65_cpsw_nuss_remove_tx_chns(struct am65_cpsw_common *common);
-int am65_cpsw_nuss_update_tx_chns(struct am65_cpsw_common *common, int num_tx);
+void am65_cpsw_nuss_remove_rx_chns(void *data);
+int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common, int num_tx, int num_rx);
 
 bool am65_cpsw_port_dev_check(const struct net_device *dev);
 

-- 
2.34.1


