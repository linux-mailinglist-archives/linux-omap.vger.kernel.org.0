Return-Path: <linux-omap+bounces-3717-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75696AB6AF7
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC15B175C1B
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158BC27A930;
	Wed, 14 May 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6OvaoM6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE3276057;
	Wed, 14 May 2025 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224286; cv=none; b=l/7NU6vz52Sq2IKelwts/+voyUQ7rR14uDrki4viKXLRiMbwXB0eYy/bxtQ7DJkDDPY3pzu9gdxkEQ+WpbN2O2skIQiCPD/pK2bZESA5BGrEArW1boXt2ZXreXsJ9TIGOrq5a2Ov9LmNgfhHxYRxc4kSgN4WgdPkEqSTO02dkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224286; c=relaxed/simple;
	bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fzy04SoWFdWkncfEt+FNNMvZ13RJBCklws4ps2pawi5BrxwzJTg1Fwl+CebeuNfmXjtJChMvV3SB0oEWod7hgweMQg7w9dp1AGNbKeBRPMv9GfsX/V2tHWLIACkcdS+2e17GLMgA/6Z75Q3Y8c3nXEVp7AHs8xoUHrvqkb8Ukzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6OvaoM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A86C4CEE9;
	Wed, 14 May 2025 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224285;
	bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o6OvaoM6IVzJUtz2GluNLu+zdSe8qV065ZbQDsxZ83xRY3lmzZTeUruGoY3/LUdZA
	 vUzdsQtRG6oUzw+kI8QAUVfE/hpG7oTou5h7EpJEd20Z0HT1CVmruH+MT7l8gGxrYs
	 PGwExl4v4mr8lJLtKhR4KDpyiEwelYSjexd6aoj1UoCG1szgXm0/ZD3HXIZazxsZmw
	 rUqXlrHIVVPkl8F3jVW8dJP+e6X+30V3cqWOD89+bkhc+REM6YRUYB/qj0gnkbSqlF
	 ffzYu/rppYWJ5wErIz0oO7gGrtGAW0w9i7zYs1+MOZ72l78qsvR8769LmdXGfnFWpi
	 8P9ZdudgF9FtA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:25 +0300
Subject: [PATCH net-next v4 5/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_reset_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-5-5202d8119241@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbJXjrX6PFUDz5hJxXZPQhB2nfG3uTnSFp9Q
 wiI/lvj0jiJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyQAKCRDSWmvTvnYw
 k4s7D/4ss3bGtssZdAzFaOvK6RbZiJRwV1s07Vgdf6oQL2YKrlgGKatPtkcseGD6ahr4XL0CA/V
 VdloyUkpimPYhDYEN1rW38+yerX2LfEsaVWSLdvFuFa+MKU/mzzj5+Ndp3yjL5soRxwGuiJylHy
 lsUG1YLnKzdALho4PbG4mDn9pm3vLksZL7jybv9Y5oKYQG2R2nffZP8vopt0K59jRK3lzlP9H5m
 Isl99TnwoLfLcjbuFi3XZ2FdYmV2UYwkSwU+GO2AL7upLTKtNnubgDpFBhpRHmaCw3DLPf4gHuU
 7BVvo94MlvgtlrOgQVsRAUVg2Q3IJvNkTx+I6wltZ0h6bE8Aw4NGL1l0SANENoVsLO8zQa4L6KO
 VeoS5TsNbcwTUMKnyfs6rtBuBDlEmDNN/Y0p11vpJnQf8z0x078RQeGsG5RJLDMGngMNlnyRQpp
 IAcrhHRHZaY8T7/BQ1oOYyOGIOz3d4cDHCYTIc2Ul9cDDxTGTQHKPcnoLOaw8YCw7B5PYMJ+FUJ
 IP52Oywr/3FfLl14pkGINU8B44NnnsFBdK7w7LPVnBhkazKWIrcs8tBhpjNASmZdpeiUY2Xm5va
 i3XmKdw3PhMCp7EPCbRdh0r0/G4plWMx9ICwgiMNmH41wmG1xQGbVJ6xR8fc/0M56s8FIo10RJ6
 0XXdRddodlyYhKA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Add new helper cpsw_ale_policer_reset_entry() to reset a single
policer entry. Clear all fields instead of just clearing the enable bits.

Export cpsw_ale_policer_reset() as it will be required by cpsw
drivers using policer.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 35 +++++++++++++++--------------------
 drivers/net/ethernet/ti/cpsw_ale.h |  4 ++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 74dc431f1c1b..49ea1c00be3d 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1674,30 +1674,25 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
 	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
 }
 
+static void cpsw_ale_policer_reset_entry(struct cpsw_ale *ale, u32 idx)
+{
+	int i;
+
+	cpsw_ale_policer_read_idx(ale, idx);
+	for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
+		writel_relaxed(0, ale->params.ale_regs +
+			       ALE_POLICER_PORT_OUI + 4 * i);
+	cpsw_ale_policer_thread_idx_enable(ale, idx, 0, 0);
+	cpsw_ale_policer_write_idx(ale, idx);
+}
+
 /* Disable all policer entries and thread mappings */
-static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
+void cpsw_ale_policer_reset(struct cpsw_ale *ale)
 {
 	int i;
 
-	for (i = 0; i < ale->params.num_policers ; i++) {
-		cpsw_ale_policer_read_idx(ale, i);
-		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
-		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
-		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
-		regmap_field_write(ale->fields[POL_DST_MEN], 0);
-		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
-		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
-		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
-		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
-		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
-		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
-		regmap_field_write(ale->fields[POL_EN], 0);
-		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
-		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
-		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
-
-		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
-	}
+	for (i = 0; i < ale->params.num_policers ; i++)
+		cpsw_ale_policer_reset_entry(ale, i);
 }
 
 /* Default classifier is to map 8 user priorities to N receive channels */
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 87b7d1b3a34a..ce59fec75774 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -156,6 +156,9 @@ enum cpsw_ale_port_state {
 #define ALE_ENTRY_BITS		68
 #define ALE_ENTRY_WORDS	DIV_ROUND_UP(ALE_ENTRY_BITS, 32)
 
+/* Policer */
+#define CPSW_ALE_POLICER_ENTRY_WORDS	8
+
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params);
 
 void cpsw_ale_start(struct cpsw_ale *ale);
@@ -195,5 +198,6 @@ int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
+void cpsw_ale_policer_reset(struct cpsw_ale *ale);
 
 #endif

-- 
2.34.1


