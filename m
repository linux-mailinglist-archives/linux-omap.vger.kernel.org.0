Return-Path: <linux-omap+bounces-2586-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CE9BCEF6
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 15:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14E41C22327
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 14:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8A91D9A7F;
	Tue,  5 Nov 2024 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgHL1rEu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61F1CC159;
	Tue,  5 Nov 2024 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816313; cv=none; b=T+ru/JX8w+NMGnFsoCP/Yv61vX2OBmBup8IEjDDxWGukTLqYM3/aeOQn27hqAQvuyktNRB0KVB8errHIV1xz8/NI57Ict3Wi4K+axS6xDtIqLN2JOI/fQTy6YgFhSaxOtbMKWR0utBOwsrUhaWGnQ5MDVuphxqgMU5IBA7FvPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816313; c=relaxed/simple;
	bh=NrEV4iAZN0aliHTzyP3alx8+mfS5kV8sLdO0OPZy9zY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIy/wqR4arx3ADCfdY7l/j0+Vd6vzfOzTF26DBQrHUiKBMg/bhrz/zgX/kuZaFG/prChZ+6miE6/NK+PUmCPpiG7vEdGAr+wHCgfT9sIXj3a8qmCFtuEexdiWVEc0D2qTZIvQwuvPI8E/ymFePNstboCOWbPeS/4FfWwh+gwf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgHL1rEu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F5CC4CECF;
	Tue,  5 Nov 2024 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816312;
	bh=NrEV4iAZN0aliHTzyP3alx8+mfS5kV8sLdO0OPZy9zY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SgHL1rEusclIvRylQVHlw+BAIKGdQQlyGM6ZIFuAKxzbJ/6xVMYta9ASqZHOHtzDv
	 PLphr7Oid5ZIm7wCv217mxQXYrDMQ6g4UVpLtcAk2DJcl/rlENHhrXimD02ddT7wPB
	 sqIJRkONNBR5NX3Fj5aBzzaF2lROWs0wFtoqLDcvskO9f2hjatJce6ZLZDRAKZXuMX
	 pTXwsgABd7WmAmHS+EjCoRoItPiAGbQokNlwb/ezk6m+pS0jOW+mmR1liO3UQdT/KD
	 uI4+Gk4vSHurxpbOka9EWfa49lkp291G8xi45y5ilU4SWfvbGm07AZmxIhr9+KbBm9
	 l4jiyJvu1gzew==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 05 Nov 2024 16:18:11 +0200
Subject: [PATCH net-next 2/2] net: ethernet: ti: am65-cpsw: enable DSCP to
 priority map for RX
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
In-Reply-To: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnKikumLdHtahFOh9xQzDkn+wgNGej/VIF9qHfp
 qIVLCTaxsGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZyopLgAKCRDSWmvTvnYw
 k9y/EAC/6GPMN2es35uVl3P8XaupweEtL1EY/+WKJX/hR3qLRiWl1UB4vF3ZJzWxwQI+zQ/jakK
 fYyc7iE1X/Ai50xVjYlU9j4PlZ5AWJ0KkJzMu7Sh22D+0ZgIJN8PCDJdAARwPNkwsGku19PcQCy
 +4fip6lWrTr4jrB0wknOsWSMG7crOBHUxdUOKfZQgFU4wC+dGwncNeld8r2/Vj0mqOfN6ieDUNx
 46oZiu1rE0S/ffRZNRBBan0CBat0Q0LZ/roTZKzVj6kN6ikmLihfBxv/KiWypNytS5YmgB9JAhy
 WkrAEd7/m1Kf6yKyb9LL96Gt+iy2/pN8YZ4H+zlwETr8rx9cTKZhcUPf7A9sZ9QjTH5QoiSDi9R
 iikb6WZ28Y8wimYNmwVGxXQbYE7ccgnkz+18mWgc1SZ/S5KuIRHCRmxNQFNAetK5AP41WXam8nf
 zBE6uDkmx5HtKVLjaeT1TELLaHl3f9PRujpTL+MBH3eAg2a9iEhGu/I8pG3TDC0jbs34D9bxE64
 r737XBgJGCqQmmxeAGlAnvtMOqlJLILeKSzN5DhHVrdoiuKDLg5tnoY5OPCVUOkoS3w/XLVNSYQ
 feb8Oxn8I8PGRjekn7Imi7gebQMgCmRB3RTlMUr+/Zder0yq/kHOCTBzVepKu7O/EryhGMj5znS
 pZ/qLo7bkz8WK1A==
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


