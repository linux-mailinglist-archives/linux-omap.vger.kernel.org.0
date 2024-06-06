Return-Path: <linux-omap+bounces-1484-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BB8FE620
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F7B286582
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3CA195F09;
	Thu,  6 Jun 2024 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSLU2ohz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3791667E3;
	Thu,  6 Jun 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675792; cv=none; b=uAKFdex2Hf/iteIZaQILLjOnTvq7mKWlplpDqaKAN6aN2JVGYra0GvTvF9Qgmw67EKSCR6IDlwVXhtav52ictGBRIWqDh0lYePED9XaKsqjCv+bgMKgb1NondLoa4G7Egar40HD55gl+mc/pF6gv317bTMcrS99cFkZY7rN03Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675792; c=relaxed/simple;
	bh=RmTgHweKgAssG7twV/Fz0Qm6DPv1stk6E+o3xHnyxto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWGZuedxw3rgsIW4OteBGZJw9vYYvhz7vjbpUeLx/DPnIp0ISouGohRb8GhmDn191tpvHMN1Liolbvzf+Rd6xT1itk+qyMyssnTJLsgO3SXZfV5HsHB2mUdUWioLQ9xQQJGBbKMeGDZjedkHuQ2NV8kJjKTZcRC42E5UsOjSuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSLU2ohz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADECC4AF48;
	Thu,  6 Jun 2024 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675792;
	bh=RmTgHweKgAssG7twV/Fz0Qm6DPv1stk6E+o3xHnyxto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rSLU2ohzRM7DbD8PU7VSAObnB8QbVQjDRrBTZ17SWzSpIezqup8aguOYv4LksEPiW
	 ME/7l0aTPUfLFMQ0iZ0vY7IxRinX86osixDIhT3UA4W3zH8NqhOW3DRnIsIjb3o9oJ
	 pavrsnWhYeCTAUSYtcGsLghhMnXoYJe7gLkutT4b8RyKjJ/9sDJc2+Af3GLko86bDn
	 ScF+7pzVLd+glsKLfFKsxbtQ5G2FIMHyxMeG6KANQJVLiIiJJlh1KobFE6UV3+uZSQ
	 qYFpb75t/ZJ1Mq4ERL345afKvmgbGgBJIFqtsjBQz3hFk75bnHIX8S9p2RxHk0/bm7
	 lyikvEe+BhCdw==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:17 +0300
Subject: [PATCH RFC net-next 1/7] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-1-0704b0cb6fdc@kernel.org>
References: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
In-Reply-To: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=17660; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=RmTgHweKgAssG7twV/Fz0Qm6DPv1stk6E+o3xHnyxto=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacBa0JW22jJ+B7l0y0IFIPUgVEvglczUaDG/
 vhi4yUsMV+JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnAQAKCRDSWmvTvnYw
 k7AaD/9cKt9txjx2F+Q4TOgEKTCZYJb8nODxF/P/QqyP5h35lUsidflzf/5WEuzReF8IsEZWuZH
 iXIdHDhI7fAGGtfPnTcrf/FNmC+JIoPhL+J7oVDOopIFmpr8mg6OYskpYyOjNYjwngUxNlaVLCk
 Bi5t/fzbDPVrr98lxCrLjjIy6dvTipY4ulYCr2VAawJUx6inIXwfCLpx/54sCGojNlKFQKd3Ow0
 nLLVCJvwHGAeqIgcss43BD7Oo/ZKCXjxu7ab5Bu9n2Lno2egI44O9B+db8aPB/DvN8yLjdZ4K1O
 NsL7E5N+BQni9xcK8I/DrUHfUaOzAeoed344TpmjlRTXFHWmh7ckb6L2m3hxFZPJJ0f1YwBav61
 AqgUIYYOH1tx/NFIJhnaYGxOtyZUfrzWGLG9g7heScQDG7CtPY+aceDbAQrsIB0iT3VsFSw0frG
 m7qSKoQKpASe0tdBmzXoOYbyPcT17uDQ5k9A4HdKTQ4owB2lEYgGijkkpY3fpMxzVUzagtGokwl
 vXpnCPZFT/2WLBUKecds9bWQALkkXiUBICxP5aRxqUuchR9h9WU1rVgByeY6YR+Xlo7J8eopCQl
 LiWX4sYpi/YWnlYUB5rPq94fkIoBP0Tc8RnkwC6ZpsEnFHUHDxcCdiNF8q/pGzJi4rMISDt36KS
 hJTPt1HQML2rtBw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

am65-cpsw can support up to 8 queues at Rx.
Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
As there is only one DMA channel for RX traffic, the
8 queues come as 8 flows in that channel.

By default, we will start with 1 flow as defined by the
macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.

User can change the number of flows by ethtool like so
'ethtool ethx -L rx <N>'

All traffic will still come on flow 0. To get traffic on
different flows the Classifiers will need to be setup.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c |   5 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 194 +++++++++++++++-------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  25 ++--
 3 files changed, 126 insertions(+), 98 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index 01fd13649cc1..d76056696e69 100644
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
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5ca1d0b687a7..1e718d4671c9 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -125,7 +125,7 @@
 	 AM65_CPSW_PN_TS_CTL_TX_ANX_F_EN)
 
 #define AM65_CPSW_ALE_AGEOUT_DEFAULT	30
-/* Number of TX/RX descriptors */
+/* Number of TX/RX descriptors per channel/flow */
 #define AM65_CPSW_MAX_TX_DESC	500
 #define AM65_CPSW_MAX_RX_DESC	500
 
@@ -137,6 +137,7 @@
 			 NETIF_MSG_RX_ERR | NETIF_MSG_TX_ERR)
 
 #define AM65_CPSW_DEFAULT_TX_CHNS	8
+#define AM65_CPSW_DEFAULT_RX_CHN_FLOWS	1
 
 static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
 				      const u8 *dev_addr)
@@ -305,7 +306,7 @@ static void am65_cpsw_nuss_ndo_host_tx_timeout(struct net_device *ndev,
 }
 
 static int am65_cpsw_nuss_rx_push(struct am65_cpsw_common *common,
-				  struct sk_buff *skb)
+				  struct sk_buff *skb, u32 flow_idx)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct cppi5_host_desc_t *desc_rx;
@@ -337,7 +338,8 @@ static int am65_cpsw_nuss_rx_push(struct am65_cpsw_common *common,
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
 	*((void **)swdata) = skb;
 
-	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, 0, desc_rx, desc_dma);
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, flow_idx,
+					desc_rx, desc_dma);
 }
 
 void am65_cpsw_nuss_set_p0_ptype(struct am65_cpsw_common *common)
@@ -443,7 +445,7 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
 static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_host *host_p = am65_common_get_host(common);
-	int port_idx, i, ret, tx;
+	int port_idx, i, ret, tx, flow_idx;
 	struct sk_buff *skb;
 	u32 val, port_mask;
 
@@ -505,29 +507,31 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 
 	am65_cpsw_qos_tx_p0_rate_init(common);
 
-	for (i = 0; i < common->rx_chns.descs_num; i++) {
-		skb = __netdev_alloc_skb_ip_align(NULL,
-						  AM65_CPSW_MAX_PACKET_SIZE,
-						  GFP_KERNEL);
-		if (!skb) {
-			ret = -ENOMEM;
-			dev_err(common->dev, "cannot allocate skb\n");
-			if (i)
-				goto fail_rx;
+	for (flow_idx = 0; flow_idx < common->rx_ch_num_flows; flow_idx++) {
+		for (i = 0; i < common->rx_chns.descs_num / common->rx_ch_num_flows; i++) {
+			skb = __netdev_alloc_skb_ip_align(NULL,
+							  AM65_CPSW_MAX_PACKET_SIZE,
+							  GFP_KERNEL);
+			if (!skb) {
+				ret = -ENOMEM;
+				dev_err(common->dev, "cannot allocate skb\n");
+				if (i)
+					goto fail_rx;
 
-			return ret;
-		}
+				return ret;
+			}
 
-		ret = am65_cpsw_nuss_rx_push(common, skb);
-		if (ret < 0) {
-			dev_err(common->dev,
-				"cannot submit skb to channel rx, error %d\n",
-				ret);
-			kfree_skb(skb);
-			if (i)
-				goto fail_rx;
+			ret = am65_cpsw_nuss_rx_push(common, skb, flow_idx);
+			if (ret < 0) {
+				dev_err(common->dev,
+					"cannot submit skb to channel rx, error %d\n",
+					ret);
+				kfree_skb(skb);
+				if (i)
+					goto fail_rx;
 
-			return ret;
+				return ret;
+			}
 		}
 	}
 
@@ -537,6 +541,14 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
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
 		ret = k3_udma_glue_enable_tx_chn(common->tx_chns[tx].tx_chn);
 		if (ret) {
@@ -548,16 +560,13 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		napi_enable(&common->tx_chns[tx].napi_tx);
 	}
 
-	napi_enable(&common->napi_rx);
-	if (common->rx_irq_disabled) {
-		common->rx_irq_disabled = false;
-		enable_irq(common->rx_chns.irq);
-	}
-
 	dev_dbg(common->dev, "cpsw_nuss started\n");
 	return 0;
 
 fail_tx:
+	for (i = 0; i < common->rx_ch_num_flows; i++)
+		napi_disable(&common->rx_chns.flows[i].napi_rx);
+
 	while (tx >= 0) {
 		napi_disable(&common->tx_chns[tx].napi_tx);
 		k3_udma_glue_disable_tx_chn(common->tx_chns[tx].tx_chn);
@@ -615,12 +624,12 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 			dev_err(common->dev, "rx teardown timeout\n");
 	}
 
-	napi_disable(&common->napi_rx);
-
-	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
+	for (i = 0; i < common->rx_ch_num_flows; i++) {
+		napi_disable(&common->rx_chns.flows[i].napi_rx);
 		k3_udma_glue_reset_rx_chn(common->rx_chns.rx_chn, i,
 					  &common->rx_chns,
 					  am65_cpsw_nuss_rx_cleanup, !!i);
+	}
 
 	k3_udma_glue_disable_rx_chn(common->rx_chns.rx_chn);
 
@@ -697,7 +706,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 		goto runtime_put;
 	}
 
-	ret = netif_set_real_num_rx_queues(ndev, AM65_CPSW_MAX_RX_QUEUES);
+	ret = netif_set_real_num_rx_queues(ndev, common->rx_ch_num_flows);
 	if (ret) {
 		dev_err(common->dev, "cannot set real number of rx queues\n");
 		goto runtime_put;
@@ -791,11 +800,11 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
 	}
 }
 
-static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
-				     u32 flow_idx)
+static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow)
 {
-	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_rx_chn *rx_chn = &flow->common->rx_chns;
 	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
+	struct am65_cpsw_common *common = flow->common;
 	struct am65_cpsw_ndev_priv *ndev_priv;
 	struct am65_cpsw_ndev_stats *stats;
 	struct cppi5_host_desc_t *desc_rx;
@@ -804,6 +813,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	dma_addr_t desc_dma, buf_dma;
 	struct am65_cpsw_port *port;
 	struct net_device *ndev;
+	u32 flow_idx = flow->id;
 	void **swdata;
 	u32 *psdata;
 	int ret = 0;
@@ -855,7 +865,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 		skb_put(skb, pkt_len);
 		skb->protocol = eth_type_trans(skb, ndev);
 		am65_cpsw_nuss_rx_csum(skb, csum_info);
-		napi_gro_receive(&common->napi_rx, skb);
+		napi_gro_receive(&flow->napi_rx, skb);
 
 		stats = this_cpu_ptr(ndev_priv->stats);
 
@@ -875,7 +885,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 		return 0;
 	}
 
-	ret = am65_cpsw_nuss_rx_push(common, new_skb);
+	ret = am65_cpsw_nuss_rx_push(common, new_skb, flow_idx);
 	if (WARN_ON(ret < 0)) {
 		dev_kfree_skb_any(new_skb);
 		ndev->stats.rx_errors++;
@@ -887,32 +897,25 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 
 static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 {
-	struct am65_cpsw_common *common = am65_cpsw_napi_to_common(napi_rx);
-	int flow = AM65_CPSW_MAX_RX_FLOWS;
-	int cur_budget, ret;
-	int num_rx = 0;
-
-	/* process every flow */
-	while (flow--) {
-		cur_budget = budget - num_rx;
-
-		while (cur_budget--) {
-			ret = am65_cpsw_nuss_rx_packets(common, flow);
-			if (ret)
-				break;
-			num_rx++;
-		}
+	struct am65_cpsw_rx_flow *flow = am65_cpsw_napi_to_rx_flow(napi_rx);
+	struct am65_cpsw_common *common = flow->common;
+	int num_rx = 0, ret;
 
-		if (num_rx >= budget)
+	/* process only this flow */
+	while (budget--) {
+		ret = am65_cpsw_nuss_rx_packets(flow);
+		if (ret)
 			break;
+
+		num_rx++;
 	}
 
 	dev_dbg(common->dev, "%s num_rx:%d %d\n", __func__, num_rx, budget);
 
 	if (num_rx < budget && napi_complete_done(napi_rx, num_rx)) {
-		if (common->rx_irq_disabled) {
-			common->rx_irq_disabled = false;
-			enable_irq(common->rx_chns.irq);
+		if (flow->irq_disabled) {
+			flow->irq_disabled = false;
+			enable_irq(flow->irq);
 		}
 	}
 
@@ -1080,11 +1083,11 @@ static int am65_cpsw_nuss_tx_poll(struct napi_struct *napi_tx, int budget)
 
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
@@ -1818,19 +1821,23 @@ static void am65_cpsw_nuss_free_rx_chns(void *data)
 		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
 }
 
-static void am65_cpsw_nuss_remove_rx_chns(void *data)
+void am65_cpsw_nuss_remove_rx_chns(void *data)
 {
 	struct am65_cpsw_common *common = data;
 	struct am65_cpsw_rx_chn *rx_chn;
 	struct device *dev = common->dev;
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
 
 	if (!IS_ERR_OR_NULL(rx_chn->desc_pool))
 		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
@@ -1845,6 +1852,7 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct k3_udma_glue_rx_channel_cfg rx_cfg = { 0 };
+	struct am65_cpsw_rx_flow *flows = rx_chn->flows;
 	u32  max_desc_num = AM65_CPSW_MAX_RX_DESC;
 	struct device *dev = common->dev;
 	u32 hdesc_size;
@@ -1855,12 +1863,12 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 					   AM65_CPSW_NAV_SW_DATA_SIZE);
 
 	rx_cfg.swdata_size = AM65_CPSW_NAV_SW_DATA_SIZE;
-	rx_cfg.flow_id_num = AM65_CPSW_MAX_RX_FLOWS;
+	rx_cfg.flow_id_num = common->rx_ch_num_flows;
 	rx_cfg.flow_id_base = common->rx_flow_id_base;
 
 	/* init all flows */
 	rx_chn->dev = dev;
-	rx_chn->descs_num = max_desc_num;
+	rx_chn->descs_num = max_desc_num * rx_cfg.flow_id_num;
 
 	rx_chn->rx_chn = k3_udma_glue_request_rx_chn(dev, "rx", &rx_cfg);
 	if (IS_ERR(rx_chn->rx_chn)) {
@@ -1902,6 +1910,8 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 				K3_UDMA_GLUE_SRC_TAG_LO_USE_REMOTE_SRC_TAG,
 		};
 
+		flows[i].id = i;
+		flows[i].common = common;
 		rx_flow_cfg.ring_rxfdq0_id = fdqring_id;
 		rx_flow_cfg.rx_cfg.size = max_desc_num;
 		rx_flow_cfg.rxfdq_cfg.size = max_desc_num;
@@ -1918,26 +1928,28 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 				k3_udma_glue_rx_flow_get_fdq_id(rx_chn->rx_chn,
 								i);
 
-		rx_chn->irq = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
-
-		if (rx_chn->irq <= 0) {
+		flows[i].irq = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
+		if (flows[i].irq <= 0) {
 			dev_err(dev, "Failed to get rx dma irq %d\n",
-				rx_chn->irq);
+				flows[i].irq);
 			ret = -ENXIO;
 			goto err;
 		}
-	}
 
-	netif_napi_add(common->dma_ndev, &common->napi_rx,
-		       am65_cpsw_nuss_rx_poll);
-
-	ret = devm_request_irq(dev, rx_chn->irq,
-			       am65_cpsw_nuss_rx_irq,
-			       IRQF_TRIGGER_HIGH, dev_name(dev), common);
-	if (ret) {
-		dev_err(dev, "failure requesting rx irq %u, %d\n",
-			rx_chn->irq, ret);
-		goto err;
+		snprintf(flows[i].name,
+			 sizeof(flows[i].name), "%s-rx%d",
+			 dev_name(dev), i);
+		netif_napi_add(common->dma_ndev, &flows[i].napi_rx,
+			       am65_cpsw_nuss_rx_poll);
+		ret = devm_request_irq(dev, flows[i].irq,
+				       am65_cpsw_nuss_rx_irq,
+				       IRQF_TRIGGER_HIGH,
+				       flows[i].name, &flows[i]);
+		if (ret) {
+			dev_err(dev, "failure requesting rx %d irq %u, %d\n",
+				i, flows[i].irq, ret);
+			goto err;
+		}
 	}
 
 err:
@@ -2774,7 +2786,7 @@ static int am65_cpsw_nuss_register_ndevs(struct am65_cpsw_common *common)
 		k3_udma_glue_disable_tx_chn(tx_chan[i].tx_chn);
 	}
 
-	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
+	for (i = 0; i < common->rx_ch_num_flows; i++)
 		k3_udma_glue_reset_rx_chn(rx_chan->rx_chn, i, rx_chan,
 					  am65_cpsw_nuss_rx_cleanup, !!i);
 
@@ -2817,12 +2829,17 @@ static int am65_cpsw_nuss_register_ndevs(struct am65_cpsw_common *common)
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
@@ -2951,6 +2968,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	common->rx_flow_id_base = -1;
 	init_completion(&common->tdown_complete);
 	common->tx_ch_num = AM65_CPSW_DEFAULT_TX_CHNS;
+	common->rx_ch_num_flows = AM65_CPSW_DEFAULT_RX_CHN_FLOWS;
 	common->pf_p0_rx_ptype_rrobin = false;
 	common->default_vlan = 1;
 
@@ -3142,8 +3160,10 @@ static int am65_cpsw_nuss_resume(struct device *dev)
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
index 1e4a045057fc..ecc38a36e9a7 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -21,8 +21,7 @@ struct am65_cpts;
 #define HOST_PORT_NUM		0
 
 #define AM65_CPSW_MAX_TX_QUEUES	8
-#define AM65_CPSW_MAX_RX_QUEUES	1
-#define AM65_CPSW_MAX_RX_FLOWS	1
+#define AM65_CPSW_MAX_RX_QUEUES	8
 
 #define AM65_CPSW_PORT_VLAN_REG_OFFSET	0x014
 
@@ -82,13 +81,22 @@ struct am65_cpsw_tx_chn {
 	u32 rate_mbps;
 };
 
+struct am65_cpsw_rx_flow {
+	u32 id;
+	struct napi_struct napi_rx;
+	struct am65_cpsw_common	*common;
+	int irq;
+	bool irq_disabled;
+	char name[32];
+};
+
 struct am65_cpsw_rx_chn {
 	struct device *dev;
 	struct device *dma_dev;
 	struct k3_cppi_desc_pool *desc_pool;
 	struct k3_udma_glue_rx_channel *rx_chn;
 	u32 descs_num;
-	int irq;
+	struct am65_cpsw_rx_flow flows[AM65_CPSW_MAX_RX_QUEUES];
 };
 
 #define AM65_CPSW_QUIRK_I2027_NO_TX_CSUM BIT(0)
@@ -134,10 +142,8 @@ struct am65_cpsw_common {
 	struct completion	tdown_complete;
 	atomic_t		tdown_cnt;
 
+	int			rx_ch_num_flows;
 	struct am65_cpsw_rx_chn	rx_chns;
-	struct napi_struct	napi_rx;
-
-	bool			rx_irq_disabled;
 
 	u32			nuss_ver;
 	u32			cpsw_ver;
@@ -186,8 +192,8 @@ struct am65_cpsw_ndev_priv {
 #define am65_common_get_host(common) (&(common)->host)
 #define am65_common_get_port(common, id) (&(common)->ports[(id) - 1])
 
-#define am65_cpsw_napi_to_common(pnapi) \
-	container_of(pnapi, struct am65_cpsw_common, napi_rx)
+#define am65_cpsw_napi_to_rx_flow(pnapi) \
+	container_of(pnapi, struct am65_cpsw_rx_flow, napi_rx)
 #define am65_cpsw_napi_to_tx_chn(pnapi) \
 	container_of(pnapi, struct am65_cpsw_tx_chn, napi_tx)
 
@@ -199,7 +205,8 @@ extern const struct ethtool_ops am65_cpsw_ethtool_ops_slave;
 
 void am65_cpsw_nuss_set_p0_ptype(struct am65_cpsw_common *common);
 void am65_cpsw_nuss_remove_tx_chns(struct am65_cpsw_common *common);
-int am65_cpsw_nuss_update_tx_chns(struct am65_cpsw_common *common, int num_tx);
+void am65_cpsw_nuss_remove_rx_chns(void *data);
+int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common, int num_tx, int num_rx);
 
 bool am65_cpsw_port_dev_check(const struct net_device *dev);
 

-- 
2.34.1


