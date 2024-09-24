Return-Path: <linux-omap+bounces-2237-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960249845E7
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 14:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B6C1C22D92
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 12:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB091A705D;
	Tue, 24 Sep 2024 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVu7s6p8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877253F9D5;
	Tue, 24 Sep 2024 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727180948; cv=none; b=DUg5bdMNAocBP8VgXeRpQQakgenqzxRnPWKyx4JyWNc6Bv/wkIt6dNYA2CnFBPCry69OgQqn7wf0Tog4WpHBez/tj6QQe1O9XVyLPC90m4rZa8F1xnCbnJxKw/AN0QLDFmGZKRVgamCf0EWA+zEWEy1Rm7e5lwjNyGUDfxa+tws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727180948; c=relaxed/simple;
	bh=j4z0lX44fz/Sd7pRd8ALq4d+XegAN608GA7cOyTsM8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VkA/VeagLmyVbS6t6Yc+XTnuuw3D/SnG9ywvVJ8TFWrMeCBH9d2z3lNen0hgSJdQ8i/3ztkgPrLJOaXH+h1NQQGwTrJJZCqBdIzVE8x4km/aL+/4tFxMKR3KMq3P6ix69hZ0NtHMAb2jHU0W7U/eG49XU0hJtR3gNqhM1j2qGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVu7s6p8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAE9C4CEC4;
	Tue, 24 Sep 2024 12:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727180948;
	bh=j4z0lX44fz/Sd7pRd8ALq4d+XegAN608GA7cOyTsM8E=;
	h=From:Date:Subject:To:Cc:From;
	b=qVu7s6p8nbi3VajIJsqEswpWLGuhg71uIclSzX3H9S4SqoYChxRLxiFWGJ9UH/CxW
	 i6+8J/GaFoU7gCnAilli7wsMdCVgT+VxrDPYvajY6b/fzztDnY9j/9bYsABpoZMh7v
	 CDFzA7+bkmxrg0A/sek35GA4uCrljB2rPqI27FvU55g04FtiqzMPjNoErylO5+Qlgk
	 woNZzVXnCptgmP/b1IDgK+d/5/auAqLkuS8tWRwrxS7fdu4y8F+fNcSM55yKyOjSzL
	 qMNmWmJYfw5WMZZhZpapPEODR/FYRCBdFNwdtrmgxMaXT0waAzUlWoWAccU7gV/uM4
	 Sf2ByMwiqmK0w==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 24 Sep 2024 15:28:48 +0300
Subject: [PATCH net] net: ethernet: ti: cpsw_ale: Fix warning on some
 platforms
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH+w8mYC/x2MSwqEMBAFryK9ngaNUUavMriI8akNY5TEH4h3N
 7isgqqLArwgUJ1c5LFLkNlFyD4J2dG4ASxdZFKp0mmlcjZTWbBdwsHT9l+F/cm9nIxWf2F6qyu
 UFOPFI+p3/COHlZr7fgA72Hm4bQAAAA==
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srk@ti.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5815; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=j4z0lX44fz/Sd7pRd8ALq4d+XegAN608GA7cOyTsM8E=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm8rCN5OnVq+tKLHFO7qebc5JvbOtP+nlqhorcK
 MffmXJ5iamJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZvKwjQAKCRDSWmvTvnYw
 k1BsEACakksbQcenbrbugMW2XDKw/NdZ+s2xyMQ6Fwdla/P/463h3+Pp1nIadSj1asvVCMLPSvH
 kFGnLlzfBX8FXQtM5MFFcXqiarE2tpse9Q+tFk42g27/fFodXUrN0MOfpMCYeG7Gx5lgwqsV4g8
 kxXoNAuVLC5jk6LNFKol9ZFTz6itHAPYwZTomh7Ir3vwjeCydyZhiMzY2f5VajC0+oqAgmdTOla
 zXVXt/hefEzY8dj5HNkgamXttkUpDZll3+A1ozcVxL+SVfSoYpEd+5+sT6rSzkd8lITAOmTaTe6
 N0RfH0ipjE7sklXOwLz/HIabQCrvQ/8F1zKFtTIpU6PCBKc/2QV7uCbCVlpZ7Mt7fdmLdhITeVw
 FZyIk65qqhaefEIZZsQ9RHJ7llXEBY8pIkO2lyUfHSMVfTrJluWoPiyNSJVWsZtesaRPK7w1Q5o
 CDrm0B9/fD95cOcRCGRGbj07c4bggbrN8cApP/xShzwJsIc8wPYGTh/TNahhuF1Pqem8z2Ntlm8
 7rBdKb9uidc4KGYGUUj1+iMmR1Q9Ykum/0QUNNDp4zs27o9jaSsnlgMVJecOcBvoV3HRYDZImNB
 Co16PLBxYFxN/uOJZMlCoSvHd0TPVG1cXKxSoJg4Zl1asg0nmgRETwEYtebI3002cFC5xg4xHss
 EXVohPEbbMpXcLw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

The number of register fields cannot be assumed to be ALE_FIELDS_MAX
as some platforms can have lesser fields.

Solve this by embedding the actual number of fields available
in platform data and use that instead of ALE_FIELDS_MAX.

Gets rid of the below warning on BeagleBone Black

[    1.007735] WARNING: CPU: 0 PID: 33 at drivers/base/regmap/regmap.c:1208 regmap_field_init+0x88/0x9c
[    1.007802] invalid empty mask defined
[    1.007812] Modules linked in:
[    1.007842] CPU: 0 UID: 0 PID: 33 Comm: kworker/u4:3 Not tainted 6.11.0-01459-g508403ab7b74-dirty #840
[    1.007867] Hardware name: Generic AM33XX (Flattened Device Tree)
[    1.007890] Workqueue: events_unbound deferred_probe_work_func
[    1.007935] Call trace:
[    1.007957]  unwind_backtrace from show_stack+0x10/0x14
[    1.007999]  show_stack from dump_stack_lvl+0x50/0x64
[    1.008033]  dump_stack_lvl from __warn+0x70/0x124
[    1.008077]  __warn from warn_slowpath_fmt+0x194/0x1a8
[    1.008113]  warn_slowpath_fmt from regmap_field_init+0x88/0x9c
[    1.008154]  regmap_field_init from devm_regmap_field_alloc+0x48/0x64
[    1.008193]  devm_regmap_field_alloc from cpsw_ale_create+0xfc/0x320
[    1.008251]  cpsw_ale_create from cpsw_init_common+0x214/0x354
[    1.008286]  cpsw_init_common from cpsw_probe+0x4ac/0xb88

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/netdev/CAMuHMdUf-tKRDzkz2_m8qdFTFutefddU0NTratVrEjRTzA3yQQ@mail.gmail.com/
Fixes: 11cbcfeaa79e ("net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers")
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 12 +++++++++++-
 drivers/net/ethernet/ti/cpsw_ale.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 0d5d8917c70b..8d02d2b21429 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -96,6 +96,7 @@ enum {
  * @features: features supported by ALE
  * @tbl_entries: number of ALE entries
  * @reg_fields: pointer to array of register field configuration
+ * @num_fields: number of fields in the reg_fields array
  * @nu_switch_ale: NU Switch ALE
  * @vlan_entry_tbl: ALE vlan entry fields description tbl
  */
@@ -104,6 +105,7 @@ struct cpsw_ale_dev_id {
 	u32 features;
 	u32 tbl_entries;
 	const struct reg_field *reg_fields;
+	int num_fields;
 	bool nu_switch_ale;
 	const struct ale_entry_fld *vlan_entry_tbl;
 };
@@ -1400,6 +1402,7 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.dev_id = "cpsw",
 		.tbl_entries = 1024,
 		.reg_fields = ale_fields_cpsw,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw),
 		.vlan_entry_tbl = vlan_entry_cpsw,
 	},
 	{
@@ -1407,12 +1410,14 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.dev_id = "66ak2h-xgbe",
 		.tbl_entries = 2048,
 		.reg_fields = ale_fields_cpsw,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw),
 		.vlan_entry_tbl = vlan_entry_cpsw,
 	},
 	{
 		.dev_id = "66ak2el",
 		.features = CPSW_ALE_F_STATUS_REG,
 		.reg_fields = ale_fields_cpsw_nu,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw_nu),
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
@@ -1421,6 +1426,7 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.features = CPSW_ALE_F_STATUS_REG,
 		.tbl_entries = 64,
 		.reg_fields = ale_fields_cpsw_nu,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw_nu),
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
@@ -1429,6 +1435,7 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
 		.tbl_entries = 64,
 		.reg_fields = ale_fields_cpsw_nu,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw_nu),
 		.nu_switch_ale = true,
 		.vlan_entry_tbl = vlan_entry_nu,
 	},
@@ -1436,12 +1443,14 @@ static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
 		.dev_id = "j721e-cpswxg",
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
 		.reg_fields = ale_fields_cpsw_nu,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw_nu),
 		.vlan_entry_tbl = vlan_entry_k3_cpswxg,
 	},
 	{
 		.dev_id = "am64-cpswxg",
 		.features = CPSW_ALE_F_STATUS_REG | CPSW_ALE_F_HW_AUTOAGING,
 		.reg_fields = ale_fields_cpsw_nu,
+		.num_fields = ARRAY_SIZE(ale_fields_cpsw_nu),
 		.vlan_entry_tbl = vlan_entry_k3_cpswxg,
 		.tbl_entries = 512,
 	},
@@ -1477,7 +1486,7 @@ static int cpsw_ale_regfield_init(struct cpsw_ale *ale)
 	struct regmap *regmap = ale->regmap;
 	int i;
 
-	for (i = 0; i < ALE_FIELDS_MAX; i++) {
+	for (i = 0; i < ale->params.num_fields; i++) {
 		ale->fields[i] = devm_regmap_field_alloc(dev, regmap,
 							 reg_fields[i]);
 		if (IS_ERR(ale->fields[i])) {
@@ -1503,6 +1512,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 	params->ale_entries = ale_dev_id->tbl_entries;
 	params->nu_switch_ale = ale_dev_id->nu_switch_ale;
 	params->reg_fields = ale_dev_id->reg_fields;
+	params->num_fields = ale_dev_id->num_fields;
 
 	ale = devm_kzalloc(params->dev, sizeof(*ale), GFP_KERNEL);
 	if (!ale)
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 1e4e9a3dd234..87b7d1b3a34a 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -24,6 +24,7 @@ struct cpsw_ale_params {
 	 */
 	bool			nu_switch_ale;
 	const struct reg_field *reg_fields;
+	int			num_fields;
 	const char		*dev_id;
 	unsigned long		bus_freq;
 };

---
base-commit: 9410645520e9b820069761f3450ef6661418e279
change-id: 20240923-am65-cpsw-multi-rx-fix-eb48eafc49e6

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


