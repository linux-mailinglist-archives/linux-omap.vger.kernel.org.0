Return-Path: <linux-omap+bounces-2648-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 611359C2C12
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 12:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258C52822E2
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B904178370;
	Sat,  9 Nov 2024 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNbBIdwA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C461714A1;
	Sat,  9 Nov 2024 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150026; cv=none; b=tIaMJsumOGa/9ntxp0Q9TG2lY3YEU4LjQq+fOSj+KovbMsmAzItOux88sGfE+mZrUt92jy0b6V8Yk1LuFOZj4uH4dYqvoKx8Lrf83yxNypdU3Wln4UDXQmtOP3rhDvXsgTvRxFLYWnZvVN0iUdlqWWbvlpbOI1CTvvhU9Gh5FY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150026; c=relaxed/simple;
	bh=C2Ggr7/lBmMYcsEocbkbo4QN88kd46oS6nv6gv/iEgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tdk/dATG25qZsglyCT58Eah/YnxsKARFmIPTJjIJ7bcjxWSt+heubNXQegR7RfBFXrym2p8Cgqt9rbePWhd/dMoFCDea+8diu5XmimP5/uizJpvVfQq1tIbRTQEkzQHqQkt8fPxwFAmTILMe7zoSgmLzD1bS63oRBbiOq4dcjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNbBIdwA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA51C4CECE;
	Sat,  9 Nov 2024 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731150025;
	bh=C2Ggr7/lBmMYcsEocbkbo4QN88kd46oS6nv6gv/iEgA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CNbBIdwAm3xS6s+wZ3pr+GNj3QD0NVrazS5bSRsfAn+kui58+vt57tSGgYlTJtj3p
	 vxwpUW65Hu6ebxD/Gq5RA1ja2++m7Qz6dUgNWtByqvIHCrdlbkY3nm0Zj5u6az5JcS
	 T4VAuRyZIaQ+WW8Ap2UDf3aiY7pDHOUV+aH6qb4ZxUbjeX5xoLeQFi2N91APv/y7Ot
	 v2ZgVYMQ87KaBDAelMcPqHK30BqWFXJ6Vx6IjC0Tspm1wPfxKpzxQU1/EHLVTwgoTl
	 9VzGA7WQ4b6W1tsdgRBDUGl6VDfK0YjNUP7pVr0l/CeiFcYpAllI+H50sPEU4JLGXH
	 xI3XfRRrG+a4g==
From: Roger Quadros <rogerq@kernel.org>
Date: Sat, 09 Nov 2024 13:00:08 +0200
Subject: [PATCH net-next v3 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-am65-cpsw-multi-rx-dscp-v3-2-1cfb76928490@kernel.org>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
In-Reply-To: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=C2Ggr7/lBmMYcsEocbkbo4QN88kd46oS6nv6gv/iEgA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnL0C/p93EJarGcx0+FJBWemE0yLPM2z20HXQIa
 aYHJxbEwvSJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZy9AvwAKCRDSWmvTvnYw
 k29bEADKJNXfzn+YvxF+JuefXvuYT2LJBi7Qms8XonKOcs3hnOQsdAwJoFZV3fLHrIWN9PLvJel
 tMc58bXPRsgZ8nRGAKCV8zReWoVIx97bXBqpiPlMpW4KbiiqqjvL+2f4zkkXP8mer2NWN8m2Vvv
 UqSzHonhYSLvf17laJQLzbo8T6B22v9hS4GMZip63e42+AfkbWM0ORyuScnOhZh/Ec7JZQttq2I
 aQb97TRzCgeOIZ1g3sRllJfxTlbxhpeZ+pi/70BhoqVg0vf55sZEg58HBkfp10OG8jnETAFc+y8
 hH8ijX8Voeyu/Eifakh+sDdOWmX+Jr6VlE9kYugmr3VMWfASRzdI4+6A5NWhSz6RhKkC1sweZpn
 fq7kiEePmyavQBXJzy69mlurNdcLikgM29Z25OipCk31Izk46dl9OmB6Of9f2dHmOXD13LJZX5A
 52fpub8Z8ri3oZGOX4uZ/GDH3bYrs+BchP4wAaWlKQfg0nrMdCH4FcgPObgfIMD+lj07mzrdBaZ
 +M5QuG5oKKeNBR1qI/GDUzOgSifXvRlzxQup0y9tMzrypVmmDC4eWMY9L7bZJFjc8U/QYqX5lvX
 vAEoQaAu0OJVlDYr2JkJVi+u4jmCQjwyF5R2uN5jgZ3Rrkr+o3ghDnH8aM7jls2lshKETSQ5+iE
 SKsV2xB6qP+9x0Q==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
appropriate priority queue via DSCP to Priority mapping registers
(CPSW_PN_RX_PRI_MAP_REG).

We use the upper 3 bits of the DSCP field that indicate IP Precedence
to map traffic to 8 priority queues.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 0520e9f4bea7..fab35e6aac7f 100644
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
@@ -176,6 +182,53 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
 	writel(mac_lo, slave->port_base + AM65_CPSW_PORTN_REG_SA_L);
 }
 
+#define AM65_CPSW_DSCP_MAX	GENMASK(5, 0)
+#define AM65_CPSW_PRI_MAX	GENMASK(2, 0)
+#define AM65_CPSW_DSCP_PRI_PER_REG	8
+#define AM65_CPSW_DSCP_PRI_SIZE		4	/* in bits */
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
+	/* 32-bit register offset to this dscp */
+	reg_ofs = (dscp / AM65_CPSW_DSCP_PRI_PER_REG) * 4;
+	/* bit field offset to this dscp */
+	bit_ofs = AM65_CPSW_DSCP_PRI_SIZE * (dscp % AM65_CPSW_DSCP_PRI_PER_REG);
+
+	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
+	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
+	val |= pri << bit_ofs;			/* set */
+	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
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
@@ -921,6 +974,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	common->usage_count++;
 
 	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
+	am65_cpsw_port_enable_dscp_map(port);
 
 	if (common->is_emac_mode)
 		am65_cpsw_init_port_emac_ale(port);

-- 
2.34.1


