Return-Path: <linux-omap+bounces-4759-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20CC081B2
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 218054F8514
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5882FDC5D;
	Fri, 24 Oct 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M14D9OB+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F42FD66F;
	Fri, 24 Oct 2025 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338786; cv=none; b=Lbkp9C5tgc2KfpRIGZ0Te33hH5VtPdDVvjT5yyMKPokOiSOQ/Q2NefosATd3ShGdHMoKMhA6927i+uvn39FBvfT8imjKpkaUH9nSu1Cw175CFr3EkJyLx9MHTNh127ckqQivtDeW+CvkmeErHLKtkcg4fpOVgmMKwUNWT8GGtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338786; c=relaxed/simple;
	bh=14/Pch89N+rlN9f4R8wQhFGpvUooT1HqZSwrT7vMOQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3q4NpzhPHcgyxiJSdec8NgdvGsJeLd8zoJJXFzgaxnDmcQmuO1tdaVQRTjyeic2YTtwPekjbhyeLrToLR5h8VDYdgZOKGtvC13UbA1rnZ7lEsU3+DGl1N+sDCPeT8FpGv8zzEYO6XU5CM9lQSLOWOydshRIiZFkpf0hvTxqA4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M14D9OB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BED8C4CEF1;
	Fri, 24 Oct 2025 20:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338786;
	bh=14/Pch89N+rlN9f4R8wQhFGpvUooT1HqZSwrT7vMOQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M14D9OB+cofH5k+lDg+B9OHP949Z+o64gff2LLFQR8jqQthN0EDgFBVZWmdP1TybU
	 Sy3ALH1f9DBIUNR7GujIC08MYDVy1zVS8dLHJDWV/bAXoi/WHahPU0KuZkLHIeCq+6
	 BpGUapDP3mlYIOkZ4TgNvCZPypK/ChVac6GiCdaAcbHfY7BFRsHxHOCOYweZPJaaqa
	 0Kwptm42sAGRTtaRkVBb7z4GlB2w6Ml10EyaEzQYHr2fZ25nYr5BFYBIT1oOOrG9Ad
	 FiP0c7Jbb8xzuUsWB+vLPJ9OYdfwCTeBrs/hNGaPQZof91c/lnMoNVCX5uAQNd2Nne
	 kMkKnG++ugu+A==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:04 +0300
Subject: [PATCH net-next v5 5/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_reset_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-5-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3516; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=14/Pch89N+rlN9f4R8wQhFGpvUooT1HqZSwrT7vMOQ4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOMfEih83bEDvDNSC/QVzqnuatc1suO8Aq7
 Cjwu0i3EPqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k4McD/0R1yOKhMxyzBVkY3Gue8MRBJfOfS4qRFE0Z7y/6luqBotq9wARDcE2a8yvEU3PYLIcUC3
 aVe5pDsj5WRnMtL80P9zSQdmBSUsFsEBcgxBk+STEnGBLfl+OxEEXWb1WLUkfxrbALV1ZlJyo0q
 zYMLahvVRDondD89x8eDXCrvokFJWynM8oMtlbYLQjdrsqidp9PH/YGC4p1zNS7aLmRZ/Y+6AvA
 70jNHTmdL85SLRvt3MVIDbvgApREpOmvICpLX7lWfzrTC8cyGi/CodC5j4PM/xosHuuC4s3IRPk
 zK6MbPkB1GuO2XCfZInOmJfqBte9WlGbOFUSPsfMT8dj61zHPac1XyzARZlWvOKQkMHH5P8nrDS
 GDuDG7ve94yUT7EhgPPp8XGOFBFAsS8Pq0Q/KPxK2PIq7PIPitx+ikGnnP8FyiSLQegfIgTr6qh
 xquv7TUP2pJq+uCw42ok7ylMNI14bKkM81zFFj4EryDlOs5SRvaEExs/zlsiDRgjF2DuvHfLblf
 QCqiyFu4u9zH6NDlj5whm7x/ZJGA+aUeAC36b66ASELwviwJemFmucxYZ+WF9o4kYPf8k6XPBQO
 D1qNwFkk1KgG5cctyWkxPXNAqbzaM6QD1rjuTHDYBLUvaUGVBPA1bPOh3/41mykEk7BpZ5MPfuj
 wL8QKqWu3DwObOQ==
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
index f0cd6a9b1700fa061f7042a81c073d835cc5cb87..e259662f38cb8ea780b8d42dde20a81fc88780ae 100644
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
index 87b7d1b3a34a90ec1bf1435ace6fbb565bd2ad81..ce59fec757746ccd784a320b47cb7021da639325 100644
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


