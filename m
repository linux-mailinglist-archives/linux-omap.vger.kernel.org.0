Return-Path: <linux-omap+bounces-4761-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05063C081F7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86AC404F1C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFE42FF140;
	Fri, 24 Oct 2025 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsP10Q8D"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12232FB0B5;
	Fri, 24 Oct 2025 20:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338792; cv=none; b=g0yXcjzloKJP2fmW8OSWN5g16IflaUltkOmOCDEzCgEcZDSgiZw2Z+j1KopeOfome6XLwq+JOfvIFNSwFIQT/8SAE4AxdvzBQSvmNZsyKhSCxzWqlo+txYNRzRjdTv+f2YVQJDaH6WtGWUUJvdBsDeQJiFpxInCwOk4XSr3Uc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338792; c=relaxed/simple;
	bh=RdFfCnJkmUXNXNzHLyaMWfYKDsG3Xqljb2qSbUhkbFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJMGVMa8R+Iq9j743xvZ5WaPI+FbfrxPMh/LDKKv3PErbXvrpl+vmekwhdqt0yhRuZn6PwwzQk4A5wDqOS5j7BDOIp7EUmTiJ6/Uoi8FCFQT6sFYZ4z401xuI11mukzeuWSz57dBNQUrfSqjJpuFD9M1yoHCvn+blHHb0X94nMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsP10Q8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31A3C4CEF1;
	Fri, 24 Oct 2025 20:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338792;
	bh=RdFfCnJkmUXNXNzHLyaMWfYKDsG3Xqljb2qSbUhkbFw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GsP10Q8DX0eNAntfW5yTm7MeeiMUQSofI29l2eByV5JjspLozXmcodJDFgataVjfN
	 KIMs0uSWNs5Ht1oGcElUjv2FzzsK2He5HtKAGkLVHA8rOdc6Hy1dKwACR7gZ7L0PuC
	 FVpJe/7ceapwYKz8kkz68ZVX/9269edNWverW3vG+lKC5F4RTLLr6JwclTA/jAqg+U
	 oSsiey1FQ0Gv/b8MQfXlwAG8vYZrbRem9gUUQq2zAi849L8WeoiQZLy43YU63cGnMP
	 yaBBTyznlt8kNljivTfBllksIcZVyAlWQIgwltA9XF2sGEXFIMEfLQ4WjZP+Vbt5rI
	 t5J3HHKK518Gw==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:06 +0300
Subject: [PATCH net-next v5 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-7-c7c2950a2d25@kernel.org>
References: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
In-Reply-To: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=RdFfCnJkmUXNXNzHLyaMWfYKDsG3Xqljb2qSbUhkbFw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOrTD8bFoD5Lo8d4+lbarjovhF++QArNFCa
 ApTzNR6YESJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k5F/D/9fkZJKtPalmzEvHPfHZCxv4T1goCZhNbfY7Ev0ZNFa4xMTQrPed50gyyPTnssdajhA3Ys
 8YDiWjvo7GXndJNi7UQT8oDYBiZfEQ7tWbMd/samHYHWIuBuMl/AvOLAVrDYzZe0nGqy0TC1JFy
 WjSpZtK4nyxK1mDC/LRYePyaCCSznvZfs6V/+HOABf+H5J8TVsEucNaz2jzhYQUN0D4mcHsn3t8
 JYybqbfUa06py/9osAqo/bKopD44sDPGJTJuJoe5qh9yQRvg4xIgNZw5LV91+TPgXWfb+z39M+V
 sByluBwinO6u5l5NX6026HioQtecinJTIixlQu7/A8NX7pX50SnNh29xI8+DwPZs/baE4wd6OzE
 et5LLTZRchPA4tm1uD+j6AJoKudMBor3c9NO/xOpRBQA1cvtsFykvG9vbH2o4YSICigxqG2KZzr
 SQwroCiI8R76IdjUm42MIDF0qFi5H23V/GCvhHpt2MgUUDaNL9MsEcYiydb0HcHinM0vviPP4XE
 yjtPzPxfwWeAVD1e6NJlIl3KLeMfKb040W2AVrEEnhQUA0kUY7Wskhu/3xL5ivJvRe4GjaRTPmJ
 HbPfLqC6KcMTtoICruDU51ZIQKavJ9Lt1yNqUHlbtOtAcau3C5wa3q30FmQDLVHzDPxUFNWCMKL
 OGG5rh5GllCjQLA==
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
index 977f32962cd0bc63528718e47a4bfae813676f01..93ff139966ea0e26d3cd44a2f6eb7f9cbd2611d5 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3523,7 +3523,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct resource *res;
 	struct clk *clk;
-	int ale_entries;
+	int tbl_entries;
 	__be64 id_temp;
 	int ret, i;
 
@@ -3626,10 +3626,26 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
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
@@ -3715,6 +3731,7 @@ static int am65_cpsw_nuss_suspend(struct device *dev)
 	int i, ret;
 
 	cpsw_ale_dump(common->ale, common->ale_context);
+	cpsw_ale_policer_save(common->ale, common->policer_context);
 	host_p->vid_context = readl(host_p->port_base + AM65_CPSW_PORT_VLAN_REG_OFFSET);
 	for (i = 0; i < common->port_num; i++) {
 		port = &common->ports[i];
@@ -3792,6 +3809,7 @@ static int am65_cpsw_nuss_resume(struct device *dev)
 
 	writel(host_p->vid_context, host_p->port_base + AM65_CPSW_PORT_VLAN_REG_OFFSET);
 	cpsw_ale_restore(common->ale, common->ale_context);
+	cpsw_ale_policer_restore(common->ale, common->policer_context);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 917c37e4e89bd933d3001f6c35a62db01cd8da4c..61daa5db12e631588eba71351ba3bc0139456bf5 100644
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
index 9641c3d688c768a227b557f7c1a31fe77c9a738b..9492d0cf06bbbe227899e9a235f2fe52da3acad6 100644
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
index 11d333bf5a5280374573833050a4e3893d85dc28..dbc095397389d36df54a29d46e905f7eeb790e87 100644
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


