Return-Path: <linux-omap+bounces-2685-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA89C8BEE
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 14:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB46287561
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112183BBC9;
	Thu, 14 Nov 2024 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMyXZRn+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12C36AEC;
	Thu, 14 Nov 2024 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591434; cv=none; b=BubuXqjEyWZw5VJ5jmdRaYOB8uEhtgvRuatsgqnFWL7bZMPz8s7ZXY+/J5ittUQWxesGLBqS9wIp6yzyAjAgJ/NlRdem8wRjByRTgdxr9xjDFYTkWh49gG3QRtgWrfVPi7YhaFEzJ4doj+VLoFDYC3/uPbgYaS31QLPCtBEttkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591434; c=relaxed/simple;
	bh=z0ibvP2+uFf2NigqDZN1BTPasnFxzj7OMV2W7BeLjtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJxQwScFpnlJU8nS2UaArzHOWxkGzoH+Vp4LtWurqjL4/9q0YhHuFQDiofopFv250GDqsDT2fBEZCwGtfONybCv26xwsQtgfcqSnPQFmk64XlwCZmj4FNx/sHH4jBC+jAlhGqOwOnYQbSfRWLvbAOHfVlz+632qswh2knFwpFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMyXZRn+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED19C4CECD;
	Thu, 14 Nov 2024 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731591434;
	bh=z0ibvP2+uFf2NigqDZN1BTPasnFxzj7OMV2W7BeLjtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YMyXZRn+HhLi/gerWB9ktVwYFdfAs25Wg7SqUOYukeGHYtiLF7xV6skBVTiTL3Rcp
	 TV8KqtXkh0DdkthCNQjd2uLcAFyGJjd8cp2XDas5PiinvVNsY6BbexjLIkc3oFcnXU
	 mf6DAPGsIN7dnsEZ5gyBJECZOwJkgAPiP7U7U6RhimjYJRVSkk/JnR2/a6KysApXLb
	 BQub3r5rJxPRh7bv2jSaWmJ9IWKzj2fYGIEBBsNkKUqZbSaSf4MKG+1YWqlxRnV1kV
	 RCGHXxR0A5y9B3/z4uFPhn+5x+2ECXeQ8/YaqO+Y3Tl1dyYwYXZ3Y9LyzPN2PoRD/Q
	 goIEG+szOkhRQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 14 Nov 2024 15:36:53 +0200
Subject: [PATCH net-next v4 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-am65-cpsw-multi-rx-dscp-v4-2-93eaf6760759@kernel.org>
References: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
In-Reply-To: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Guillaume Nault <gnault@redhat.com>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4439; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=z0ibvP2+uFf2NigqDZN1BTPasnFxzj7OMV2W7BeLjtk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnNf0AHuDqyqgGS25QnmggNIMqhYH+U6v67V6s6
 1naCcHveWGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZzX9AAAKCRDSWmvTvnYw
 kzFpEACgdyykrz7NgAUhIgedUGbQu5jwz8sRk6f3Et8ZW9z0yhi7zKnVYj/HNRCMToKKCP2Rnkr
 +rNmMbivrHQ4rC5/A01VYN52JkjVfQUqd7fM4d5YtjQPPDMgZOIXDhPxuDJGNRZTnol51gMnk+1
 W8htG14vcBpmE3xVgWc0jAYuT5XGJGYcTgwfFgV5IQRywoPeZzGBd8NCL1Ls8m6XWiHq/vxy625
 7QgEsHhLkTyPAG7sE9B2EzTbQN3c+68affbNU999s+e6FC9FsoBgApZSiYWpb+vKOJEhspdBezQ
 TBb8xyykhL2HAEOWgegJX3VYme+PkeVYFJF4eqfnvAslLlSqnRplrUHHqaoqaUbDMCclU2AYL1e
 gr+AxygsJ7LAKlYUlI6kHNhjnm5tOgf5F5DkCRJ0qosk4VkQdEcX7C3YHLwL97QhmQRmWT37L89
 IkmHJILESNaS5++1KfZ8GSPZW9YXBDpfO6ePYl/h78Xcd5POzbe+6gAUuZhIIR4PaZmh6yoG1bD
 KYpOFSRLkUNh6ElXy1biOr09JvJgUAn0EFidgbEZo3x/e/RFRtRLHEJolQ/WXCqyDx+r/pg3m7W
 7dRAwU4cNmIe97Xvhz4jSq2r6990JQEgwz9klGhI0U+pExsFLA6InpBbC0AgGsYHjtvFXwxa7u3
 3Amydvz64lwxlvw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
appropriate priority queue via DSCP to Priority mapping registers
(CPSW_PN_RX_PRI_MAP_REG).

Use a default DSCP to User Priority (UP) mapping as per
https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
and
https://datatracker.ietf.org/doc/html/rfc8622#section-11

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 100 +++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 0520e9f4bea7..8a6429aaded2 100644
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
@@ -176,6 +182,99 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
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
+	/* Default DSCP to User Priority mapping as per:
+	 * https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
+	 * and
+	 * https://datatracker.ietf.org/doc/html/rfc8622#section-11
+	 */
+	for (dscp = 0; dscp <= AM65_CPSW_DSCP_MAX; dscp++) {
+		switch (dscp) {
+		case 56:	/* CS7 */
+		case 48:	/* CS6 */
+			pri = 7;
+			break;
+		case 46:	/* EF */
+		case 44:	/* VA */
+			pri = 6;
+			break;
+		case 40:	/* CS5 */
+			pri = 5;
+			break;
+		case 34:	/* AF41 */
+		case 36:	/* AF42 */
+		case 38:	/* AF43 */
+		case 32:	/* CS4 */
+		case 26:	/* AF31 */
+		case 28:	/* AF32 */
+		case 30:	/* AF33 */
+		case 24:	/* CS3 */
+			pri = 4;
+			break;
+		case 18:	/* AF21 */
+		case 20:	/* AF22 */
+		case 22:	/* AF23 */
+			pri = 3;
+			break;
+		case 16:	/* CS2 */
+		case 10:	/* AF11 */
+		case 12:	/* AF12 */
+		case 14:	/* AF13 */
+		case 0:		/* DF */
+			pri = 0;
+			break;
+		case 8:		/* CS1 */
+		case 1:		/* LE */
+			pri = 1;
+			break;
+		default:
+			pri = 0;
+			break;
+		}
+
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
@@ -921,6 +1020,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	common->usage_count++;
 
 	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
+	am65_cpsw_port_enable_dscp_map(port);
 
 	if (common->is_emac_mode)
 		am65_cpsw_init_port_emac_ale(port);

-- 
2.34.1


