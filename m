Return-Path: <linux-omap+bounces-1615-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5791BE18
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F31E1F23794
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC7015990E;
	Fri, 28 Jun 2024 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSaA8PPu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF615956C;
	Fri, 28 Jun 2024 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576139; cv=none; b=SX0/mTE0qmpJmClUqysos0VmfRN8OlvUd7754WSI+3oCOzreYFa+n4Pplw3kdxeTgzA6xHRR40LK4uudgFEKFSQIyMn9L8o1UspGOGvABSmGGNGrtO8w+8fwIeNThVE4Mq7CCMrJ+brxbpgTjjyaT7Er14jxQu/PH1gjoD0hpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576139; c=relaxed/simple;
	bh=3k9ZkwgGpMPZn2tsQoz44Is7MxHK8Dik11rJoEG98i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5d3TMYJ0Nt5e33mbDSw2/xtfEpPvSTcM/+r8hEsgWS8BBHhh6gvSSsU3iurYiJx9hJN3zEU0yfV9caflHU1firEqhnqL7mXtgMRTHkA+JTWVacbFRL+QiLc9uAYVQigdGwvjTZ64ABCsO9fBDH7bpqJblP3PLm4v8ojUt2V4VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSaA8PPu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CA7C4AF0A;
	Fri, 28 Jun 2024 12:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576139;
	bh=3k9ZkwgGpMPZn2tsQoz44Is7MxHK8Dik11rJoEG98i8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oSaA8PPuU8Boh8baTcIZ8MpdGH8oP+d2K2R2rTirZOXjez8qfAtCHkEN2xaxLkZE3
	 rkskWQIOfKpLvJbW7qI7Gy435AaXELUciQJ8VIV+L4Qqqm9SJVGnoFODDQ2FUuyNMu
	 HCplFiQj3BuvezwaD02c7OlwPoXVqPk5Gx7+EL0NRsh+B0jduQbuAtIya18hsLqVhK
	 kqKVcc3oSU2wlbRLuCVfX+MnbwcbdwDfuMJ8/Civc5huK3n+bDEjpVMzejKbR79yDj
	 qprfxe704/2aDWZcztYYDButdfOCJ5RfWq7d01eAHgcqO8uXDxlTepNYOOJEinIjAX
	 ry2I20WjWAb7Q==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:53 +0300
Subject: [PATCH net-next v2 4/7] net: ethernet: ti: cpsw_ale: add Policer
 and Thread control register fields
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-4-c399cb77db56@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5932; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=3k9ZkwgGpMPZn2tsQoz44Is7MxHK8Dik11rJoEG98i8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4kQ1AO5a5vgA7hzp1QCN2xuUctz8iLY8RX
 6PyNuSH2UWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 kyuuD/9AnEZuAQ1uue9Fx76eZAAuKt6E02b5VBtQqm9/SBp9cZCFU3bv8QG6FnkqRW4Bb4NIUGB
 P5A+TFfjUzMtd7fUtgZA2C/mEj3fW1/9DTZtLh5UQkjxzjaqs2AXLgqU9DRUCVfOjqqSJs5/ouV
 zKhJTGG95EUYAHOjHo8aXvTZ6Z4EZFi8t4C4aek9h5OzLafsl+NFyO2tklmYee9nV4qZt9DRikz
 YiMP1OPDEGAoI3pXz8a4gjyPhzJrDebT0IHK8lHM1m2L2MNBudGCHr5/aeAzl41NKALcBwscY36
 mqnz5OU2oSp881BeLJ6GT0BOr/pQwk7ZEZUPKNzxGDd4Ei3/yFVbJ4i3vurK0fHss3lDK/0JHGs
 jJNHJGu6cusT3e717InE8OELjaIGCdE6K3/p3gZpBbCmdMVjcr/qiSiQC2cewmO29NOpRb80kSC
 b9Q9pKxspbLL6RQ2B05iHd1n88qB2B8bGTQmXDJkqNAPaRu1Pc6mCphnJQM9OBWWMWe9xzMFlWO
 0TL6Dx4He6tBPo1hEXFPplnErd02rRSzT0QTGsTggRNUZfZ1l/XX0x7vasE9zUzYXOruuV+Dt24
 QOGTsZ2FLnTMg5IsAYe+j2jA0O5Jt1WGSxC3ziNBdAyimbMhzIrGjB1zBnkMzD8ljBmi1d6xaLY
 jDl+wrucbWgdsGA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Adds regfileds for Policer registers and Thread mapping/control registers.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 86 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h | 41 ++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index ca66c89c1f12..7bd0dc20f894 100644
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
 	[ALE_ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
 	[ALE_POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
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
index e12bb2caf016..2cb76acc6d16 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -36,6 +36,47 @@ enum ale_fields {
 	MAJOR_VER,
 	ALE_ENTRIES,
 	ALE_POLICERS,
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


