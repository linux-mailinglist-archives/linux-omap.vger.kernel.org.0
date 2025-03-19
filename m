Return-Path: <linux-omap+bounces-3464-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D926A68E07
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FDB175383
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB80257444;
	Wed, 19 Mar 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAzKeWcr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B81257442;
	Wed, 19 Mar 2025 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391690; cv=none; b=YSx8hK2jGNT69YV6lwOWjLC7cmVNPUK2NN1k4EVb+c/hzvix6OzdGsFW2i3LYxapHXE+DyMDegDDLmJg08fqGIe9qqLE/Inrlkt9HHWPIRJBgUFYDOeGcVqO/T1KfqflNjfxdE0/BmWAijzOjGtaJUNLnapF6REp3Nx4Ma5C2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391690; c=relaxed/simple;
	bh=MYN+8GPQJ1QFRYoP01Fl36gIYTYyzG95rG13R9gDY0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=heNmIXyV2p3WZ5uvQAV7k6rpgZEerRAxJRqo/hjQmk5eVdgu38Jnri5Tu4L4Jn/J67v2nZfjnlwnhjAdpX72XfsIjHjtioFxj95oMwWmloBlYHCXzLd/DibuSVzrTKy15PSWH+wnBTy+ODhhY73cJk/iNpVyRkiHIrYOJGKdt2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAzKeWcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D66C4CEE9;
	Wed, 19 Mar 2025 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391690;
	bh=MYN+8GPQJ1QFRYoP01Fl36gIYTYyzG95rG13R9gDY0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PAzKeWcrk8dcrj3MpNcI5L8yXV2BWDi0rmTXKJoCeX+dWEkX62JY76N7ywrFPUAzI
	 4xhdpoAZvHrJ4yyyea8TxEnYJgXL4ujl/oea/SrVlyQxBETcPXC9m4hVpPt6rclxGl
	 U5X9Iztzquo5j0fW6J9oypmseCgNGf8vWvYNbIqRSk3zn0t87pRfcEujK/W6/r4eti
	 x/OD8zs/5ZIGg/y+uB7TobfX8N+hueWhOfnfKuy7sd8vsi+TNf90uLqou3kyqxhG4m
	 Mb9IROtHUwV235d6nSSGsA6AK4BRzmvakTvil6II9oXIlXgih2g2Nn2IT2XofopYWV
	 cmafl0ZeaZesQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:32 +0200
Subject: [PATCH net-next 6/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_set/clr_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-6-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5145; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=MYN+8GPQJ1QFRYoP01Fl36gIYTYyzG95rG13R9gDY0M=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slxbCusx2boZK9IY3ZkG6KeTlgdiSbjaHng5
 C2pkNLvFl6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcQAKCRDSWmvTvnYw
 k3Z5D/4rG4sRsoRcNaObZTFZ2DcfopJr7TsViFrdi9uWrQBa9waBN03Xk+4isFmFIuvMODpePjf
 a/UY8OIgNAROfA1E6Cx7LLCIL23RLm6Xwx+Gtohju4s7r+fgtgZvzcN18Ol/bcYrYNj/VRQZTnn
 uSLLVBm89ym6mW0fqgjrPmUV/KnAMTBrQ3UZUu9d6phr8413xwBUiKHP5QtNrxyF1IJmrM0JxLk
 548S66XXQJYbdN8gIo5SkqqLZlGJgFwftNozhmSc+XCebXVDLmrW3XEeOel/YH/AKHaKrhH662W
 eidH3qcBQlk90njyye7gwNrBJiF8WRYx7jsCtD0pHMWvb5YiVfGBD8wn9CjdyV3ZGgdDeKe2Plm
 6ksYkFfAAOCg2zk/Cma12sfak3pSnkIdS+5TcBQcfNU6oPUQ5xVD5gh7W9SWLHFwb3pDXZvjuar
 IbRYqb1zSGQUPcFP8wVcQWVoWFJiRtJsAgqXMiWcb4bn5zT/I3+UZy7f9OTDeYNfCCLJG2zSVY8
 24kvXHwYlqupllv2ET/9sc9+YF5y4s8CrrP7jmRjhbWG0DBjO4j1nvSqoFTBJhpqLmDU4IcBQxD
 dolk7giyt+usRUktuflLS/tUoaJ8zDiLyx//jD/op9pw4ioGjaromIaDLQs4QCHKWdOPfqoNOKN
 E41kZhAoGi0FX8w==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Add cpsw_ale_policer_set/clr_entry() helpers.
So far Raw Ethernet matching based on Source/Destination address
and VLAN Priority (PCP) is supported.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 84 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h | 28 +++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 630e3a555190..f5ca18d4ea6a 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1746,3 +1746,87 @@ void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
 						   1);
 	}
 }
+
+#define HOST_PORT_NUM 0
+
+/* Clear Policer and associated ALE table entries */
+void cpsw_ale_policer_clr_entry(struct cpsw_ale *ale, u32 policer_idx,
+				struct cpsw_ale_policer_cfg *cfg)
+{
+	cpsw_ale_policer_reset_entry(ale, policer_idx);
+
+	/* We do not delete ALE entries that were added in set_entry
+	 * as they might still be in use by the port e.g. VLAN id
+	 * or port MAC address
+	 */
+
+	/* clear BLOCKED in case we set it */
+	if ((cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACSRC) && cfg->drop)
+		cpsw_ale_add_ucast(ale, cfg->src_addr, HOST_PORT_NUM, 0, 0);
+
+	if ((cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACDST) && cfg->drop)
+		cpsw_ale_add_ucast(ale, cfg->dst_addr, HOST_PORT_NUM, 0, 0);
+}
+
+int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
+			       struct cpsw_ale_policer_cfg *cfg)
+{
+	int ale_idx;
+	u16 ale_flags = cfg->drop ? ALE_BLOCKED : 0;
+
+	/* A single policer can support multiple match types simultaneously
+	 * There can be only one ALE entry per address
+	 */
+	cpsw_ale_policer_reset_entry(ale, policer_idx);
+	cpsw_ale_policer_read_idx(ale, policer_idx);
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACSRC) {
+		ale_idx = cpsw_ale_add_ucast(ale, cfg->src_addr, HOST_PORT_NUM, ale_flags, 0);
+		if (ale_idx < 0)
+			return -ENOENT;
+
+		/* update policer entry */
+		regmap_field_write(ale->fields[POL_SRC_INDEX], ale_idx);
+		regmap_field_write(ale->fields[POL_SRC_MEN], 1);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACDST) {
+		ale_idx = cpsw_ale_add_ucast(ale, cfg->dst_addr, HOST_PORT_NUM, ale_flags, 0);
+		if (ale_idx < 0)
+			return -ENOENT;
+
+		/* update policer entry */
+		regmap_field_write(ale->fields[POL_DST_INDEX], ale_idx);
+		regmap_field_write(ale->fields[POL_DST_MEN], 1);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_OVLAN) {
+/* FIXME: VLAN ID based flow routing not yet working, Only PCP matching for now
+ *		u32 port_mask, unreg_mcast = 0;
+ *
+ *		port_mask = BIT(cfg->port_id) | ALE_PORT_HOST;
+ *		if (!cfg->vid)
+ *			unreg_mcast = port_mask;
+ *		ale_idx = cpsw_ale_vlan_add_modify(ale, cfg->vid, port_mask,
+ *				unreg_mcast, port_mask, 0);
+ *		if (ale_idx < 0)
+ *			return -ENOENT;
+ *
+ *		regmap_field_write(ale->fields[POL_OVLAN_INDEX], ale_idx);
+ *		regmap_field_write(ale->fields[POL_OVLAN_MEN], 1);
+ */
+
+		regmap_field_write(ale->fields[POL_PRI_VAL], cfg->vlan_prio);
+		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
+	}
+
+	cpsw_ale_policer_write_idx(ale, policer_idx);
+
+	/* Map to thread id provided by the config */
+	if (!cfg->drop) {
+		cpsw_ale_policer_thread_idx_enable(ale, policer_idx,
+						   cfg->thread_id, true);
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index ce59fec75774..11d333bf5a52 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -159,6 +159,30 @@ enum cpsw_ale_port_state {
 /* Policer */
 #define CPSW_ALE_POLICER_ENTRY_WORDS	8
 
+/* Policer match flags */
+#define CPSW_ALE_POLICER_MATCH_PORT	BIT(0)
+#define CPSW_ALE_POLICER_MATCH_PRI	BIT(1)
+#define CPSW_ALE_POLICER_MATCH_OUI	BIT(2)
+#define CPSW_ALE_POLICER_MATCH_MACDST	BIT(3)
+#define CPSW_ALE_POLICER_MATCH_MACSRC	BIT(4)
+#define CPSW_ALE_POLICER_MATCH_OVLAN	BIT(5)
+#define CPSW_ALE_POLICER_MATCH_IVLAN	BIT(6)
+#define CPSW_ALE_POLICER_MATCH_ETHTYPE	BIT(7)
+#define CPSW_ALE_POLICER_MATCH_IPSRC	BIT(8)
+#define CPSW_ALE_POLICER_MATCH_IPDST	BIT(9)
+
+struct cpsw_ale_policer_cfg {
+	u32 match_flags;
+	u16 ether_type;
+	u16 vid;
+	u8 vlan_prio;
+	u8 src_addr[ETH_ALEN];
+	u8 dst_addr[ETH_ALEN];
+	bool drop;
+	u64 thread_id;
+	int port_id;
+};
+
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params);
 
 void cpsw_ale_start(struct cpsw_ale *ale);
@@ -199,5 +223,9 @@ void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
 void cpsw_ale_policer_reset(struct cpsw_ale *ale);
+int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
+			       struct cpsw_ale_policer_cfg *cfg);
+void cpsw_ale_policer_clr_entry(struct cpsw_ale *ale, u32 policer_idx,
+				struct cpsw_ale_policer_cfg *cfg);
 
 #endif

-- 
2.34.1


