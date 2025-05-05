Return-Path: <linux-omap+bounces-3648-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E154AA98E7
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92AC13BFB20
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B4B26FA7B;
	Mon,  5 May 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/MAOkKn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2226FA4C;
	Mon,  5 May 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462418; cv=none; b=e9pwC887b7Oj3eKtEnLEld3434xABZUV9uA9HvMr/5K0xu4euMEz1rBqIgK+19guoICqKduMajTXJesQgIhEMgrWhg+FEFPH91zJ17GDR+tY2tPHImzKzheFi0gq/h9fzD3z1CKgNkJlCrHjTUiT+ZOc/RfBk/Ys7uTg9opJgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462418; c=relaxed/simple;
	bh=yvDolz4DU7x4F3IPiMMAYL9Zyt+CPJcn+6QaEzC3KRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXcuLF1XTZ1OA4ITeIiyBmfibw2cm/tZHhXGkZ34ON/CJ8somv2dE4xVChPgyizJ6x4ARtDPxCqOGD+R58HpaWzcsMS47nQHScTTFKjC45J5L+F6SD1d7Y+F9S8meJUoAtYlmmdAra52e9M59gDs6boRIben2zA7bfvDdNnO09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/MAOkKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719A3C4CEEE;
	Mon,  5 May 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462418;
	bh=yvDolz4DU7x4F3IPiMMAYL9Zyt+CPJcn+6QaEzC3KRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V/MAOkKnjiopeNpR9BhSqWbvOdIrJQyGYYVmHA6ZqpIUtl9KPh4A8oWKO9AWk89yh
	 KEIec7XTE5laMY1a4w8faxr9XsL3eyUfXLZEzvJApTC+jeJmuJ6pxj54+VG/ppeZYU
	 W2F+vfJEUClKexCnfvcU4cE5VJXX9QwVgQocmI50Zry9VRO4dqb/wk4OPeMrGjwqCK
	 a4JynTW5Bk2sIS7EPGPSubneQDOv1jvZdnapsOZCDOoNS2azXmt1WaejMRQ4C6xt+r
	 Pfwdf7ojcaZikbBBdKqI8sNOX83LrBweSmULgTn6VSAEO/pup03Ev4CQoV+thLWUBB
	 lyTlfPbyMXvYg==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:36 +0300
Subject: [PATCH net-next v2 6/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_set/clr_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-6-5359ea025144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4792; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=yvDolz4DU7x4F3IPiMMAYL9Zyt+CPJcn+6QaEzC3KRo=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa7Gm21sYBhG1CpZRJf0DHMG87OOk7k+WGzR
 Y6C4ZXrxVGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmuwAKCRDSWmvTvnYw
 kwG2EADBvVqydLT3rg1z+ex9erQ19pF2wu8cGBNQmfJg7OJM14/Grj/DrtQYoUsO8w6d6wdFN3T
 ajjwDgdOyhfv3ZYvL3jeoKmz8uV1Q7UA6Zd6a6gpXwMlUO/OwUyDazvvVGjNScjPsW/txzU0Lfy
 iNMj29w7yeZGffQ200gdcDx0SaRnI4Y7KhKLY0O+XoXH+HdbcUg0NLXzFdEjEfpRI/TCG+Q6xfY
 ZOuht8LfM5xTjYh2HhqJrHPmG7CGrn11SWNp525SY+7f6R1eKt0CYOq+IT/FETMlLb2WUb9fv3S
 d1s0BBQdeR/dzn39bmWlg1SQAbhaEMYoa4U8y4jv2iCC8L+MxZedc8gMiG8l+qWA/RAbbfuMKeA
 T6wBS3m+rAwCTtPIWme/ZYbEfH/iV2whGdOE9JNUSxQh/nCaSKXCfAmF7wODoxtoER9EypgNhNb
 Ru3FEb7AO3ADk0EVo/NVRPTlCYScN27hW4oteLs87ZgF7jlL3KzYCyCemOy9FROmkCFtHQKFf+z
 tN//ychvL5Yuk44nBLsmkWkyFqBxECazLJ9IRNI3fjoic3/nVOkRt94OouVzZcRLk74TnKYcs9F
 GTY9/pld0+vpb/KQBpOH8iv0mq/6J6cylgftuxDvCK7CdawdKD9VVvtsdujjpd8BP5qGwqV8LDE
 LF0TW5x/4I+Q1fg==
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
index 49ea1c00be3d..ce216606d915 100644
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
index ce59fec75774..11d333bf5a52 100644
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


