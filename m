Return-Path: <linux-omap+bounces-3647-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2560AA98D6
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2C617C89D
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEC026E159;
	Mon,  5 May 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JARlo/aQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5D268684;
	Mon,  5 May 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462415; cv=none; b=Q+399RrGL7aoW9McSt8+fOOTsPb/Bjv2VikfgBSB0emHvuhWGsqAS2IMIBEoxGCeTpKrlWth/uMmFUc773uffB+UdbePXlvMgxG/hmIsFlAhcWPIHpc/awgdt5rMK2b3qEbqEOkF0h+Rw8jfCdqVeDVJvEHG3z3JtPCsEQnYBDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462415; c=relaxed/simple;
	bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgTEv0UHZCwSbtP2AhcGrRuN3FD1umZLsDPcO5HCCecL4bUNBXCfU6PhSIFJX9eMZN6MGRJHCWh5rKadbrUegaE4gCD1xXDCZnIusnHKhI+fjyp3lCjj7axleGTag1ZSlW7gEQ/VpyR/Ig+Dw69v4x6u32Ivd9U2VP6lJIHYD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JARlo/aQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A504C4CEE4;
	Mon,  5 May 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462415;
	bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JARlo/aQbI7ylo0Vy3ogw5tZDew3Oc6tO/hmWy/S/xSS3l6xfekVIjs0Fse1BJWUt
	 kudDcBbQOHt1P7aIUozT1XwCV5WaZ7ge7szrsOJaPsfFrYVtCfVWQ5rb8Em67tXckG
	 cEfkSh6dCA/Xyw0KAAbqLYaznp6U9ii9cLFz3aCx60bMQAEJMiWKQ4pd/TBXBfxmQN
	 tGL9oROteGApKcV0X8u5DnENXlVvd5HiA/BLUR+M5v+6zMGoGmBqqWkCoAkUy5XrMc
	 SunMbdSlWL38JPo28VETR9A8QY6t73fPyS2RBEjfxP9p6Qj+LjUsY7+zSOJmh2D9sP
	 +E5lj7SNw0BfA==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:35 +0300
Subject: [PATCH net-next v2 5/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_reset_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-5-5359ea025144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=GdBpx6MqbpI0u0QoDfqyPuHJ43rlaIHaOD2v+M+Vh8Q=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa7Vg1u72naCQzy8UvJEsYjzls5dgOPKFeYM
 kJwVzsLSteJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmuwAKCRDSWmvTvnYw
 kz51D/9LvdfA+35GD8sdnoS102Q6W4wp3TJccLJTfYtWENtaRrpjNz3LusNzmgwdd7ICPNEOM04
 RgPfKsTbqu/zO44mbVLekHY9XAYTwlotbE18EMIxruv2u9MbCDTEmUqh+pEm9TrOWFd3PG7GUTW
 SU0ZtXWho5hGSPCnqK2wo7eoyUNBe/xH8dE2bN810T7vIZ05lgPsCQXxMq4JHdeS9N30YKb/BCW
 CczmIeDgs2IST8AfD9iJpo3uhqu2apaiRx6UQvmjG1VwOEuskxwOoKiY5YN+m6MliZd6LJWbMYY
 uJOwLy6u/F2mLZUDpYMLkIYOLFwxbCyOYy6Aw1a3nPEAZZRLzHm15m6AUp8wooFOHKNeUfQ8S1+
 D4Xb4VRLk0IDDC7D1xi9b4g49Nj5jXxvrqcQoiYlE4I8bna5CFIduOumd59lXwPZHKiN6yiwjFC
 zgaWrwsVh36C+TjqFcqL5sgSYpGqeuPstVPw78/Zl8HNiWDDZEzZhReB4BlTBYBqlzwwUauJR6D
 zkS4gXrp8yH0OwQrtcB2IVSKtjScENaVNlgKMgMTqNiofEaiRJ6Ya7yR4RCHsT0LAn5ip+J5tTo
 Dau7kURa6B1Y/aC9SYuDmif5nsllE+Q1yvL7cEkQakRxv0FtrCnnd+TcDUrAxUCnhF0YudZZWY1
 Vj4suJoT0FuvlEQ==
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


