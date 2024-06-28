Return-Path: <linux-omap+bounces-1617-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6A91BE1F
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A831F216FD
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4522715B0F9;
	Fri, 28 Jun 2024 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKyL6JM+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2F158869;
	Fri, 28 Jun 2024 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576146; cv=none; b=lNb5yiKNH02/0xPEyA2rkUEqmgq9QKEOhAvgvTNrZzqmrvpGWS0Af1na+J4+quwCLqikZ1zwDfZlaK07FFQOOSoh01JF0JvJvJLgHiQED91tNJcUTZBnlixPQ3AVkqLeBcWrh+91KyP2Vsx/Ee4YpofcBnqssWAjyfyu7qgq0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576146; c=relaxed/simple;
	bh=9e1IIdoq3zKz4bXr6Ah7y7i87LLSXX4VOZlTwPXFM+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrAxTgn9RlEqt/LJHxPX5kVR78p9S+/Cnbn76uljIwdZrcZk+z6frKNKsRwW/Lxje5MwSh4jGFA9ZuI6/hw7AgMKDZE6BFT2L55Sm5qzfn3oPmgjIxTnWwaC3/POjrWVu7WbigDj5GOdH5wGA+etojd8cxtjEhYS+wMGF8O16qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKyL6JM+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86412C32786;
	Fri, 28 Jun 2024 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576146;
	bh=9e1IIdoq3zKz4bXr6Ah7y7i87LLSXX4VOZlTwPXFM+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IKyL6JM+2J6hMySlzE0atG86WuPdhkBBd2GG89+0fyueDwVcjTrUNnSEdn1Q+Rtb2
	 wkIjJ/l0jDH+8molaGylP8D/vAztyT/CqZIRNEPwYt8MBuru3euvKsf5Ab3E2AHFMd
	 GvmUeeIfLf6/en+Bf75HmNKDqZYqNNyuB6P5nOb+Aspto8wjGLi8vR/tKucl4Q4dES
	 TcryvgOfFWH23pRMXNVWrIs6W9kBVAyLZ1hNd7CqQ9CrP7d38TLSzmGQKzQaLjYngF
	 mi1FkZikdNfBvx5sYcm3DP8gWfab/ki3YW3Qi3J6+vK44dTM4nWgaqwHcmVZ6+lolf
	 FVWYegks+Lp3A==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:55 +0300
Subject: [PATCH net-next v2 6/7] net: ethernet: ti: cpsw_ale: add helper to
 setup classifier defaults
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-6-c399cb77db56@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3566; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=9e1IIdoq3zKz4bXr6Ah7y7i87LLSXX4VOZlTwPXFM+4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4wUYJr7lqP7I+5xyKhlnkdOjpvrQ80p8EL
 PyiJ6lKI0qJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 k3LlD/9Plman1i97ZmmF/2NZNmhJIfRT6nc/Aa4dDdZPE6b6YtalFqGFrbXmYT5YYEDl0sUnlwf
 wWxD4l71XnkZm0Cn+VL+cuBvV2kBzxZPDRxsppCkXOWF9v/+WuzmTrhjM4GklNzdBsuvCZYbi75
 C1HlEOp0cg3upfJ4fB5EmVCGOufwz9YuexxYKM0FN7m4vviBGYnorDEA3o8Tay0XwD5y4br9UAa
 ytYQin0bsTmXwucVWirLr12NVRXIQ8H1S53824W+c3FzNq0a0lqM5wvYLD+S9iWMhaG2UZCkyRc
 Livbm9gNo0FGY9EDxzLAcINNK6VnRK9PiG8zzpbfexqY3+cb5lJYY3tQwiLvZ48s11pHbid//t/
 0CgoYOU4rf/0IwQHp9Xsc9jdFaNja2W4vdMNsVFAwWRvDPSfEN3XTW026xsi3cEloEq1eYgvJ33
 3ssInuBqw4/rhObS3fI7Y9ML53aEbOCb/9BDAiedLD7ogO8d3OLC+BOJLAwpo4nLI+NHcm9qr5n
 Ejt1CexYUeDQNLhzJYliSfCdY8qzMBoZl1r/qVMcJQkuzAgCJTYEksoh1owCL2NMHYhBg+J96V/
 VmWb22zCOyUI93AmLJmcZiWC0SstMU97EAjzAYRPEWNqKPREVKQaDWtnckL0efz6s/l+pMHGvTj
 4lKXObaEsO68I1w==
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
index 75a17184d34c..51da527388df 100644
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


