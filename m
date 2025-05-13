Return-Path: <linux-omap+bounces-3707-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEEAB5474
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF3907B31DB
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7687293464;
	Tue, 13 May 2025 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgmWI24M"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CB29293D;
	Tue, 13 May 2025 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138415; cv=none; b=pLcdSY88f9U4GpItr8NJEXIoH5oR1HqA4j4OJMg2VmqokOzCJMdhDa7aYAo/3t5AqzqI1H8mm664nJJWIcYrhFsb1Or5MuhshFx8CLQjEOjYefKyWxtq7bQbjxDByjL2z8YKvfdHxyAAELrA6qbZdgwvEgaNEgxzp1+oSORoDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138415; c=relaxed/simple;
	bh=Z/WAtsSQO3/V8jE/ZTGUvzWVjcnULfd1TWw+MFxEgzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOch4Rn1XHRBYfgHFpDmNRGPe0qHzaz7mY4mOWRBgRss7v1H1sy66tqfdn+qf+6epnkF9UniNV3t8VHDFKnnSxFVBuMRH9IMC8aIubVpZyWGioFMbo9jrHKJCLmo8jfEwEX2OC4Pey4FjNQlHiaLZTiwEahT9lHqKM6lzGxruak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgmWI24M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD7C4CEE4;
	Tue, 13 May 2025 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138415;
	bh=Z/WAtsSQO3/V8jE/ZTGUvzWVjcnULfd1TWw+MFxEgzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XgmWI24MlqsBVOXXCuPFQ1BI8bhgNrcm3LEcYcJtQkI1Y6YMyrUlLic4csZqm3Rhm
	 0tulbJrgG+FHgVOvZ4S0bAlNhxy4mteQ1/87Jw20kGfRa8aZUfXho6TowVdg95DmaD
	 5kxRBTiU32K1kLoOqengWcoolcLEhDNYyTTiZ6DAI5hTBcZmW1vR/5zjwta/DkJsgJ
	 ph2LyHLx5RNeNyJBbQXqjb72Yabti15yZyjlSCuG/0ZnfVdx9tttDE4MPFTi/QJFXB
	 v9k2eUT4e2wtKAACnQ2s0h1b9VMSUOXl6Sw3pdE5nSl2qkOsf4QWHIb+XP0Z6DcP3z
	 HBpDQ1YoAR0zg==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 13 May 2025 15:13:11 +0300
Subject: [PATCH net-next v3 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-am65-cpsw-rx-class-v3-7-492d9a2586b6@kernel.org>
References: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
In-Reply-To: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5541; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Z/WAtsSQO3/V8jE/ZTGUvzWVjcnULfd1TWw+MFxEgzs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdUyDkd6KpEGhcShRgNhCIz2U0biM6c6Exfj
 6zywjFHcV2JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k20DD/9d3/iGCmjzb25ZsDMa2gR9wU/9GAD7dpqWuCAjFahMFnbZujUBf7SYij/98h93i9tWOE5
 gpbpvgp+Tq27dgqplZUCKYZiKLmcK8+f1ijBmkbZAmzTHrqXWL1D5Ti8NpTGryGd8FwQrggm4Hz
 /tvB67/n+qZSfQezSv/Qy4z4LH/FbkyDu0K+X34DoSEuUu25WFpnHefowNSDtDszAc+Xl2FSKyM
 av5ILihQk4MuvFd4xlkRmKuprTjTiOPZIlO1zF3sU+bx2Ro2Vq3510C80fLsXboQ1G3qFYezvsU
 EjT34gI8cxvrURLacqkN2Ksw/SDOt4riFMDyn698JysMPAG99KZc/oFx/v60nFsWfQGFUn/qYvV
 U+bpy7mUMc5kiODvvdP4tBueDoA6Kry9Eg8TbUiH43Y8FzDIqIoRRzfJZscvA3u3pwcnKTw/khj
 NBAUJHb1QzTdXD3iXt+lFz9nR3jl6S/qqLpSIa0blSCVO9Q3Y1DvRmttM+TUvT3YTx+KpIrSAKW
 XUJqamMn5wDnKXOUkEyUb3zoyJYKdYXB6RSX79sqUUOu/lPDym2H3mNJTc+iUpe8baygiJFEAKC
 LhGb3yW/Pm+hcQwqE0NDPVKJbeIkUxCfXfL3KBdnDGCU1zUcfxkxZwE7XD6sMyy8xM98LBHVezi
 dhZWePaf9MwRWZw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

On some K3 platforms CPSW context is lost during PM sleep.

Add cpsw_ale_policer_save() and cpsw_ale_policer_restore() helpers.

In am65-cpsw driver, save the policer context during PM suspend and
restore it during PM resume.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 24 +++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  1 +
 drivers/net/ethernet/ti/cpsw_ale.c       | 42 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h       |  4 +++
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 41dc963493de..07df61f343d3 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3503,7 +3503,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct resource *res;
 	struct clk *clk;
-	int ale_entries;
+	int tbl_entries;
 	__be64 id_temp;
 	int ret, i;
 
@@ -3606,10 +3606,26 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
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
+	common->policer_context = devm_kzalloc(dev, i * sizeof(u32),
+					       GFP_KERNEL);
+	if (!common->policer_context) {
+		ret = -ENOMEM;
+		goto err_of_clear;
+	}
+
 	ret = am65_cpsw_init_cpts(common);
 	if (ret)
 		goto err_of_clear;
@@ -3695,6 +3711,7 @@ static int am65_cpsw_nuss_suspend(struct device *dev)
 	int i, ret;
 
 	cpsw_ale_dump(common->ale, common->ale_context);
+	cpsw_ale_policer_save(common->ale, common->policer_context);
 	host_p->vid_context = readl(host_p->port_base + AM65_CPSW_PORT_VLAN_REG_OFFSET);
 	for (i = 0; i < common->port_num; i++) {
 		port = &common->ports[i];
@@ -3772,6 +3789,7 @@ static int am65_cpsw_nuss_resume(struct device *dev)
 
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
index ce216606d915..0cd27a6fe575 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1823,3 +1823,45 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
 
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
+		data += i;
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
+		data += i;
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


