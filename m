Return-Path: <linux-omap+bounces-1487-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F98FE629
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2441EB24094
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA547195973;
	Thu,  6 Jun 2024 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqiio6u7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49603196428;
	Thu,  6 Jun 2024 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675803; cv=none; b=kVMXPLZJXAj19OCJP5Ec5MgdNYqsJlXWosZFYxABhDZ3/QS3ys6OAFqqomGP4AaMTSeJpmxOjf0ZnH8jCYjptU5vHRJBTn2A9jgn5U/INPNHNT1D62xBtikm2OwS1dRm+QQ9kcb1eVXsc8UZ1SXcBIpSSed4hWQE8kQDMgb5BvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675803; c=relaxed/simple;
	bh=BvmwkuZlIp7KUqJlCXytZF18sbrRcmVkgruLanmMgJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLDTTx31vbj6BLSdVPE7dahLeDaFeXK3P5I/jVnjx1qEz6h0cJFGE9KoPPeetkSxp5x+2puDEOg7+9XFPxQgmkd+4QYYxIHJRk+TZvyQ/M0Qkl2GyB5647jjB7AcCYhYSPzq6DT/ZRxVPxAQoyrdSJEb+5Dme0ZQfIVt7n5KCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqiio6u7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA23DC4AF1A;
	Thu,  6 Jun 2024 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675802;
	bh=BvmwkuZlIp7KUqJlCXytZF18sbrRcmVkgruLanmMgJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jqiio6u72wsLy3pro0uvsZwcNMY3iJ8piktCzDCwKPYFhdGHKZK/yEIPEjO/c0+Sf
	 VTAdMTYqfClfWvuVWcOeJvZg8wTUcsmB9tbVsGMKbV8WB50B6AiT7Q2AKALV1RSgZN
	 L8EVxWU4/1pJG3zlSnli0nCGpc7t2Ka+QIYB/dm3YggU55RjMC6aDVgtCrG6lSAz5X
	 FnS6ZMKyac/OBI51UFy+xo+rm6yo2CUEsyOwii9I8/dwdWxRxeRVtKb411kcO2KfOD
	 OZKcFpBOzYNxj9PhXIS6KTSqWcetdXZxaORp8lOgWugixlO0I2u+csGrnMYT2lLtv/
	 L1WU+mzMYJH1Q==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:20 +0300
Subject: [PATCH RFC net-next 4/7] net: ethernet: ti: cpsw_ale: add Policer
 and Thread control register fields
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-4-0704b0cb6fdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5916; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=BvmwkuZlIp7KUqJlCXytZF18sbrRcmVkgruLanmMgJk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacEajKD5vy3GGpysv1klZ8AcEVPU6aFeecur
 r2UKo7N5DaJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnBAAKCRDSWmvTvnYw
 k0rkEAC3F1IwLBwhlB4sNGCR3k1d5SaHYVuuddYz7QVFX2wBXiY7O+GUb622/YUes4uYyNkAgz/
 Lv9CeENCGgbQzk4YAvZaBhMprjkK6r0xy5CKkVJvWq1QPHlvUxU496BH6igJSPxp4Twul830HTF
 TztXWt/l8lmb9Mov+ItkBZ6z4iJkPFpPtQKBAV6mgTFV7gfx6SIPyKa4bWSTzks54LhvSeMAiei
 MI0st1BbtTpgbo8PU7+OfBuoGcrnvn1zOINH9mBV7eiARCDqZnoao7EdiJDrPfLWU1V9CtWOg12
 JnfQDhN9NR7JtDwzxyzfY00aPcOWXaGej/SnPOsB02ZmnPzG22zvmLQqsEC+yXC1vCkNF+OZea5
 CprA2gsjNafRvrIE5p8iSJYdJ9eC0JsP228RCs1FQ3ibvBMhoQQZHw0NaJssdJ4UGdjg50X6bsN
 e63AGsKJb8g5fFAjVzAV5TP36kFZi9flDMJfonsLF+XrwJ4KjubdBCjPSET3PG29a21D2dkghS7
 SP1bBakEjBiaeU5Wk3A58g1y0Q4XWNEnJbcfmApENN/q8M2flgyu4FaGrxVnEOAFrx1QIntylAd
 3QZGERPH/Aiuzj+cfDd+Q8rFUYxEW4K+lrJQUpGupVwYLCDIdCgpAk7Iyxcg9otm810VVOzbNGL
 +QpGc+Ejac9bTyw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Adds regfileds for Policer registers and Thread mapping/control registers.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 86 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h | 41 ++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 07a60e9eafbd..cbcc6573d7f3 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -46,6 +46,24 @@
 #define ALE_UNKNOWNVLAN_FORCE_UNTAG_EGRESS	0x9C
 #define ALE_VLAN_MASK_MUX(reg)			(0xc0 + (0x4 * (reg)))
 
+#define ALE_POLICER_PORT_OUI		0x100
+#define ALE_POLICER_DA_SA		0x104
+#define ALE_POLICER_VLAN		0x108
+#define ALE_POLICER_ETHERTYPE_IPSA	0x10c
+#define ALE_POLICER_IPDA		0x110
+#define ALE_POLICER_PIR			0x118
+#define ALE_POLICER_CIR			0x11c
+#define ALE_POLICER_TBL_CTL		0x120
+#define ALE_POLICER_CTL			0x124
+#define ALE_POLICER_TEST_CTL		0x128
+#define ALE_POLICER_HIT_STATUS		0x12c
+#define ALE_THREAD_DEF			0x134
+#define ALE_THREAD_CTL			0x138
+#define ALE_THREAD_VAL			0x13c
+
+#define ALE_POLICER_TBL_WRITE_ENABLE	BIT(31)
+#define ALE_POLICER_TBL_INDEX_MASK	GENMASK(4, 0)
+
 #define AM65_CPSW_ALE_THREAD_DEF_REG 0x134
 
 /* ALE_AGING_TIMER */
@@ -1306,6 +1324,74 @@ static const struct reg_field ale_fields_cpsw_nu[] = {
 	/* CPSW_ALE_STATUS_REG */
 	[ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
 	[POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
+	/* CPSW_ALE_POLICER_PORT_OUI_REG */
+	[POL_PORT_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 31, 31),
+	[POL_TRUNK_ID]	= REG_FIELD(ALE_POLICER_PORT_OUI, 30, 30),
+	[POL_PORT_NUM]	= REG_FIELD(ALE_POLICER_PORT_OUI, 25, 25),
+	[POL_PRI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 19, 19),
+	[POL_PRI_VAL]	= REG_FIELD(ALE_POLICER_PORT_OUI, 16, 18),
+	[POL_OUI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 15, 15),
+	[POL_OUI_INDEX]	= REG_FIELD(ALE_POLICER_PORT_OUI, 0, 5),
+
+	/* CPSW_ALE_POLICER_DA_SA_REG */
+	[POL_DST_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 31, 31),
+	[POL_DST_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 16, 21),
+	[POL_SRC_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 15, 15),
+	[POL_SRC_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 0, 5),
+
+	/* CPSW_ALE_POLICER_VLAN_REG */
+	[POL_OVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 31, 31),
+	[POL_OVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 16, 21),
+	[POL_IVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 15, 15),
+	[POL_IVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 0, 5),
+
+	/* CPSW_ALE_POLICER_ETHERTYPE_IPSA_REG */
+	[POL_ETHERTYPE_MEN]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 31, 31),
+	[POL_ETHERTYPE_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 16, 21),
+	[POL_IPSRC_MEN]		= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 15, 15),
+	[POL_IPSRC_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 0, 5),
+
+	/* CPSW_ALE_POLICER_IPDA_REG */
+	[POL_IPDST_MEN]		= REG_FIELD(ALE_POLICER_IPDA, 31, 31),
+	[POL_IPDST_INDEX]	= REG_FIELD(ALE_POLICER_IPDA, 16, 21),
+
+	/* CPSW_ALE_POLICER_TBL_CTL_REG */
+	/**
+	 * REG_FIELDS not defined for this as fields cannot be correctly
+	 * used independently
+	 */
+
+	/* CPSW_ALE_POLICER_CTL_REG */
+	[POL_EN]		= REG_FIELD(ALE_POLICER_CTL, 31, 31),
+	[POL_RED_DROP_EN]	= REG_FIELD(ALE_POLICER_CTL, 29, 29),
+	[POL_YELLOW_DROP_EN]	= REG_FIELD(ALE_POLICER_CTL, 28, 28),
+	[POL_YELLOW_THRESH]	= REG_FIELD(ALE_POLICER_CTL, 24, 26),
+	[POL_POL_MATCH_MODE]	= REG_FIELD(ALE_POLICER_CTL, 22, 23),
+	[POL_PRIORITY_THREAD_EN] = REG_FIELD(ALE_POLICER_CTL, 21, 21),
+	[POL_MAC_ONLY_DEF_DIS]	= REG_FIELD(ALE_POLICER_CTL, 20, 20),
+
+	/* CPSW_ALE_POLICER_TEST_CTL_REG */
+	[POL_TEST_CLR]		= REG_FIELD(ALE_POLICER_TEST_CTL, 31, 31),
+	[POL_TEST_CLR_RED]	= REG_FIELD(ALE_POLICER_TEST_CTL, 30, 30),
+	[POL_TEST_CLR_YELLOW]	= REG_FIELD(ALE_POLICER_TEST_CTL, 29, 29),
+	[POL_TEST_CLR_SELECTED]	= REG_FIELD(ALE_POLICER_TEST_CTL, 28, 28),
+	[POL_TEST_ENTRY]	= REG_FIELD(ALE_POLICER_TEST_CTL, 0, 4),
+
+	/* CPSW_ALE_POLICER_HIT_STATUS_REG */
+	[POL_STATUS_HIT]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 31, 31),
+	[POL_STATUS_HIT_RED]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 30, 30),
+	[POL_STATUS_HIT_YELLOW]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 29, 29),
+
+	/* CPSW_ALE_THREAD_DEF_REG */
+	[ALE_DEFAULT_THREAD_EN]		= REG_FIELD(ALE_THREAD_DEF, 15, 15),
+	[ALE_DEFAULT_THREAD_VAL]	= REG_FIELD(ALE_THREAD_DEF, 0, 5),
+
+	/* CPSW_ALE_THREAD_CTL_REG */
+	[ALE_THREAD_CLASS_INDEX] = REG_FIELD(ALE_THREAD_CTL, 0, 4),
+
+	/* CPSW_ALE_THREAD_VAL_REG */
+	[ALE_THREAD_ENABLE]	= REG_FIELD(ALE_THREAD_VAL, 15, 15),
+	[ALE_THREAD_VALUE]	= REG_FIELD(ALE_THREAD_VAL, 0, 5),
 };
 
 static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index bcbaaa7a1bca..c697d2e3e586 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -36,6 +36,47 @@ enum ale_fields {
 	MAJOR_VER,
 	ENTRIES,
 	POLICERS,
+	POL_PORT_MEN,
+	POL_TRUNK_ID,
+	POL_PORT_NUM,
+	POL_PRI_MEN,
+	POL_PRI_VAL,
+	POL_OUI_MEN,
+	POL_OUI_INDEX,
+	POL_DST_MEN,
+	POL_DST_INDEX,
+	POL_SRC_MEN,
+	POL_SRC_INDEX,
+	POL_OVLAN_MEN,
+	POL_OVLAN_INDEX,
+	POL_IVLAN_MEN,
+	POL_IVLAN_INDEX,
+	POL_ETHERTYPE_MEN,
+	POL_ETHERTYPE_INDEX,
+	POL_IPSRC_MEN,
+	POL_IPSRC_INDEX,
+	POL_IPDST_MEN,
+	POL_IPDST_INDEX,
+	POL_EN,
+	POL_RED_DROP_EN,
+	POL_YELLOW_DROP_EN,
+	POL_YELLOW_THRESH,
+	POL_POL_MATCH_MODE,
+	POL_PRIORITY_THREAD_EN,
+	POL_MAC_ONLY_DEF_DIS,
+	POL_TEST_CLR,
+	POL_TEST_CLR_RED,
+	POL_TEST_CLR_YELLOW,
+	POL_TEST_CLR_SELECTED,
+	POL_TEST_ENTRY,
+	POL_STATUS_HIT,
+	POL_STATUS_HIT_RED,
+	POL_STATUS_HIT_YELLOW,
+	ALE_DEFAULT_THREAD_EN,
+	ALE_DEFAULT_THREAD_VAL,
+	ALE_THREAD_CLASS_INDEX,
+	ALE_THREAD_ENABLE,
+	ALE_THREAD_VALUE,
 	/* terminator */
 	ALE_FIELDS_MAX,
 };

-- 
2.34.1


