Return-Path: <linux-omap+bounces-3465-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1DA68E0B
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED6987AC8C0
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0BE257455;
	Wed, 19 Mar 2025 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMU3/0DI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7E9257452;
	Wed, 19 Mar 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391694; cv=none; b=ioK8mOb/nQAnRDYDgmanza/wcqM2cXOBBfcN4eK6AZmGMr+r2LxnOF3N7eVsNzm0tD3+weqzV2gJx/BhkPsT3G6OW96QUigFdhJNM/Gx+Z0gEiXtj8K4BTzC0y3ocb9wdZg5TnExUBhH8bNETI48WJlndII1ThOGMHL40+m4arQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391694; c=relaxed/simple;
	bh=lS3SPHMge0mKx7Qg3gL6pFMXs3xH5zb8zMmcnPbXLBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D23snnKi0AezPKRJhE0/I3Nr8rjR1hvQMfM0C4xOaIYzVJC5OB39RfJycXQngF0jT2v3Opsej6y8h/BmzgTJFfkgdkTEQH3hJHC8b5W2cUS9KcLjWe0MR33F6d96kX70iK1nGbIwMbnoSjHoMv89sGzkBUNXnt7ClWcSrvCSnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMU3/0DI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BE3C4CEEC;
	Wed, 19 Mar 2025 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391693;
	bh=lS3SPHMge0mKx7Qg3gL6pFMXs3xH5zb8zMmcnPbXLBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jMU3/0DIeBZ70P4rLWuJVeYm7v0ZNXcs9zMbWLSXFvxjAMfGujLyUuMbCGG4mMjav
	 43QaLVRiAUJfe+0xaTTi3WpFKiiDVNKJEGPLcNYf20zBSsXlktVY8a5QNbqdZh2hn+
	 +S91+/IcHijowDo0uBKH3sd8nh7M7HsMhr+6V+Aig8Sou23sVF+WhYoYOMExeb/HQv
	 VKfksIUYKDoh+YqZU4z1io5mcu8CUKBJZ728ZJXPgWRp6pX77j9Jt1nwpNq9q4ZME2
	 blGY9sk6Dz0uK6ajBJKOjEK8UADu6V1AC+dRfA9BhpnxPnM8QxRDP+56w5M01y/oLi
	 4zS1V3GJ9UBVQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:33 +0200
Subject: [PATCH net-next 7/9] net: ethernet: ti: cpsw_ale: add policer save
 restore for PM sleep
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-7-2bfded07490e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5534; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=lS3SPHMge0mKx7Qg3gL6pFMXs3xH5zb8zMmcnPbXLBI=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slyjj6w3g9erkBvy01mwPvcE1+i/eQ2f2sh2
 lWz7lR55maJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcgAKCRDSWmvTvnYw
 k/1ED/42+Uhw0BBPRFfp1A2knSP29nIVd970/VVbu3Uzb5BtDXlGms7iSfaH+X+rGprQHms7gcF
 HmCSMtqGBdQX2ryUutH35t+XaEpYoK5oceusEC/mb4qxPHTSMqdDBgueS7CdrmHR2P5CIn15OqU
 1BFhJk1mCtqIZ1YLNzdVjQJFjVlD82bQPt4CFDu8duGYr8IXakh9CkcKQXpJB3EYjHiW+ztnhlT
 eOu51/z+a7TqcAsihIFvhaQOMOtMmp7+L4R2jfICmybpmx7IQo/ZqxfOUMPavTxMWQTfk26IJWT
 KtPRGcpPpWKu+UUs8ZjzIjw0DKuBfBUBsjpqydEg+qdoZ26IiycuDOxLEescx+gd9/nlEe95GDn
 41UBRtN4aoGlBBQjkttmKJWmggK72q4NHZQeWyUOrI6K46j1ih313Jq+Jtk9E8mgEdOgVLgKDBd
 nLbtL4lLi8AYdkk6lCfmE7w6HnyytdkOKEg2oPIaJ0lICnAQyiNqnfnmvFBLfvnHimXMSXeYbI0
 9UYpPnNMHORw6rmCwHdeAWcukFF3OyS98kkEcDacI/LiAcIMKl+r/h96X7/ywaaJLuXk+bs4Y32
 r2NCGLHP8y2zMIw8HImViHOft5ClRZfPzWQD0Pp0VDBDC6Ol5Vt/KRjwh9BrVChYxdP7K86FBRB
 tO9YeeAUfcCMI6g==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

On some K3 platforms CPSW context is lost during PM sleep.

Add cpsw_ale_policer_save() and cpsw_ale_policer_restore() helpers.

In am65-cpsw driver, save the policer context during PM suspend and
restore it during PM resume.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 23 ++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  1 +
 drivers/net/ethernet/ti/cpsw_ale.c       | 42 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h       |  4 +++
 4 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 1c0eedf884ce..405944013521 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3487,7 +3487,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct resource *res;
 	struct clk *clk;
-	int ale_entries;
+	int tbl_entries;
 	__be64 id_temp;
 	int ret, i;
 
@@ -3590,10 +3590,25 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 		goto err_of_clear;
 	}
 
-	ale_entries = common->ale->params.ale_entries;
+	tbl_entries = common->ale->params.ale_entries;
 	common->ale_context = devm_kzalloc(dev,
-					   ale_entries * ALE_ENTRY_WORDS * sizeof(u32),
+					   tbl_entries * ALE_ENTRY_WORDS * sizeof(u32),
 					   GFP_KERNEL);
+	if (!common->ale_context) {
+		ret = -ENOMEM;
+		goto err_of_clear;
+	}
+
+	tbl_entries = common->ale->params.num_policers;
+	i = CPSW_ALE_POLICER_ENTRY_WORDS + 1;	/* 8 CFG + 1 Thread_val */
+	i *= tbl_entries;	/* for all policers */
+	i += 1;			/* thread_def register */
+	common->policer_context = devm_kzalloc(dev, i * sizeof(u32), GFP_KERNEL);
+	if (!common->policer_context) {
+		ret = -ENOMEM;
+		goto err_of_clear;
+	}
+
 	ret = am65_cpsw_init_cpts(common);
 	if (ret)
 		goto err_of_clear;
@@ -3677,6 +3692,7 @@ static int am65_cpsw_nuss_suspend(struct device *dev)
 	int i, ret;
 
 	cpsw_ale_dump(common->ale, common->ale_context);
+	cpsw_ale_policer_save(common->ale, common->policer_context);
 	host_p->vid_context = readl(host_p->port_base + AM65_CPSW_PORT_VLAN_REG_OFFSET);
 	for (i = 0; i < common->port_num; i++) {
 		port = &common->ports[i];
@@ -3754,6 +3770,7 @@ static int am65_cpsw_nuss_resume(struct device *dev)
 
 	writel(host_p->vid_context, host_p->port_base + AM65_CPSW_PORT_VLAN_REG_OFFSET);
 	cpsw_ale_restore(common->ale, common->ale_context);
+	cpsw_ale_policer_restore(common->ale, common->policer_context);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 917c37e4e89b..61daa5db12e6 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -190,6 +190,7 @@ struct am65_cpsw_common {
 	unsigned char switch_id[MAX_PHYS_ITEM_ID_LEN];
 	/* only for suspend/resume context restore */
 	u32			*ale_context;
+	u32			*policer_context;
 };
 
 struct am65_cpsw_ndev_priv {
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index f5ca18d4ea6a..48592441085a 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1830,3 +1830,45 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
 
 	return 0;
 }
+
+void cpsw_ale_policer_save(struct cpsw_ale *ale, u32 *data)
+{
+	int i, idx;
+
+	for (idx = 0; idx < ale->params.num_policers; idx++) {
+		cpsw_ale_policer_read_idx(ale, idx);
+
+		for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
+			data[i] = readl_relaxed(ale->params.ale_regs +
+						ALE_POLICER_PORT_OUI + 4 * i);
+
+		regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
+		data[i++] = readl_relaxed(ale->params.ale_regs +
+					ALE_THREAD_VAL);
+		data += i * 4;
+	}
+
+	data[0] = readl_relaxed(ale->params.ale_regs + ALE_THREAD_DEF);
+}
+
+void cpsw_ale_policer_restore(struct cpsw_ale *ale, u32 *data)
+{
+	int i, idx;
+
+	for (idx = 0; idx < ale->params.num_policers; idx++) {
+		cpsw_ale_policer_read_idx(ale, idx);
+
+		for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
+			writel_relaxed(data[i], ale->params.ale_regs +
+				       ALE_POLICER_PORT_OUI + 4 * i);
+
+		cpsw_ale_policer_write_idx(ale, idx);
+
+		regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
+		writel_relaxed(data[i++], ale->params.ale_regs +
+						 ALE_THREAD_VAL);
+		data += i * 4;
+	}
+
+	writel_relaxed(data[0], ale->params.ale_regs + ALE_THREAD_DEF);
+}
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 11d333bf5a52..dbc095397389 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -171,6 +171,8 @@ enum cpsw_ale_port_state {
 #define CPSW_ALE_POLICER_MATCH_IPSRC	BIT(8)
 #define CPSW_ALE_POLICER_MATCH_IPDST	BIT(9)
 
+#define CPSW_ALE_POLICER_ENTRY_WORDS	8
+
 struct cpsw_ale_policer_cfg {
 	u32 match_flags;
 	u16 ether_type;
@@ -227,5 +229,7 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
 			       struct cpsw_ale_policer_cfg *cfg);
 void cpsw_ale_policer_clr_entry(struct cpsw_ale *ale, u32 policer_idx,
 				struct cpsw_ale_policer_cfg *cfg);
+void cpsw_ale_policer_save(struct cpsw_ale *ale, u32 *data);
+void cpsw_ale_policer_restore(struct cpsw_ale *ale, u32 *data);
 
 #endif

-- 
2.34.1


