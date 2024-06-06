Return-Path: <linux-omap+bounces-1485-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F88FE623
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99D6C28631D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FA8195F35;
	Thu,  6 Jun 2024 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKNTNeb8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D365195F10;
	Thu,  6 Jun 2024 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675796; cv=none; b=RysrBCkUOrXYY0T/B4Z6yRzteKExG9UPHEJrs2P4PQfn+SLH7Tc8ZVx4zgc0WUauweswYL978r1XUQPjNABLAlBfI1UlthGhNM5gMhNUE3MflwyTUrrPjFFwHM0J/1QgqZQy5z4DZv6z0yI8bCVlXYrdK9SCd5r91Ud94DpTMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675796; c=relaxed/simple;
	bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQl7fISI4NMN0V6YGjGSeFpE+nntkbEbbajn+BEKnIuopkgLy/bBpCPTPPfF2RMZHZTGZ2ZdwBdCMzLFCHsMagnG9j8nlORTOyhDfRDhOicxCCoW9DqRrEWnaXHiZVZxqQYBVItTkzhqZNZmgF0UtHkRF5wStSJH2SOekbtrwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKNTNeb8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DAAC4AF1A;
	Thu,  6 Jun 2024 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675795;
	bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mKNTNeb8/s6fMQQrSCs/3/NICWHu+JK4ZAd6tICEh1tahYg8NKVd9mQ7cvY+r3rxv
	 RXzJX5A80Md3IambDXtUO8nkBrLkZEdg9HTR1dqp7U9gf1prk7ngFJX2rN+yVTwyWU
	 sH/DbGWf5wHqJleukQdRUY018wR/iufiTM8JtnS8tW2HszIAhqFtXgxqKQ+ieYH10S
	 Ft7BOhBJcedgrPQdKytpQihV0oFt1WpwpvaybMd6vzNdsy+OUqj8883vdzu/CW4SSP
	 6HfoCdaKforhAE9adIM2fiAQ0QaSBfenT2W7a/mkjvQgY7c4yt19IE4OHPVRZEWja1
	 w1KjXP7XdD94A==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:18 +0300
Subject: [PATCH RFC net-next 2/7] net: ethernet: ti: cpsw_ale: use
 regfields for ALE registers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-2-0704b0cb6fdc@kernel.org>
References: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
In-Reply-To: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7430; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacCU8WFXXVkMRc9j72TteaqBz2TuRAmJcyW7
 wWVf/9wLyKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnAgAKCRDSWmvTvnYw
 k41wEADLvGiBFPh39dfCEzqza/g7kl/wsMAbmDHZfhQneCk5n/QXqsYZNeQ9+yPml0Du62WslFT
 mcIjFxKXBiJV3YAYcBt+VFWKRXEtJdE3A+BB5g5USg2SUFlsZMr7wYG9U92UnGczxwm6WkmLtSZ
 b0yb2uaQsEqhspzN8czI8/oY23XkV0llMbPRncCFcH7edUfkAB/dgaCOvgrcZliJA0N8bKIs/SG
 T5KGhVbRlUSxngLsqtkeWFlXydRdspCJV8WuGEQtmmzp0eOMPUbIq1bDWw8M4RQocLP5bNi6a1R
 VuWpPI0fsYSOb+BTLJ3/VB9aKrvEl3TG8AxxCeLmVTbC1KaWTY0lEho6Nx9akv4S+z97IY7jHq1
 JiyvTK6nH7P0ixf5ZY6r+9DYkWEVbgeHTgIhfXPMf/eIsiwm1fCaRlesKuyTWxcEYq68WP3HGsR
 NBkhJmyU+OQTB0ZZcKUmJtNdxvPDmd/9HbeiYQT+YWofxO+rSAdXjDt+/YD8nM7dGmb/dkcxi24
 pa4LFV7R//OIVhebqvDQYxw/IUX5tvo4w2OsjsI7Bl8kBErWDR9LOxNbHKh5rp1x5VKnLi+EV5I
 UEuJEeIziQaRe7A4UOEHo/mJDhjc1sIKTcUy4M9CMvJmoULewCccH00xoRVexre/4zsUbBY46YV
 vYsKAAYmwmp+gkg==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Map the entire ALE registerspace using regmap.

Add regfields for Major and Minor Version fields.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 83 +++++++++++++++++++++++++++++---------
 drivers/net/ethernet/ti/cpsw_ale.h | 17 ++++++--
 2 files changed, 78 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 64bf22cd860c..5afe9fdd6402 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/err.h>
@@ -76,7 +77,7 @@ enum {
  * @dev_id: ALE version/SoC id
  * @features: features supported by ALE
  * @tbl_entries: number of ALE entries
- * @major_ver_mask: mask of ALE Major Version Value in ALE_IDVER reg.
+ * @reg_fields: pointer to array of register field configuration
  * @nu_switch_ale: NU Switch ALE
  * @vlan_entry_tbl: ALE vlan entry fields description tbl
  */
@@ -84,7 +85,7 @@ struct cpsw_ale_dev_id {
 	const char *dev_id;
 	u32 features;
 	u32 tbl_entries;
-	u32 major_ver_mask;
+	const struct reg_field *reg_fields;
 	bool nu_switch_ale;
 	const struct ale_entry_fld *vlan_entry_tbl;
 };
@@ -1292,25 +1293,37 @@ void cpsw_ale_stop(struct cpsw_ale *ale)
 	cpsw_ale_control_set(ale, 0, ALE_ENABLE, 0);
 }
 
+static const struct reg_field ale_fields_cpsw[] = {
+	/* CPSW_ALE_IDVER_REG */
+	[MINOR_VER]	= REG_FIELD(ALE_IDVER, 0, 7),
+	[MAJOR_VER]	= REG_FIELD(ALE_IDVER, 8, 15),
+};
+
+static const struct reg_field ale_fields_cpsw_nu[] = {
+	/* CPSW_ALE_IDVER_REG */
+	[MINOR_VER]	= REG_FIELD(ALE_IDVER, 0, 7),
+	[MAJOR_VER]	= REG_FIELD(ALE_IDVER, 8, 10),
+};
+
 static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 	{
 		/* am3/4/5, dra7. dm814x, 66ak2hk-gbe */
 		.dev_id = "cpsw",
 		.tbl_entries = 1024,
-		.major_ver_mask = 0xff,
+		.reg_fields = ale_fields_cpsw,
 		.vlan_entry_tbl = vlan_entry_cpsw,
 	},
 	{
 		/* 66ak2h_xgbe */
 		.dev_id = "66ak2h-xgbe",
 		.tbl_entries = 2048,
-		.major_ver_mask = 0xff,
+		.reg_fields = ale_fields_cpsw,
 		.vlan_entry_tbl = vlan_entry_cpsw,
 	},
 	{
 		.dev_id = "66ak2el",
 		.features = CPSW_ALE_F_STATUS_REG,
-		.major_ver_mask = 0x7,
+		.reg_fields = ale_fields_cpsw_nu,
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
@@ -1318,7 +1331,7 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.dev_id = "66ak2g",
 		.features = CPSW_ALE_F_STATUS_REG,
 		.tbl_entries = 64,
-		.major_ver_mask = 0x7,
+		.reg_fields = ale_fields_cpsw_nu,
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
@@ -1326,20 +1339,20 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.dev_id = "am65x-cpsw2g",
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
 		.tbl_entries = 64,
-		.major_ver_mask = 0x7,
+		.reg_fields = ale_fields_cpsw_nu,
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
 	{
 		.dev_id = "j721e-cpswxg",
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
-		.major_ver_mask = 0x7,
+		.reg_fields = ale_fields_cpsw_nu,
 		.vlan_entry_tbl = vlan_entry_k3_cpswxg,
 	},
 	{
 		.dev_id = "am64-cpswxg",
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
-		.major_ver_mask = 0x7,
+		.reg_fields = ale_fields_cpsw_nu,
 		.vlan_entry_tbl = vlan_entry_k3_cpswxg,
 		.tbl_entries = 512,
 	},
@@ -1361,41 +1374,75 @@ cpsw_ale_dev_id *cpsw_ale_match_id(const struct cpsw_ale_dev_id *id,
 	return NULL;
 }
 
+static const struct regmap_config ale_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.name = "cpsw-ale",
+};
+
+static int cpsw_ale_regfield_init(struct cpsw_ale *ale)
+{
+	struct regmap *regmap = ale->regmap;
+	struct device *dev = ale->params.dev;
+	const struct reg_field *reg_fields = ale->params.reg_fields;
+	int i;
+
+	for (i = 0; i < ALE_FIELDS_MAX; i++) {
+		ale->fields[i] = devm_regmap_field_alloc(dev, regmap,
+							 reg_fields[i]);
+		if (IS_ERR(ale->fields[i])) {
+			dev_err(dev, "Unable to allocate regmap field %d\n", i);
+			return PTR_ERR(ale->fields[i]);
+		}
+	}
+
+	return 0;
+}
+
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 {
 	const struct cpsw_ale_dev_id *ale_dev_id;
 	struct cpsw_ale *ale;
-	u32 rev, ale_entries;
+	u32 ale_entries, rev_major, rev_minor;
+	int ret;
 
 	ale_dev_id = cpsw_ale_match_id(cpsw_ale_id_match, params->dev_id);
 	if (!ale_dev_id)
 		return ERR_PTR(-EINVAL);
 
 	params->ale_entries = ale_dev_id->tbl_entries;
-	params->major_ver_mask = ale_dev_id->major_ver_mask;
 	params->nu_switch_ale = ale_dev_id->nu_switch_ale;
+	params->reg_fields = ale_dev_id->reg_fields;
 
 	ale = devm_kzalloc(params->dev, sizeof(*ale), GFP_KERNEL);
 	if (!ale)
 		return ERR_PTR(-ENOMEM);
+	ale->regmap = devm_regmap_init_mmio(params->dev, params->ale_regs, &ale_regmap_cfg);
+	if (IS_ERR(ale->regmap)) {
+		dev_err(params->dev, "Couldn't create CPSW ALE regmap\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ale->params = *params;
+	ret = cpsw_ale_regfield_init(ale);
+	if (ret)
+		return ERR_PTR(ret);
 
 	ale->p0_untag_vid_mask = devm_bitmap_zalloc(params->dev, VLAN_N_VID,
 						    GFP_KERNEL);
 	if (!ale->p0_untag_vid_mask)
 		return ERR_PTR(-ENOMEM);
 
-	ale->params = *params;
 	ale->ageout = ale->params.ale_ageout * HZ;
 	ale->features = ale_dev_id->features;
 	ale->vlan_entry_tbl = ale_dev_id->vlan_entry_tbl;
 
-	rev = readl_relaxed(ale->params.ale_regs + ALE_IDVER);
-	ale->version =
-		(ALE_VERSION_MAJOR(rev, ale->params.major_ver_mask) << 8) |
-		 ALE_VERSION_MINOR(rev);
+	regmap_field_read(ale->fields[MINOR_VER], &rev_minor);
+	regmap_field_read(ale->fields[MAJOR_VER], &rev_major);
+	ale->version = rev_major << 8 | rev_minor;
 	dev_info(ale->params.dev, "initialized cpsw ale version %d.%d\n",
-		 ALE_VERSION_MAJOR(rev, ale->params.major_ver_mask),
-		 ALE_VERSION_MINOR(rev));
+		 rev_major, rev_minor);
 
 	if (ale->features & CPSW_ALE_F_STATUS_REG &&
 	    !ale->params.ale_entries) {
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 6779ee111d57..58d377dd7496 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -8,6 +8,8 @@
 #ifndef __TI_CPSW_ALE_H__
 #define __TI_CPSW_ALE_H__
 
+struct reg_fields;
+
 struct cpsw_ale_params {
 	struct device		*dev;
 	void __iomem		*ale_regs;
@@ -20,19 +22,26 @@ struct cpsw_ale_params {
 	 * to identify this hardware.
 	 */
 	bool			nu_switch_ale;
-	/* mask bit used in NU Switch ALE is 3 bits instead of 8 bits. So
-	 * pass it from caller.
-	 */
-	u32			major_ver_mask;
+	const struct reg_field *reg_fields;
 	const char		*dev_id;
 	unsigned long		bus_freq;
 };
 
 struct ale_entry_fld;
+struct regmap;
+
+enum ale_fields {
+	MINOR_VER,
+	MAJOR_VER,
+	/* terminator */
+	ALE_FIELDS_MAX,
+};
 
 struct cpsw_ale {
 	struct cpsw_ale_params	params;
 	struct timer_list	timer;
+	struct regmap		*regmap;
+	struct regmap_field	*fields[ALE_FIELDS_MAX];
 	unsigned long		ageout;
 	u32			version;
 	u32			features;

-- 
2.34.1


