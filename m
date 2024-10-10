Return-Path: <linux-omap+bounces-2378-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D71998462
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DC2283568
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4D51C245D;
	Thu, 10 Oct 2024 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgVmnGPL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ADD29AF;
	Thu, 10 Oct 2024 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558266; cv=none; b=TQLI4CZ2RnGt6BMAo6xLKLMYMjlIh3m2MagycfnQ0cVARC3U9H4hOT7j85pPkn9dIz/vofQE59/Z4hNGDG0eOBtpaL+532wMKzQhAJGGmJC2vjVYuvz9Lp9tBXqapngoPFPtUzUJ0mhYi4zBEg6FHS4+Kq8ElXncguBCGheC4Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558266; c=relaxed/simple;
	bh=IKGBL05vgJKhY3i5ZnFEfGd0SmIQ6mvaydqpgh5NX/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDzIMsdrb8zAMM9nwPh1K5dSc4vZvBWzHanAQNYohxiVQnuJPTeOld6cV04LZQD+keRhvsbrjhBlfvNHp9PfXih4mbVYz1tycmBe00bDUMhAg7VlQYYmDiTzjUH6XRy9SXs/jSl3ghjqYopNQUXzLfdHQZ429vKVtyzR7remdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgVmnGPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4C6C4CEC5;
	Thu, 10 Oct 2024 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558265;
	bh=IKGBL05vgJKhY3i5ZnFEfGd0SmIQ6mvaydqpgh5NX/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pgVmnGPLeHkDZnJm1kxzInZkWh/KKT2T0rXrU3myNuEjnLDXlRweZtG4lRO7adIAx
	 A05W6VZ0eY3ERVU/IL/9GC8TFznJMzLDVx+AgB27oEOviddi+R0g4gj/V1CZjo2tYk
	 oBA/0DenWgbyRbp3rk/JVhIdZAgbQyT5Q7YfCQjEe/hs+hi98uDpODMM/By2foVQ7A
	 sD5DwUbYjAVGswsEC6azkySXGnSdMUJOIQmu5PG+zbfVPmRv8nvgbIOqnxd7iUC4tW
	 gGuK3MdBu2D0h4+TkPv/9TQVmau6O/HH3zHtq28eSaZcj7+hOnWDEz5sBIIssRpaUR
	 17NfaFEpGaNDw==
From: Simon Horman <horms@kernel.org>
Date: Thu, 10 Oct 2024 12:04:11 +0100
Subject: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: Use tstats
 instead of open coded version
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-ti-warn-v2-2-9c8304af5544@kernel.org>
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.14.0

Make use of struct pcpu_sw_netstats and related helpers to handle
existing per-cpu stats for this driver - the exact same counters
are maintained.

A side effect of this change is to address __percpu warnings
flagged by Sparse:

.../am65-cpsw-nuss.c:2658:55: warning: incorrect type in initializer (different address spaces)
.../am65-cpsw-nuss.c:2658:55:    expected struct am65_cpsw_ndev_stats [noderef] __percpu *stats
.../am65-cpsw-nuss.c:2658:55:    got void *data
.../am65-cpsw-nuss.c:2781:15: warning: incorrect type in argument 3 (different address spaces)
.../am65-cpsw-nuss.c:2781:15:    expected void *data
.../am65-cpsw-nuss.c:2781:15:    got struct am65_cpsw_ndev_stats [noderef] __percpu *stats

Compile tested only.
No functional change intended.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/20240911170643.7ecb1bbb@kernel.org/
Signed-off-by: Simon Horman <horms@kernel.org>
---
I did look at also dropping am65_cpsw_nuss_ndo_get_stats, the custom
implementation of ndo_get_stats64 by using dev_core_stats.
However, I couldn't see how to handle rx_errors.
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 92 +++-----------------------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  9 ----
 2 files changed, 8 insertions(+), 93 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index b08e2c3aeda3..50b0c8d22b9c 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1031,9 +1031,7 @@ static int am65_cpsw_run_xdp(struct am65_cpsw_rx_flow *flow,
 			     int desc_idx, int cpu, int *len)
 {
 	struct am65_cpsw_common *common = flow->common;
-	struct am65_cpsw_ndev_priv *ndev_priv;
 	struct net_device *ndev = port->ndev;
-	struct am65_cpsw_ndev_stats *stats;
 	int ret = AM65_CPSW_XDP_CONSUMED;
 	struct am65_cpsw_tx_chn *tx_chn;
 	struct netdev_queue *netif_txq;
@@ -1051,9 +1049,6 @@ static int am65_cpsw_run_xdp(struct am65_cpsw_rx_flow *flow,
 	/* XDP prog might have changed packet data and boundaries */
 	*len = xdp->data_end - xdp->data;
 
-	ndev_priv = netdev_priv(ndev);
-	stats = this_cpu_ptr(ndev_priv->stats);
-
 	switch (act) {
 	case XDP_PASS:
 		ret = AM65_CPSW_XDP_PASS;
@@ -1073,20 +1068,14 @@ static int am65_cpsw_run_xdp(struct am65_cpsw_rx_flow *flow,
 		if (err)
 			goto drop;
 
-		u64_stats_update_begin(&stats->syncp);
-		stats->rx_bytes += *len;
-		stats->rx_packets++;
-		u64_stats_update_end(&stats->syncp);
+		dev_sw_netstats_tx_add(ndev, 1, *len);
 		ret = AM65_CPSW_XDP_CONSUMED;
 		goto out;
 	case XDP_REDIRECT:
 		if (unlikely(xdp_do_redirect(ndev, xdp, prog)))
 			goto drop;
 
-		u64_stats_update_begin(&stats->syncp);
-		stats->rx_bytes += *len;
-		stats->rx_packets++;
-		u64_stats_update_end(&stats->syncp);
+		dev_sw_netstats_rx_add(ndev, *len);
 		ret = AM65_CPSW_XDP_REDIRECT;
 		goto out;
 	default:
@@ -1147,7 +1136,6 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
 	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
 	struct am65_cpsw_common *common = flow->common;
 	struct am65_cpsw_ndev_priv *ndev_priv;
-	struct am65_cpsw_ndev_stats *stats;
 	struct cppi5_host_desc_t *desc_rx;
 	struct device *dev = common->dev;
 	struct page *page, *new_page;
@@ -1233,12 +1221,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
 	am65_cpsw_nuss_rx_csum(skb, csum_info);
 	napi_gro_receive(&flow->napi_rx, skb);
 
-	stats = this_cpu_ptr(ndev_priv->stats);
-
-	u64_stats_update_begin(&stats->syncp);
-	stats->rx_packets++;
-	stats->rx_bytes += pkt_len;
-	u64_stats_update_end(&stats->syncp);
+	dev_sw_netstats_rx_add(ndev, pkt_len);
 
 allocate:
 	new_page = page_pool_dev_alloc_pages(flow->page_pool);
@@ -1321,10 +1304,7 @@ static struct sk_buff *
 am65_cpsw_nuss_tx_compl_packet_skb(struct am65_cpsw_tx_chn *tx_chn,
 				   dma_addr_t desc_dma)
 {
-	struct am65_cpsw_ndev_priv *ndev_priv;
-	struct am65_cpsw_ndev_stats *stats;
 	struct cppi5_host_desc_t *desc_tx;
-	struct net_device *ndev;
 	struct sk_buff *skb;
 	void **swdata;
 
@@ -1334,16 +1314,9 @@ am65_cpsw_nuss_tx_compl_packet_skb(struct am65_cpsw_tx_chn *tx_chn,
 	skb = *(swdata);
 	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
 
-	ndev = skb->dev;
-
 	am65_cpts_tx_timestamp(tx_chn->common->cpts, skb);
 
-	ndev_priv = netdev_priv(ndev);
-	stats = this_cpu_ptr(ndev_priv->stats);
-	u64_stats_update_begin(&stats->syncp);
-	stats->tx_packets++;
-	stats->tx_bytes += skb->len;
-	u64_stats_update_end(&stats->syncp);
+	dev_sw_netstats_tx_add(skb->dev, 1, skb->len);
 
 	return skb;
 }
@@ -1354,8 +1327,6 @@ am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
 				   dma_addr_t desc_dma,
 				   struct net_device **ndev)
 {
-	struct am65_cpsw_ndev_priv *ndev_priv;
-	struct am65_cpsw_ndev_stats *stats;
 	struct cppi5_host_desc_t *desc_tx;
 	struct am65_cpsw_port *port;
 	struct xdp_frame *xdpf;
@@ -1369,14 +1340,7 @@ am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
 	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
 
 	port = am65_common_get_port(common, port_id);
-	*ndev = port->ndev;
-
-	ndev_priv = netdev_priv(*ndev);
-	stats = this_cpu_ptr(ndev_priv->stats);
-	u64_stats_update_begin(&stats->syncp);
-	stats->tx_packets++;
-	stats->tx_bytes += xdpf->len;
-	u64_stats_update_end(&stats->syncp);
+	dev_sw_netstats_tx_add(port->ndev, 1, xdpf->len);
 
 	return xdpf;
 }
@@ -1899,31 +1863,7 @@ static int am65_cpsw_nuss_ndo_slave_ioctl(struct net_device *ndev,
 static void am65_cpsw_nuss_ndo_get_stats(struct net_device *dev,
 					 struct rtnl_link_stats64 *stats)
 {
-	struct am65_cpsw_ndev_priv *ndev_priv = netdev_priv(dev);
-	unsigned int start;
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-		struct am65_cpsw_ndev_stats *cpu_stats;
-		u64 rx_packets;
-		u64 rx_bytes;
-		u64 tx_packets;
-		u64 tx_bytes;
-
-		cpu_stats = per_cpu_ptr(ndev_priv->stats, cpu);
-		do {
-			start = u64_stats_fetch_begin(&cpu_stats->syncp);
-			rx_packets = cpu_stats->rx_packets;
-			rx_bytes   = cpu_stats->rx_bytes;
-			tx_packets = cpu_stats->tx_packets;
-			tx_bytes   = cpu_stats->tx_bytes;
-		} while (u64_stats_fetch_retry(&cpu_stats->syncp, start));
-
-		stats->rx_packets += rx_packets;
-		stats->rx_bytes   += rx_bytes;
-		stats->tx_packets += tx_packets;
-		stats->tx_bytes   += tx_bytes;
-	}
+	dev_fetch_sw_netstats(stats, dev->tstats);
 
 	stats->rx_errors	= dev->stats.rx_errors;
 	stats->rx_dropped	= dev->stats.rx_dropped;
@@ -2710,13 +2650,6 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 	return ret;
 }
 
-static void am65_cpsw_pcpu_stats_free(void *data)
-{
-	struct am65_cpsw_ndev_stats __percpu *stats = data;
-
-	free_percpu(stats);
-}
-
 static void am65_cpsw_nuss_phylink_cleanup(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_port *port;
@@ -2736,7 +2669,6 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 	struct device *dev = common->dev;
 	struct am65_cpsw_port *port;
 	struct phylink *phylink;
-	int ret;
 
 	port = &common->ports[port_idx];
 
@@ -2830,21 +2762,13 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 	if (common->pdata.quirks & AM65_CPSW_QUIRK_I2027_NO_TX_CSUM)
 		port->ndev->features &= ~NETIF_F_HW_CSUM;
 
-	ndev_priv->stats = netdev_alloc_pcpu_stats(struct am65_cpsw_ndev_stats);
-	if (!ndev_priv->stats)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, am65_cpsw_pcpu_stats_free,
-				       ndev_priv->stats);
-	if (ret)
-		dev_err(dev, "failed to add percpu stat free action %d\n", ret);
-
+	port->ndev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 	port->xdp_prog = NULL;
 
 	if (!common->dma_ndev)
 		common->dma_ndev = port->ndev;
 
-	return ret;
+	return 0;
 }
 
 static int am65_cpsw_nuss_init_ndevs(struct am65_cpsw_common *common)
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index dc8d544230dc..3f3e353dfe88 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -180,18 +180,9 @@ struct am65_cpsw_common {
 	u32			*ale_context;
 };
 
-struct am65_cpsw_ndev_stats {
-	u64 tx_packets;
-	u64 tx_bytes;
-	u64 rx_packets;
-	u64 rx_bytes;
-	struct u64_stats_sync syncp;
-};
-
 struct am65_cpsw_ndev_priv {
 	u32			msg_enable;
 	struct am65_cpsw_port	*port;
-	struct am65_cpsw_ndev_stats __percpu *stats;
 	bool offload_fwd_mark;
 	/* Serialize access to MAC Merge state between ethtool requests
 	 * and link state updates

-- 
2.45.2


