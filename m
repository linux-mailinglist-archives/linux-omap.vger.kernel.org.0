Return-Path: <linux-omap+bounces-1614-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B357891BE12
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6670E284D48
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE3B158D9C;
	Fri, 28 Jun 2024 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzYQq506"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD0158D7E;
	Fri, 28 Jun 2024 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576135; cv=none; b=pOcJKWE1/NcwRrFBCcR22Ii3VMSkwDRRFatdsteR/X2FkA4kWXAvcLutgvyT7N/ImyeNG7JV24YZUQ7nb2ZkfeO9ImGiVlJSdyB+vnVaz6dG7Y8N0TpaiuC8J0v75do7XGj9TAToaldZm32cw/ijf7at7scVGbqfGTQqTQULr80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576135; c=relaxed/simple;
	bh=08Dx61MyaxKGlSkozABy5WMPBJ2CLpDC+4zlJix+0JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/uJ9fxi81bZ2xUNEC4dLa/davonxA1JTPHwNVcu4eyQSjC4wv2ODPdDZOPR6GTLOKd86mW9lpweDohcKRBBxLzYE+nmH/BLM0zWgZDAvr+wHNtQrmiiuCds1JjEct7xu2cvpYqANHxBDAW7+DOSl3J/5KFitQTP40nJA5lX4N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzYQq506; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD57C116B1;
	Fri, 28 Jun 2024 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576135;
	bh=08Dx61MyaxKGlSkozABy5WMPBJ2CLpDC+4zlJix+0JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RzYQq506UcW/kdIQvGp2LOORzyS3ZKUdNn+XuW7QuqfMg1KDVqMhx38pCGBlTGpSb
	 KD6o0IoCWXb31KVykr5MpDoqJU+0IiFTb866z5iVV+GvQwg9GD3DD39N4brldlULGJ
	 HzuN6ccs1A7pw7Eno7MrxBUy5QwknTN4JblVaA834mb3V9e2ByIuTprFdm2/AdOi1s
	 gu6nLlj/ORx2PVHH7jqW8pxj/gzssrsq9bsxXd3YIEvVJJHhAFZuQPs4ppw/K3LR5x
	 vHPkgRfqx0nQGAztAlpoHJIQHbUM4UjTUHtydbDdSD2GC0kGdgi8LcrgVFVPdxuSY1
	 hWABbRAfvvNug==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:52 +0300
Subject: [PATCH net-next v2 3/7] net: ethernet: ti: cpsw_ale: use regfields
 for number of Entries and Policers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-3-c399cb77db56@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=08Dx61MyaxKGlSkozABy5WMPBJ2CLpDC+4zlJix+0JA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4ikMcAIbn90+7REkmcxoDIU4AtE/QpZcqw
 v8O/wSgAZWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 k6UDD/9RIseQJBe3R4kKzM0TS0gP2bKiu9e/EMUpLTEQcKm7QBxYhKrTvrydcV4+duBlYWBuKnx
 TjVOz3XlkS0aQtIHdb2e5gFJDdJh1ERlpLUIHTEjm5hi+wjJFoJC8oS2hrD4BWxqmXKISovAFSJ
 yZZPIuKlyDBuciB0BwQQnT4P1W02LrJT/AHVOCklclyzBsZbplX71FMppmbh8fMYPysTh8+BMWX
 C45EoLZDlxmtZv/bb7t/2VVWNES62qfd6TILNknyVQzg5ZaDUl4tEhWgjLDp3Mvuqiv9//U2Yg7
 Z1UAuzkVHco5hxgw3xXbYST7ch8KTWQLgnOWgW/m37lp78CJTC3uf7h501JsQuwW1zKU61j8PPG
 O83c3kTtoufIeGPd2+iNZbkZgcB8sB3aR8e/VmzWBTWwKXqmwrO6lmgodvLohbuyi2QkyP3/yrW
 76A96LTU9Q2PFIFWdOIRU+AGUzM8t4k0BG2ZN3V/NiMHPjXFWv7TFryN7gVis0PQQXkET1mvyDT
 nw6Z4X2QY9ZHZawwhskd7lmQa2zDMgs8I+0QV36BtsAEYcDwWnyL2Lg0aouVDKPmm8rOvBigMSG
 /NuJAC4lxY4+UmcIm3ZBOGpWvRa8rGo5CZI6h1xQD4I0X0glR7IKY3S854QcujATsIYSJITN5PV
 zP/3v1jmoMD0xDQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Use regfields for number of ALE Entries and Policers.

The variants that support Policers/Classifiers have the number
of policers encoded in the ALE_STATUS register.

Use that and show the number of Policers in the ALE info message.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 25 +++++++++++++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h |  3 +++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 5afe9fdd6402..ca66c89c1f12 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -103,7 +103,7 @@ struct cpsw_ale_dev_id {
 #define ALE_UCAST_TOUCHED		3
 
 #define ALE_TABLE_SIZE_MULTIPLIER	1024
-#define ALE_STATUS_SIZE_MASK		0x1f
+#define ALE_POLICER_SIZE_MULTIPLIER	8
 
 static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)
 {
@@ -1303,6 +1303,9 @@ static const struct reg_field ale_fields_cpsw_nu[] = {
 	/* CPSW_ALE_IDVER_REG */
 	[MINOR_VER]	= REG_FIELD(ALE_IDVER, 0, 7),
 	[MAJOR_VER]	= REG_FIELD(ALE_IDVER, 8, 10),
+	/* CPSW_ALE_STATUS_REG */
+	[ALE_ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
+	[ALE_POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
 };
 
 static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
@@ -1404,7 +1407,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 {
 	const struct cpsw_ale_dev_id *ale_dev_id;
 	struct cpsw_ale *ale;
-	u32 ale_entries, rev_major, rev_minor;
+	u32 ale_entries, rev_major, rev_minor, policers;
 	int ret;
 
 	ale_dev_id = cpsw_ale_match_id(cpsw_ale_id_match, params->dev_id);
@@ -1446,9 +1449,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 
 	if (ale->features & CPSW_ALE_F_STATUS_REG &&
 	    !ale->params.ale_entries) {
-		ale_entries =
-			readl_relaxed(ale->params.ale_regs + ALE_STATUS) &
-			ALE_STATUS_SIZE_MASK;
+		regmap_field_read(ale->fields[ALE_ENTRIES], &ale_entries);
 		/* ALE available on newer NetCP switches has introduced
 		 * a register, ALE_STATUS, to indicate the size of ALE
 		 * table which shows the size as a multiple of 1024 entries.
@@ -1462,8 +1463,20 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 		ale_entries *= ALE_TABLE_SIZE_MULTIPLIER;
 		ale->params.ale_entries = ale_entries;
 	}
+
+	if (ale->features & CPSW_ALE_F_STATUS_REG &&
+	    !ale->params.num_policers) {
+		regmap_field_read(ale->fields[ALE_POLICERS], &policers);
+		if (!policers)
+			return ERR_PTR(-EINVAL);
+
+		policers *= ALE_POLICER_SIZE_MULTIPLIER;
+		ale->params.num_policers = policers;
+	}
+
 	dev_info(ale->params.dev,
-		 "ALE Table size %ld\n", ale->params.ale_entries);
+		 "ALE Table size %ld, Policers %ld\n", ale->params.ale_entries,
+		 ale->params.num_policers);
 
 	/* set default bits for existing h/w */
 	ale->port_mask_bits = ale->params.ale_ports;
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 58d377dd7496..e12bb2caf016 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -15,6 +15,7 @@ struct cpsw_ale_params {
 	void __iomem		*ale_regs;
 	unsigned long		ale_ageout;	/* in secs */
 	unsigned long		ale_entries;
+	unsigned long		num_policers;
 	unsigned long		ale_ports;
 	/* NU Switch has specific handling as number of bits in ALE entries
 	 * are different than other versions of ALE. Also there are specific
@@ -33,6 +34,8 @@ struct regmap;
 enum ale_fields {
 	MINOR_VER,
 	MAJOR_VER,
+	ALE_ENTRIES,
+	ALE_POLICERS,
 	/* terminator */
 	ALE_FIELDS_MAX,
 };

-- 
2.34.1


