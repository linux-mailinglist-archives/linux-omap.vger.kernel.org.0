Return-Path: <linux-omap+bounces-1684-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034D926242
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D331C230AA
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4204817C207;
	Wed,  3 Jul 2024 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp/vm05e"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5F8C1F;
	Wed,  3 Jul 2024 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014706; cv=none; b=NnZjG1ROPTXtP1WbJQNz9gEKGyQqsNbwULiZfA+XO5HY9DTchD2RTbbBYBaTIjjQhveifX6oJisYbzxMV7/yCgoNG4Vey9ahWF0Mvtnbq0Ak5fjEWYLWxkQjI+klhxDAZejdZU8H6Dxnuq8FeWl0OMRRV7ICheENWmioQvTsmmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014706; c=relaxed/simple;
	bh=O97XTUmrKRR0a5m/khz4qd/xvH7b9hbhH1hyFDxFXD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDsOrchaz2oVkmPUBE2ZGwtXNW6Cse1ctCy1tfoMwJQ3ZSy8whFd4QPEXoOQp4JozskpDG5061I0nhnnDKVpgNH1/QGV708/5sBgULsqbqqPpAv45BQbK7LGNa/4AxOM07AJ264fKtjIvqpEt36LGJx+aBsTuAnHFejO2iIz90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hp/vm05e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0025C4AF07;
	Wed,  3 Jul 2024 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014706;
	bh=O97XTUmrKRR0a5m/khz4qd/xvH7b9hbhH1hyFDxFXD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hp/vm05eVIhEuDpS3+GUrDzRKgUaEqge3zeUJaN14BFR2h+jgiMyGSReQp23Ua7aH
	 9r59vcM6hGR7USl/npy2lEofMhaFZTGKBenhx/be+eBzsu3MqTgoaDVbUKSp34wsoe
	 jWK/p7Rm0TwzoTz2o74i8dznIGcPFdvWh8zDpyriz1mfLfA4/FaIPhZ7GiYxEkz8RM
	 1GFrxYckTwiXpfsTkxe1aG9cAuB7dp58Vcm1Glh216N76iTUGZimE3rqCLCe+lvusy
	 w0F9zmELJOctHF7OfyzZCOrovFI6ahK8Wlll6DOQyqTozRlEZBYD/D/YlVvZq04cd+
	 Le2ehYB1unObw==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 03 Jul 2024 16:51:33 +0300
Subject: [PATCH net-next v3 2/6] net: ethernet: ti: cpsw_ale: use regfields
 for ALE registers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-am65-cpsw-multi-rx-v3-2-f11cd860fd72@kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, 
 pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7543; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=O97XTUmrKRR0a5m/khz4qd/xvH7b9hbhH1hyFDxFXD4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmhVdmK8+jEmeV4YmSKuRFEhuRLYY8IQQqOgjFq
 qjUddkjwOWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZoVXZgAKCRDSWmvTvnYw
 k/KyD/41nQ3qAhPYGdwyw72oyJlsfMTne28Rllq+33UZHjJlapEWA3rP905eU/AHIw9PcPb6Ewl
 PYCg5e9dayoRKnkG5a2O9AMsuWoBt0xjFTIyre6czDHIHI9/ukoQQBkgPuDAGGqOQC+qAESuh7B
 o6lSvVRQxi6jdd1ICcOb9z9gZ5SdkQamvaQWQP3N9qkNccBB5VhR7HNIRdBVntexEMS/2YCqX3R
 VujSocwZ3y22WBjXCQL+vguJMFqL+mrP1qokUMMzmvx826hb6LFeDRgqX6xdci5C8l27yRZ9+Uq
 wKDjqOxi11TawS+p/P9jd2ta9igJkALPC6MhN3IMhW7bMljDHVALItdxnOVF76IFskhqFpEx2Bx
 C7i7pUtAtE04P4ZUeslEtwGP0eO2KU/949YMR70SxKWyX4g75TIP4gk0JuxXE22n17Kf4V1hqWM
 p6nWP48wmv2D/zjJmuEi0IwyGgh5zUwYIcnaGoa4BHl4cnmGmXildnojb24ENliGJuMnf1dEien
 vYHIpo1Q5q0t+KzhClxwDCAcQJqmr+lpjknyysAskyVl3vQQ5c9UeNXtfvKeRyw3QSRKCsVDn4P
 QQZFxLm/noJCAJKX26zFJreE00UhMDKpnn2neMRRjCd6HaXk9OogiS27AXi/N3QA7XWAvLy067C
 2G12I6qsEk4ZviQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Map the entire ALE registerspace using regmap.

Add regfields for Major and Minor Version fields.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changelog:
v3:
- added Reviewed-by Simon Horman
---
 drivers/net/ethernet/ti/cpsw_ale.c | 84 ++++++++++++++++++++++++++++++--------
 drivers/net/ethernet/ti/cpsw_ale.h | 17 ++++++--
 2 files changed, 79 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 64bf22cd860c..f638aa63edee 100644
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
@@ -1361,41 +1374,76 @@ cpsw_ale_dev_id *cpsw_ale_match_id(const struct cpsw_ale_dev_id *id,
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
+	ale->regmap = devm_regmap_init_mmio(params->dev, params->ale_regs,
+					    &ale_regmap_cfg);
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


