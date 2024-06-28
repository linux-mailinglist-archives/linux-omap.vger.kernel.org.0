Return-Path: <linux-omap+bounces-1613-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032BA91BE0F
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC16F281EBA
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BF5158A32;
	Fri, 28 Jun 2024 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHM803dB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB80158A1C;
	Fri, 28 Jun 2024 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576132; cv=none; b=llthBy0jSzilWf4g4t5rB0cHDm6YZWzInquc1WLw1Su1YLbpgCeoBZBnXBIimOn0DSAXRTD5u1sRRv/x5shcSC2dvko2wSrv216ZRIkCD1UgzLtn4OH/pdHBLVoYroWkUMyii4Equir3WGdTiLugtqh2jZzaFUraA0EHk/vvcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576132; c=relaxed/simple;
	bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u2WWq3qel75icRKiTTh1dlLzl4to2+VGKTVO/nP4Ji1w/CoNAJQtZUz1fUyxXGLIscgZ6PoOkud07P1EC7VQDuW0FfIV7tuhMmKWCVUYkEt0IgCVuhtTXmMTSVEnIM32aNS5X2oMAX7o89OISRbz3wWZxzhea2XUgZg33+neuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHM803dB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F53C4AF0A;
	Fri, 28 Jun 2024 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576132;
	bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHM803dBknFewiojIfQHdBVLsUe34bmQ9/Y3HjGLzhUexNoR/mvLB5mlGeLuDtD2t
	 jY1Nvj5bYrtkEHcCSVvgFoEKd6tOUyyPI7ZEWbPDhOIDgXH1lRxMUcscjoCtoVL5Z3
	 0FE3KIJnyeHlFuUp/9ayHomhxr4Z/Q+yu+9iYZptItl7cU20qfwvNmZDALXZTdYTvh
	 LggNRIo8jlteJYD04umwsQo5CAdciULpHcqbvvg1fAlnqNSQELZP9Y6wKyoCNEE3U8
	 NM+Zj0nvTHgWWADiED0+FNLrEd/Yip/rKEpfy6sSjTIst1R759BYTO1Dtn0N2bLpYH
	 d0rKz0K7fYO1A==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:51 +0300
Subject: [PATCH net-next v2 2/7] net: ethernet: ti: cpsw_ale: use regfields
 for ALE registers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-2-c399cb77db56@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7430; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=CbIB5qO2jhGkVedTF0ZhVMpobXs6Dehu/8Fb+mwzfxw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4NAkury5OcdAFq/qu4zron7Mtmud2j35J9
 CrKlbY+UwaJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 k034D/4/Ck5SWOgwJ045RfpikUywcsAxK4P6V6NTZElcqYqAz4o3gPIZdXvtX5SHNzkbDKDqrCP
 PzfCMKxmCe8a6axqkALICK8va9igYevs5Z9V2Mo+PIT3/K1d3nYTBIiA5o5Ei9RWsQ/YA9Prp+Z
 B1fSsYH08dqiLOmty2BCZY/s0pXNBVw5Z282Q1hfJletg8e4HwQeGK9wl7xK1IWcGpOpGqHsdWB
 genBSuXs7p0lu4FPJgnb/1QZmPbjmbMobGFyiC1HZlT2669CiT/F85VvkutHXGRPD9OzbbN4MIm
 PSmheoQO9i1GF03/sSmxc+pi++TEZSRDVXRLY/yDMvW4YmqubCV4u+GuS99wIBhnaRixqVheXAx
 Xq5IkHd5b27l1fD/yLggJKtPx5ciJykLMaqPZ/1Mb3yH/L/8cX6TJQNImuVWYXZhK8w5LA30Ek5
 K8DXQmgVnzAvymR8I46kxrVz6Uso6Ok3FHYbKBx5bExysktKHRDT+vjocLjpjjYOnz500lNgwtr
 Rnp4yjH+MRRgl03SGhsyngmiOxWR01d9QDjIvbPDf13WRcedH9AExGS6wGgkIacikvNZFV8AnST
 NRJSUMiy0Q+t7STgwy8nvr0uvBXTYxPlOPmmwP+vOjJDEGZSTprDJTrtNAcaD5pErkNM3nOZDEO
 LjSZcqqAKPXNR0w==
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


