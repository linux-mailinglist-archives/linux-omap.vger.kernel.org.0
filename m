Return-Path: <linux-omap+bounces-3719-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE52AB6AFD
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0B8A1882C70
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A304127C86B;
	Wed, 14 May 2025 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awzZu7Df"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83827C17E;
	Wed, 14 May 2025 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224292; cv=none; b=LqJ6gKjq1uiizc5r1lPanTLdDV64L2Mjm4w95/K7vyGZ6udSIpDuGkOVm1xGbXjLREof1dKXfmMJwfSYJ4LB0MHZjDg+B2GEGiBseDc4Rr4d/kh+kb/o9g80b4EKf+KfcHtm56MtFmdJHAViixBMWOCk+xjoyWhFHKDWX2EUHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224292; c=relaxed/simple;
	bh=Z/WAtsSQO3/V8jE/ZTGUvzWVjcnULfd1TWw+MFxEgzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9SMh14lDLCm69URWm5Cg2IuAU3/Tovmi8e7oMzAvKAgiBe/r0lfYJPHHkxPttzYz5hBdGEUeA4c4bQjTieLWEK1y5b+5Qp2Gm2tIgrUcRw1Lvwx6sq/XwTM0UW3Gfbjvd6KMXlu8wPgk0kAXHTKXAJZ3MWm+5mnB52PG/C+NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awzZu7Df; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC50AC4CEE9;
	Wed, 14 May 2025 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224291;
	bh=Z/WAtsSQO3/V8jE/ZTGUvzWVjcnULfd1TWw+MFxEgzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=awzZu7Dfy9K9WJt2HVdmUFs+EcTfRUHmZ8t9LmgFdRaDfwhcgZ7kABlkRLhFuIjYC
	 aUHgF8CafoQxcO4DYUbEXf7AUKPqQBof0BscIkGa1A4jEPKApeslFvpOmb4gV6G8bO
	 0WHHEQZYSNh79AuyG1Ndca8YY3NgO3FXXNuxSN1zqCiw/+x2v/MhFUrCLP80ZwccrC
	 f9kacH8iuHly/D2E2l3cQBnL9Hq2UiIz8dVo340jXTztAIZzTcCXMa9fy2gxkA3md9
	 y3fGF6NBM4xep+Aw5CFLGcmbSxkQyrdVo7wAxO0Z1BuYvw0ASv0WcXvvXexTYEjtaa
	 fUARxrVZ3L3bA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:27 +0300
Subject: [PATCH net-next v4 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-7-5202d8119241@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbJ8OshRSoHd0kC75dJoQOP87fBsFCp+x1be
 FLIq5tLE3qJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyQAKCRDSWmvTvnYw
 k19bD/9IExajdW3PW+xMxDz01J/ANLksS9odY+XCeChgG8kusbrMQHWTv+2bjg+t/YCyW5XReyn
 USlaRDixdg+s/1JvQG7th2W4ln/7QxUFApxTjsmUfvQ04V8YM9aXOrH70LaoTojGtqRgqrH35u0
 37ilCYrX85vZM5cndK5k0FU6SiU+MPc8UwvS/4XQ8RyG3a0lbK1PwZoyy2dvLis2hPV+F3cL6Kg
 E2UTZM16rkEPmUrIKq5HMD2US3vpYLoZRVuBTu3O87jMRRxKoS3Clg7cQIf489xwNVJ87PIAULK
 ZolyCMr1dy3Ak/9BPFZDQkZTq7XOc3jD0RaaQfCOQOzc2RbPr+AcgK5Dw7hjjOpPEMFYAaUXAmf
 jbRF5LbZiZYNOsQuCnVzqm9SbfZhfi3nDrtFeU+nE/uBra2t6f4gbPxBKXV6EkSgSlhv59e2yUV
 7BYIgBF3c9d9k/PiNIB3Gp4hWtmvuxn7bxckAFlL+GkWAVNf4jVlbHyVsTlLQ++wim1DbS+Wbot
 BUwubFlEXSDM4MVWAgDkHjH2L4Q4grsOi8oT+9rAUiZ4gChcUIvH8YOwohpuv9drgynXu8y050L
 SnBouD2Q+xguJKHRGlXbrgMDpN5nylec4ewnkeLc2EgDuwHSiK1cWf1Ho4X92bGqJ3rpWTsgykb
 a1ZtV7HjKHPy+Uw==
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


