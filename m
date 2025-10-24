Return-Path: <linux-omap+bounces-4760-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EA2C081F4
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FDA33A3485
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24CA2FE568;
	Fri, 24 Oct 2025 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ke711KnG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9D2FE06C;
	Fri, 24 Oct 2025 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338789; cv=none; b=ic//vvivBJUVlQz8nrhNYF1Wd0d4YLjKJ1hge77R5neatxMeT0Z7HLA2XTmpCWK6wchrPBMPwrfuNjL1/UWipGhY9nqCejdnyvZCQYKyLPjGnuMf0NvchmpgXaAhY296OKrLtDY0eoRV8OGubTT6fZK9u435rzM0+8cfR0w5DF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338789; c=relaxed/simple;
	bh=M/aUW5obACDgDZ0RhUKkgWsr4wrkfElDfJmYdGn2wh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/EmzdKIQSJ6LkdH8Kx7DpqSBiGEQOcYR5pTWDHBpa0UQvm18yx6YlgbBJFzS1WdkMRFvR1CJiq5WNfIXzBvupLqxrE0eTVxfVC+mnfqsWr4qbeWRiXda/FYKY+8EZtpK6oE0nFZYvpR/4iASezN+OFuc0JRqLeUI6T8PGc+AVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ke711KnG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78609C4CEF7;
	Fri, 24 Oct 2025 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338789;
	bh=M/aUW5obACDgDZ0RhUKkgWsr4wrkfElDfJmYdGn2wh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ke711KnGi5KDfP6dLjW/J6pQ1L/y837X/CW1jsT14tTrXcB3koUIro3yO0bjbv8Qp
	 6oZEglXXjWQzyFPg6WstOHqfHIRExOZdD6MTvnUn/8b+RbE91rgd+J0M22erYGWUjr
	 PL3P7KKNopDXyPVn+eHlL7kxUoJ390OEv29Mg46Q5epF37ZpoxxJNkmnnkRpd4CuKQ
	 C9qa2fU150XuBqhxmg8whQ+ykzcUt/sPtQ7inSDmBEEGq633cMs9e3/5qVdT5V4av8
	 iwinKxKpHh+9K/GXacDA1vNkcZZ890GREf4JUvNpB+snBkB1iKyHS3tqfDPE0fpH2u
	 RicR5OSfP9JEQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:05 +0300
Subject: [PATCH net-next v5 6/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_set/clr_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-6-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4904; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=M/aUW5obACDgDZ0RhUKkgWsr4wrkfElDfJmYdGn2wh4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOnBqmEJ4VGb9jmnRoYiAr+BPXSaKgyCaP3
 rdiN5ik+EyJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k0dJD/0Y9iU4F9RDQCQV/ZsBn3x1lTzx4Ctw/vcncyVTIjnF+Y+mrT373dOjGZIKafqYy7ppR/K
 3NJbm3gwYO9jPQ0Sbq9/7mSr2aZCnrrMdqpYrf86sYOY1paUd/8axCXwxvFfn1/Hct6tfXAsQm+
 r0qs9iXl5volIlfhCZm5Ng4z7vf1GvQzDg0hm/bTM5MY8l1J7DCCB7BNZBO7udzK9JTktFjVabC
 /SWe3xBYN04u9p43zHL4/4tXM9P2jeKH1xaFW0RL4fMFlLXrDbb0SNEPhWyWTHiBsRzPqJ+fhRZ
 j3T7abf0kXCP71F0uUs+7hDHmmt8nyuwgs5HTB5nBWtU44RVj3sJxApYerxNoJYV2ABPG/B2pch
 H27ShslweQqfTUxApZxta1iyCyJzF/qX+veW5PSBGQT0O237MJroqVN7B/uGJOSKhiGhglGtFHC
 Er5HfMqg5U6xSArpqsK0rdzfHrxRupdPs/Y6Zbq6vKVgMXDI8AKXCBlV8vOP09p7DF001eqvb9O
 9MfyQfWn0AxySf2czNUsGgSvjZgIfV0enQl+Z25oPIccyx22C4nwVaw2B5BTa/eJo7xUeFOvTkG
 /GvkffsM8blx0gUUFfwytmxs7YqIl/sOQWSxcMhqU3hEwdG8Du0N232+os7tCpQXl5xyg9E5a7Y
 DsUho/9ASgbwtMA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Add cpsw_ale_policer_set/clr_entry() helpers.
So far Raw Ethernet matching based on Source/Destination address
and VLAN Priority (PCP) is supported.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 77 ++++++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_ale.h | 28 ++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index e259662f38cb8ea780b8d42dde20a81fc88780ae..9641c3d688c768a227b557f7c1a31fe77c9a738b 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1746,3 +1746,80 @@ void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
 						   1);
 	}
 }
+
+#define HOST_PORT_NUM 0
+
+/* Clear Policer and associated ALE table entries */
+void cpsw_ale_policer_clr_entry(struct cpsw_ale *ale, u32 policer_idx,
+				struct cpsw_ale_policer_cfg *cfg)
+{
+	cpsw_ale_policer_reset_entry(ale, policer_idx);
+
+	/* We do not delete ALE entries that were added in set_entry
+	 * as they might still be in use by the port e.g. VLAN id
+	 * or port MAC address
+	 */
+
+	/* clear BLOCKED in case we set it */
+	if ((cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACSRC) && cfg->drop)
+		cpsw_ale_add_ucast(ale, cfg->src_addr, HOST_PORT_NUM, 0, 0);
+
+	if ((cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACDST) && cfg->drop)
+		cpsw_ale_add_ucast(ale, cfg->dst_addr, HOST_PORT_NUM, 0, 0);
+}
+
+int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
+			       struct cpsw_ale_policer_cfg *cfg)
+{
+	int ale_idx;
+	u16 ale_flags = cfg->drop ? ALE_BLOCKED : 0;
+
+	/* A single policer can support multiple match types simultaneously
+	 * There can be only one ALE entry per address
+	 */
+	cpsw_ale_policer_reset_entry(ale, policer_idx);
+	cpsw_ale_policer_read_idx(ale, policer_idx);
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACSRC) {
+		ale_idx = cpsw_ale_add_ucast(ale, cfg->src_addr, HOST_PORT_NUM,
+					     ale_flags, 0);
+		if (ale_idx < 0)
+			return -ENOENT;
+
+		/* update policer entry */
+		regmap_field_write(ale->fields[POL_SRC_INDEX], ale_idx);
+		regmap_field_write(ale->fields[POL_SRC_MEN], 1);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACDST) {
+		ale_idx = cpsw_ale_add_ucast(ale, cfg->dst_addr, HOST_PORT_NUM,
+					     ale_flags, 0);
+		if (ale_idx < 0)
+			return -ENOENT;
+
+		/* update policer entry */
+		regmap_field_write(ale->fields[POL_DST_INDEX], ale_idx);
+		regmap_field_write(ale->fields[POL_DST_MEN], 1);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_OVLAN) {
+		/* VLAN ID based flow routing not yet working,
+		 * only PCP matching for now
+		 */
+		if (cfg->vid > 0)
+			return -EINVAL;
+
+		regmap_field_write(ale->fields[POL_PRI_VAL], cfg->vlan_prio);
+		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
+	}
+
+	cpsw_ale_policer_write_idx(ale, policer_idx);
+
+	/* Map to thread id provided by the config */
+	if (!cfg->drop) {
+		cpsw_ale_policer_thread_idx_enable(ale, policer_idx,
+						   cfg->thread_id, true);
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index ce59fec757746ccd784a320b47cb7021da639325..11d333bf5a5280374573833050a4e3893d85dc28 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -159,6 +159,30 @@ enum cpsw_ale_port_state {
 /* Policer */
 #define CPSW_ALE_POLICER_ENTRY_WORDS	8
 
+/* Policer match flags */
+#define CPSW_ALE_POLICER_MATCH_PORT	BIT(0)
+#define CPSW_ALE_POLICER_MATCH_PRI	BIT(1)
+#define CPSW_ALE_POLICER_MATCH_OUI	BIT(2)
+#define CPSW_ALE_POLICER_MATCH_MACDST	BIT(3)
+#define CPSW_ALE_POLICER_MATCH_MACSRC	BIT(4)
+#define CPSW_ALE_POLICER_MATCH_OVLAN	BIT(5)
+#define CPSW_ALE_POLICER_MATCH_IVLAN	BIT(6)
+#define CPSW_ALE_POLICER_MATCH_ETHTYPE	BIT(7)
+#define CPSW_ALE_POLICER_MATCH_IPSRC	BIT(8)
+#define CPSW_ALE_POLICER_MATCH_IPDST	BIT(9)
+
+struct cpsw_ale_policer_cfg {
+	u32 match_flags;
+	u16 ether_type;
+	u16 vid;
+	u8 vlan_prio;
+	u8 src_addr[ETH_ALEN];
+	u8 dst_addr[ETH_ALEN];
+	bool drop;
+	u64 thread_id;
+	int port_id;
+};
+
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params);
 
 void cpsw_ale_start(struct cpsw_ale *ale);
@@ -199,5 +223,9 @@ void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
 void cpsw_ale_policer_reset(struct cpsw_ale *ale);
+int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
+			       struct cpsw_ale_policer_cfg *cfg);
+void cpsw_ale_policer_clr_entry(struct cpsw_ale *ale, u32 policer_idx,
+				struct cpsw_ale_policer_cfg *cfg);
 
 #endif

-- 
2.34.1


