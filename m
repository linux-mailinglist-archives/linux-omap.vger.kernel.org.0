Return-Path: <linux-omap+bounces-2607-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BC9C05D5
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 13:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4E21F21D09
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E352101B5;
	Thu,  7 Nov 2024 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLt1LscA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7062101A4;
	Thu,  7 Nov 2024 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982588; cv=none; b=h1pbqmr/i7mfIXX6WF8Rh9+n8gz/BgVPxUS9Xd0DrMyIGNME1QVCrOgspCblw8sC95NjC1kd4cnxlwn+Ab+eaJxrcTpH6ACuupI43wT/9nRRvYKbCDUkHX9gc+YDe8eUveOvHQ0a4mXlSuRjNsycBOgABLmjc6X3vOpIUgABVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982588; c=relaxed/simple;
	bh=NrEV4iAZN0aliHTzyP3alx8+mfS5kV8sLdO0OPZy9zY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mk14a8Q2gSrfUrufhkRMLzQSIXCo+MS3uVprOX7R+kwH5v+uKPBqFNcpysI9PGn8/zr5SjugSq65kbELegiJLS13vhFv8pe9rMF7Jfi/XC2EKjFZNwZp3Zc7mx/1/SMPKHLsLvXO8KOUdTdBSfxOGRjEXtVJvvKyhOINFW9nLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLt1LscA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5637C4CED2;
	Thu,  7 Nov 2024 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730982587;
	bh=NrEV4iAZN0aliHTzyP3alx8+mfS5kV8sLdO0OPZy9zY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JLt1LscAzbLbz4jXQOAxppFBWpowV+pDW2x6NkVQeFkEuPYugn8FIiwZhzdxfxFeW
	 HzhR1KM8iT0OsAZ8BbgwYw/ANqTnGMCQOxVpeIDk8LuiMPA0k9D3uoSK9otgCquIHS
	 30F90ArfTx/PdTokvY1DtOL9Du2bPgtKvpvQ/CaXJRSZQOKgBqpw7Bkd3inRLQ76tG
	 1VZdWxGLrLAdrDcZY0UsdG/tE/NUb6TCbWcxyatIFWpHrb9JSCAquU9U+tePbFmXaB
	 rCi3fBbFE2xFtwRp2hrvLug7fENjgzwXSlzjS3U/xaJpUZ115nA6/AgvCacVRveMEN
	 /isp1nQRqCm1Q==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 07 Nov 2024 14:29:30 +0200
Subject: [PATCH net-next v2 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-am65-cpsw-multi-rx-dscp-v2-2-9e9cd1920035@kernel.org>
References: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
In-Reply-To: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=NrEV4iAZN0aliHTzyP3alx8+mfS5kV8sLdO0OPZy9zY=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnLLKx3sRmt/4x9giNnh1pnVhDarGvXWedi/5k8
 0rxZdpLLpqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyyysQAKCRDSWmvTvnYw
 k0PbD/wJm+z+1i5O7IO8HfrlRGQ4ZkkgAXW387plEg2xN9CsLML5cFzsDJXuQSRfqm0DVmiB4B0
 7fKvYwigtS6YxpK3DkhNGK6CYVXB85exGSE9ak9LT5M7dUjpkrUWxJdFFiFTnVkuA0lGd4IWM4y
 2gwYCLvrj8hJSNsPjUUu3ZUGM/Bqfou3yMTH+Rhl9YnnIZaL9TEYxofsEMKWnvDcsu8DdwcmzWi
 XIMixFHVrGsVORaYq1l2zjXbS5fubFagQ2YPzJQWfkaZbYqdKHEpg8vlojv/tQC8HuHl8K6hpsl
 WhEPFL7dLpGLR1hLndYiqxjxc4mcoGzxR2t7lHskqBbFy8Sbf2J5o5d3x7ElfteBHuMl0IBh9XV
 v5HC4N5ThC1ctM/WSI3KNcw/Ly6z7PtwLctbJgFfqvj90kppvMStgkNrWLmy/xUhAocy4HVryiV
 V4IaUKrDJ4DhKuFUVMco4QwjEw+xndzEKx5wBi8ehjWXC19aZl6mz9r62uNjBMckBn9I6Q8sBy2
 uhyS5euhdTopmbG9Tzy9IZ/KuvKhfIhBY0fUnBjPnLob5eouP/4TWcWvtqRLOO3gCZ42b29xaIA
 YF4vUPiBL/9+qBCEDHM1GEWgUeHxpDbyXCiABiArmx+tqtw5yF1UyoV7Xgje14qoyDjEMaD+TvK
 idX50VQETRt8DNA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
appropriate priority queue via DSCP to Priority mapping registers
(CPSW_PN_RX_PRI_MAP_REG).

We use the upper 3 bits of the DSCP field that indicate IP Precedence
to map traffic to 8 priority queues.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 0520e9f4bea7..65fbf6727e02 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -71,6 +71,8 @@
 #define AM65_CPSW_PORT_REG_RX_PRI_MAP		0x020
 #define AM65_CPSW_PORT_REG_RX_MAXLEN		0x024
 
+#define AM65_CPSW_PORTN_REG_CTL			0x004
+#define AM65_CPSW_PORTN_REG_DSCP_MAP		0x120
 #define AM65_CPSW_PORTN_REG_SA_L		0x308
 #define AM65_CPSW_PORTN_REG_SA_H		0x30c
 #define AM65_CPSW_PORTN_REG_TS_CTL              0x310
@@ -94,6 +96,10 @@
 /* AM65_CPSW_PORT_REG_PRI_CTL */
 #define AM65_CPSW_PORT_REG_PRI_CTL_RX_PTYPE_RROBIN	BIT(8)
 
+/* AM65_CPSW_PN_REG_CTL */
+#define AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN	BIT(1)
+#define AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN	BIT(2)
+
 /* AM65_CPSW_PN_TS_CTL register fields */
 #define AM65_CPSW_PN_TS_CTL_TX_ANX_F_EN		BIT(4)
 #define AM65_CPSW_PN_TS_CTL_TX_VLAN_LT1_EN	BIT(5)
@@ -176,6 +182,49 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
 	writel(mac_lo, slave->port_base + AM65_CPSW_PORTN_REG_SA_L);
 }
 
+#define AM65_CPSW_DSCP_MAX	GENMASK(5, 0)
+#define AM65_CPSW_PRI_MAX	GENMASK(2, 0)
+static int am65_cpsw_port_set_dscp_map(struct am65_cpsw_port *slave, u8 dscp, u8 pri)
+{
+	int reg_ofs;
+	int bit_ofs;
+	u32 val;
+
+	if (dscp > AM65_CPSW_DSCP_MAX)
+		return -EINVAL;
+
+	if (pri > AM65_CPSW_PRI_MAX)
+		return -EINVAL;
+
+	reg_ofs = (dscp / 8) * 4;	/* reg offset to this dscp */
+	bit_ofs = 4 * (dscp % 8);	/* bit offset to this dscp */
+	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
+	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
+	val |= pri << bit_ofs;			/* set */
+	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
+	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
+
+	return 0;
+}
+
+static void am65_cpsw_port_enable_dscp_map(struct am65_cpsw_port *slave)
+{
+	int dscp, pri;
+	u32 val;
+
+	/* Map IP Precedence field to Priority */
+	for (dscp = 0; dscp <= AM65_CPSW_DSCP_MAX; dscp++) {
+		pri = dscp >> 3; /* Extract IP Precedence */
+		am65_cpsw_port_set_dscp_map(slave, dscp, pri);
+	}
+
+	/* enable port IPV4 and IPV6 DSCP for this port */
+	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_CTL);
+	val |= AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN |
+		AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN;
+	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_CTL);
+}
+
 static void am65_cpsw_sl_ctl_reset(struct am65_cpsw_port *port)
 {
 	cpsw_sl_reset(port->slave.mac_sl, 100);
@@ -921,6 +970,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	common->usage_count++;
 
 	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
+	am65_cpsw_port_enable_dscp_map(port);
 
 	if (common->is_emac_mode)
 		am65_cpsw_init_port_emac_ale(port);

-- 
2.34.1


