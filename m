Return-Path: <linux-omap+bounces-1687-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41F92624C
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 15:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3020D1F2113C
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7305180A8A;
	Wed,  3 Jul 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRF0p4ct"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F21802CD;
	Wed,  3 Jul 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014718; cv=none; b=eK7Wdkilum5ROKGeEYDssGf1FNmZdmw/lPQweL27JM16mEhhZS6cWtkb/k3Aeeqt58hj0Mo452GXsGaFPo3icoaXQM2s366QUKV0VlzmF0gd05kI1JOODEsKDadwNNdKTjy7p3tfqQ8+uzwCN+its54v3WTpJyOgmq8AoOA73JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014718; c=relaxed/simple;
	bh=mieV4TgwWxm0AsrERuGJpKmWHBNjYVtxE4w5wOIW3x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xh4LJcrkJ6VnvOs0x4X9SfdJj97iSZiLrF3VKP2j39B9VbziJP1S2UTi7JMUqp5a4X6JhbjCJVKIqgVe4/+/HlCNY1I26m/rBhVr7v5ZuX1hg5/kUfnjS4CU6laprsQko/bEav7Ytr/3UTZw8MclTb+n30f8q8g/StiE4zo/PoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRF0p4ct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A7CC2BD10;
	Wed,  3 Jul 2024 13:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014718;
	bh=mieV4TgwWxm0AsrERuGJpKmWHBNjYVtxE4w5wOIW3x0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JRF0p4ctrnmG7IOaB9bmYGpJ0zNElleRI8rqIW9rGgZQd17hfJ0d2Nk/xHxAZKag2
	 rQjN4BJzM6Zq9j5zcdRSfW4PPekyLRIMI+I7hnoTkX3LnzqRhXWA9gjuouYFHyqGty
	 pvraxOy/gZYi2WuCYSxxSjxBsqDfm87EPy/exRDMlpGFs9Y5qqRwFXX0FH9KAhMba3
	 X+XjUTeXgsnbeW/bJFeg4n4v/O2mH066N5R6A5NTdM0PM+FrFM4ousNMY0XjgEyGuX
	 Q+WW00IrtAhxA42tFePzdJl5uGOVOTJizb9keMPe9qvfdpaqSjPCbtjSaRqAP+hbtD
	 liJXvtkhl9KlA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 03 Jul 2024 16:51:36 +0300
Subject: [PATCH net-next v3 5/6] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers and setup defaults
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-am65-cpsw-multi-rx-v3-5-f11cd860fd72@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6077; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=mieV4TgwWxm0AsrERuGJpKmWHBNjYVtxE4w5wOIW3x0=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmhVdm6QGioFiUmmdnTHRBowkKtAJyxhbbH3H6i
 qrmoU0VoBOJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZoVXZgAKCRDSWmvTvnYw
 kw7iD/9tuZ/aKXDxk6HjMrH7TF7GOzW5smvF3Fxj58nqyHpe4rza1PnrVkuqj8HSFMK5spsydxa
 i5xMb7KxzfsnrpaHkUcWIEKuw3l7X1quiXqVr6D6E+XRV7QlsnLA4Mxxf4wpT5MuKk5FAsM/+VX
 fmzP4/bk+WwycNBvASWYqbRIe36nCVVxISfQ8HnXWSQiNFXjMZkRrROWdJE5DH2OThBXpTb9sbe
 AvuIvUDIiNc+z30C8gQo8z2nV4jCNx0w9qlsFIGoV9FjeQKl8O6QjnTQUv4X2iYHgMmhSk76jQx
 GV35/m5YzVUR9cQbmSYKaLu48sX+d4CJLnMEANCKTDrVgV8wT5En8JAAQ3TTJbB2r2dPPgOktoX
 OdVBbGWcnOmkyj9VoKYhwZ/7w9z7oxJaj6xLBae5u6qC2B3KoUkwhr/Ldj5nGNl2DI11Hikw7r9
 YflC1CSjXXZDJjeGyH7sLOR56rseRGTCwk1DPCTno47A7RAjsucGflrq6cpN1hK14sPX5w1FgR5
 eSuhc/sZRK0G4tTnlHd3CGj/Yr+hNZypd+T6r0iyToJiA2077Lw2eMJhh186yACB32tNakDhB+7
 0KVAl603ahXSQ4BsA1JCALd0E5sva6yKoiZ8sMkq8W8EL3Ssz5Bp2Z+9bh5+yBhI3j6bx8l8FKm
 RTA9CsTO/dOe6Vw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

The Policer registers in the ALE register space are just shadow registers
and use an index field in the policer table control register to read/write
to the actual Polier registers.
Add helper functions to Read and Write to Policer registers.

Also add a helper function to set the thread value to classifier/policer
mapping. Any packet that first matches the classifier will be sent to the
thread (flow) that is set in the classifier to thread mapping table.
If not set then it goes to the default flow.

Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
priorities to N receive threads (flows). N depends on number of
RX channels enabled for the port.
As per the standard [1] User prioritie 1 (Background) and 2 (Spare) have
lower priority than the user priority 0 (default). User priority 1 being
of the lowest priority.

[1] IEEE802.1D-2004, IEEE Standard for Local and metropolitan area networks
Table G-2 - Traffic type acronyms
Table G-3 - Defining traffic types

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changelog:
v3:
- squashed 2 patches into 1
- added comment explaining the default thread to priority mapping table
- typo fix "classifer"->"classifier"
---
 drivers/net/ethernet/ti/cpsw_ale.c | 94 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 6b64ec78d1b6..cf2958093fc8 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1627,3 +1627,97 @@ u32 cpsw_ale_get_num_entries(struct cpsw_ale *ale)
 {
 	return ale ? ale->params.ale_entries : 0;
 }
+
+/* Reads the specified policer index into ALE POLICER registers */
+static void cpsw_ale_policer_read_idx(struct cpsw_ale *ale, u32 idx)
+{
+	idx &= ALE_POLICER_TBL_INDEX_MASK;
+	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
+}
+
+/* Writes the ALE POLICER registers into the specified policer index */
+static void cpsw_ale_policer_write_idx(struct cpsw_ale *ale, u32 idx)
+{
+	idx &= ALE_POLICER_TBL_INDEX_MASK;
+	idx |= ALE_POLICER_TBL_WRITE_ENABLE;
+	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
+}
+
+/* enables/disables the custom thread value for the specified policer index */
+static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
+					       u32 thread_id, bool enable)
+{
+	regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
+	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
+	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
+}
+
+/* Disable all policer entries and thread mappings */
+static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
+{
+	int i;
+
+	for (i = 0; i < ale->params.num_policers ; i++) {
+		cpsw_ale_policer_read_idx(ale, i);
+		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
+		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
+		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
+		regmap_field_write(ale->fields[POL_DST_MEN], 0);
+		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
+		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
+		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
+		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
+		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
+		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
+		regmap_field_write(ale->fields[POL_EN], 0);
+		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
+		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
+		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
+
+		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
+	}
+}
+
+/* Default classifier is to map 8 user priorities to N receive channels */
+void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
+{
+	int pri, idx;
+	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
+	 *    Table G-2 - Traffic type acronyms
+	 *    Table G-3 - Defining traffic types
+	 * User priority values 1 and 2 effectively communicate a lower
+	 * priority than 0. In the below table 0 is assigned to higher priority
+	 * thread than 1 and 2 wherever possible.
+	 * The below table maps which thread the user priority needs to be
+	 * sent to for a given number of threads (RX channels). Upper threads
+	 * have higher priority.
+	 * e.g. if number of threads is 8 then user priority 0 will map to
+	 * pri_thread_map[8-1][0] i.e. thread 2
+	 */
+	int pri_thread_map[8][8] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
+					{ 0, 0, 0, 0, 1, 1, 1, 1, },
+					{ 0, 0, 0, 0, 1, 1, 2, 2, },
+					{ 1, 0, 0, 1, 2, 2, 3, 3, },
+					{ 1, 0, 0, 1, 2, 3, 4, 4, },
+					{ 1, 0, 0, 2, 3, 4, 5, 5, },
+					{ 1, 0, 0, 2, 3, 4, 5, 6, },
+					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
+
+	cpsw_ale_policer_reset(ale);
+
+	/* use first 8 classifiers to map 8 (DSCP/PCP) priorities to channels */
+	for (pri = 0; pri < 8; pri++) {
+		idx = pri;
+
+		/* Classifier 'idx' match on priority 'pri' */
+		cpsw_ale_policer_read_idx(ale, idx);
+		regmap_field_write(ale->fields[POL_PRI_VAL], pri);
+		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
+		cpsw_ale_policer_write_idx(ale, idx);
+
+		/* Map Classifier 'idx' to thread provided by the map */
+		cpsw_ale_policer_thread_idx_enable(ale, idx,
+						   pri_thread_map[num_rx_ch - 1][pri],
+						   1);
+	}
+}
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 2cb76acc6d16..1e4e9a3dd234 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -193,5 +193,6 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
+void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
 
 #endif

-- 
2.34.1


