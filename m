Return-Path: <linux-omap+bounces-1489-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 685948FE62F
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA562828C0
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68B7196C9C;
	Thu,  6 Jun 2024 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp6b3gF6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65702196450;
	Thu,  6 Jun 2024 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675810; cv=none; b=MHursesY3IW1Yy9TbzkJnPAttdDVY6hbr1KBrh76lBfhpxl1iU2Q2fn7C3H1sgZj3hUPC0RRvZCx8iyTY4yTXPDzvJunnQsIffUABAwnk8Bbx1CqzzUb76gIEz9RERk1P+2AGlRrfxt8IyjEpKdAuk0+36RR+ARNT9WeOYBf30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675810; c=relaxed/simple;
	bh=AzsUjVFmjg0jtjXbWRhvwodxTf4nMYSUuXUeIdNsGxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ8gtzlws4m89wxAD7sUWQx9l/+9P/f0+MY1EYz21L54yPEP2l1SfY3bv8SgND+bZYJ69ZltVFkXwbwQFyS2T5NvO6SLM5+bTkRWtRWJqxfWvhUAfP8wRdsMBsihQzDw2CNr6FPLi1KkyoU0hm/PgsbTgqjSOw0QmtSNtf8U1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp6b3gF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB1FC4AF0A;
	Thu,  6 Jun 2024 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675809;
	bh=AzsUjVFmjg0jtjXbWRhvwodxTf4nMYSUuXUeIdNsGxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tp6b3gF6mEA4ur7hK+0YGAbiOAi/t2sZfi7WWGhAd7riSyzYmarHjQZP5ASDwRAwf
	 htxn3DtldJuf8SB77k7npNJ5jxpEzSE/TuZkwQTw3mlu7C5brbcD7yGnz9dcugN0hk
	 bKYPb8W7QlePsb25RpBM1dyoXpBqbi/Mbvz8Y8tJH6/Oq+BP+QJYJP9XlvCN1uD/Fi
	 i4Qx4kyij1y7gXfGO0Ds8NEzzuosveYAJkNMs9Imc43qqlVpA1u4gucwOf5bn93DL3
	 WNYubJRWRStKugsE5ykzjQVp/wEd/8QIXuppr6yd25YljohgHnrf3GGd3URoEG1//m
	 C2TnDuyJtDWsQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:22 +0300
Subject: [PATCH RFC net-next 6/7] net: ethernet: ti: cpsw_ale: add helper
 to setup classifier defaults
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-6-0704b0cb6fdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3566; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=AzsUjVFmjg0jtjXbWRhvwodxTf4nMYSUuXUeIdNsGxA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacHiIGD97H8XcRVirr1TwGS3vqSQBNOshk8F
 IDwFdzdOP+JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnBwAKCRDSWmvTvnYw
 kwj0EACubtUr0bQcWYauEiLmM+z+70MGuPw2XXMH1Iws8q+A0MPIb0YlborDiEAXG7B9yqDcK1Y
 +/jc2NXB0lmi+bJnfHcIVXPcXQ7WirLxFyCg2IzLeRV1A2po1P/RoRGm/2Z+NpDgBaWJYmTktqs
 YIOsnmhXOaFHZf2XwxyrBPXQUbDtDVUTlfa9iJCe6LdSGqCwBzANtyTKZyOzjsHbOn4ohYGQzsE
 oke+M0zOpb2EGe/72LYXs8MaYSAggWqVyEBDiWuc9Zhh7BfZs88rVEIy6TYHva9tLfHzdNfgxvB
 gYDRYrJoY+tQZVXamfHVvIrjT2dwQFA2/wKBPUJ5krZ8fCsp1yjqU+WXrK2x5lxm1EIUdyBVApK
 Kh9om9RvoAr+UqU7hzO//kARsFe9VKDnecRkEeOnqkP7KBlc4kgrYNggjXvh1w84J1oFzfT+N3m
 xRuEU9qL5srbHfWMKC3Jh5RZSwtVkCmxGYhvrLUR8Qs8npvC0iAdT6v4a9d5wVkUkUwpHfEZqKN
 9LuSzn83xN7uL8VNsWVjHzvnzTrEZq1NqEu+9XI6I0DxOATZG4zQeRy/e+38bd/wJhbi+JEam/1
 qGEn462IEq6EJYL5UILthxsHyYTTAQEZ/FoHu34MgdGsBQG+rehPJDN12nDLDDxdJZuuk3Y/mgN
 KvJzPwI3h54B3Ew==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
priorities to N receive threads (flows). N depends on number of
RX channels enabled for the port.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 57 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h |  1 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 9f0a3b960f74..675d651bd647 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1650,3 +1650,60 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
 	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
 	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
 }
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
+/* Default classifer is to map 8 user priorities to N receive channels */
+void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
+{
+	int pri, idx;
+	int pri_thread_map[8][9] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
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
+						   pri_thread_map[num_rx_ch - 1][pri], 1);
+	}
+}
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index c697d2e3e586..c3ac6b9e94cf 100644
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


