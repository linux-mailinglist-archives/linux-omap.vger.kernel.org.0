Return-Path: <linux-omap+bounces-3649-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7CAA98E9
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8A03B7A84
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7432701C1;
	Mon,  5 May 2025 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZa8olk+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02A2701BA;
	Mon,  5 May 2025 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462421; cv=none; b=qvtwVyQ4jtPXoeOZah1X9FgZFI6lqcgM//TLP0A9Mqn0qnM9tcY3vve8e30QcWTW/gUrudv90D6ne1ztONmOar0VlEk6TxkheAs9lxiTCMZgUNCxDSPMam8uOiRgr6/edozY07nZKbJje+WmyF2IrUsTo1ZnSUf5cCbF2vKFqjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462421; c=relaxed/simple;
	bh=vOL7NsEODFLHbpLefZlvmBkCViCZUZ+0w8a2r6CmrnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzrQmVyO8DgJJhLkjgyI8eeNmINSfLKtABmWTVeWpiIebOQkdfiYP4x1Uz+Hy7PEBv4cGMrT4iJ+UeudxUwCyIC8FR/ShxwD0BBHchxiUOdYfj/Z4WXhUT6YUqAu4qFYvba7bY7BWldQbd4uJBOMSpM2fQy641CxMznYFxhTDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZa8olk+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2199C4CEE4;
	Mon,  5 May 2025 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462421;
	bh=vOL7NsEODFLHbpLefZlvmBkCViCZUZ+0w8a2r6CmrnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZZa8olk+pdPhq2zXn05ImM/+HL8KLXc1BPEHndev5byO5/kiFPtM+GpYgcf2WSac1
	 5RjXiua9Q735ppnAeSgGGrZa7AuGWMDaob1P9utPk6ekQQhVanSiiSPn6UXQ9oM8mf
	 vSRoxs4ZDVDYCmAKMNJDR5BSsAb8HkTWrkkEEdkxjWhJ+QnU4hPJ5L6vYIGzY/jcm2
	 fNqofcRq3pH05xquh267a0CL0y52NOCpE13ZoHncHFsy8eNA5vxtc7ayeLFnGXlacx
	 sgu2qtK5Uj/D9L/H3L2R7qM93sTLRBf9HkPDmxX4L5n1kkdA5DYhsQEyS4ZFOXd3pp
	 DivjLuVXeE1tA==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:37 +0300
Subject: [PATCH net-next v2 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5549; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=vOL7NsEODFLHbpLefZlvmBkCViCZUZ+0w8a2r6CmrnA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa7cSAtKiTAgiDZN/YPupjeyoFWuZsF4zj5O
 FSgKIG1dhSJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmuwAKCRDSWmvTvnYw
 kxPNEADMUrkK1nIU2BfUtmvw3qxTOW7nauunnaVaIpMTkc9c2utonY2I/uYRAt8P4gUSntW2jrK
 AQQ8ZnuzC4/ErDu+YdalAefnB6STCVVE4PTWJe73T3dei21MIvRig2+/4bJ6DGwY12fUEavXEw/
 am/xWVW2oRwP0y7g5D64ns1Mc7xj9YxkzOLwxdfBqnh0duGNq4BfcaqThNQYU4mfDJoSN8XbMGN
 iIWaKNPGMiIXkcM4CvhUEyylfI9NxArNjlJmT3gkJPD7va3oUJWDJeOSK87vYKR+ehjJDABj4k1
 DpKwPyGvj3mDfyoIEkIOqV+eyzLjZOs4Ej3DUk0PkM6wyqbTFSnxIBPZ+/bXqnB8JfdpDZlSwP4
 rNMEyQoFmDfj530vER94c+ao7r1ci3c5iIeg/vwhtiNHVfP+t6uh5T5B0vnbk64+3b9iiBMOE6I
 3QH1uXrtOkcdLSjKWkiOE/xOApbEiWI3grv92Eraw31by1XP8uKgponx1yWRKLdChSTWgPI8pSJ
 iLzCUSMSUvlGx0RmzTpSFTZXCRojDEJ1ES4jX3ac6ew9UsMQwmvEm4uell5eIXKFdC3ZfxuiAcl
 R0bJryoVZpXVa1PDrf2sbndVw/ZvvKhtYyB5+h+GQtffhppGwrY61meNH+ivSnnqk/STvzH5fB9
 s7PMi7EUJn7CTKg==
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
index ce216606d915..4e29702b86ea 100644
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


