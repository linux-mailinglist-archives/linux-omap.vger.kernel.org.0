Return-Path: <linux-omap+bounces-4762-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E35C081CA
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D1564F1A5E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB512FF646;
	Fri, 24 Oct 2025 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kO8zpcqX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D972FB61F;
	Fri, 24 Oct 2025 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338796; cv=none; b=jxN4CJt1YLNfraXfJr2xs+dei2mHebhUYW+oQKaYg4J8HGgMKC+HQqpzd57gSHD1A0Zp6RFNPkPMi3P/tgbQzgxsE4BTnMAqOdTT7SYs002MFpwuFNeGqoGZ4/sJpgYoSGTDNm6RDFsbEaeaOQclM8rniIyq/ynT4A3YdaNMKk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338796; c=relaxed/simple;
	bh=kXiuxMiFWV7mI53KfvjpKzguuc2BNbV1HpqLHCAIPxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLmzoGDWTjhYyRKwRGujgpKz2qc19YXcVr+jPEJhikxHYuLdD0RpqecK8nxV4VDUtBw3RQYcIsxfBIkp2L7TlpcF9nsjAPTyoiKakdVvJkZnngEp726rCJqFpa4BkVANZx0H1v+MurZ0dpK+WP/N0H1KFDmMKtl3GO8nXLoN0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kO8zpcqX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD988C4CEF7;
	Fri, 24 Oct 2025 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338795;
	bh=kXiuxMiFWV7mI53KfvjpKzguuc2BNbV1HpqLHCAIPxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kO8zpcqXyBDngV8s/ypFbXAKhOBBzq9YW9pgyGOaxpfXobp4F32I3cybJZXRzWsiQ
	 9AdqIaOHUIfq30dUxWYrqGEeQ03RTXTbRFIXuzhOpDukLOGyLbQb6YRtUmW/gc0Dqb
	 4qtYgW7uuNHFxkRXvEDsvY89LhyUrvhbhtINSmP4g/6MGw30Fey+Vtz42KUUDwukXC
	 251yi2IkWIvwBp1RxnmTMQ3QZCKs/WOMiCCAv+meAmbCGKWhyv8S9t1v6g4bLcq7dH
	 tfGkmE5f/fZL0CSLeMWksmCqAQXzkERpxN7s4WzIoY0DmMSnu9TRGHzVIbYjBu0/WB
	 QZdsqAhd6qxyw==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:07 +0300
Subject: [PATCH net-next v5 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-8-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15492; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=kXiuxMiFWV7mI53KfvjpKzguuc2BNbV1HpqLHCAIPxA=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOlfARKClTZ+5k6uHQtEDVN5mlrWKtpTVqF
 33DchcAxwCJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 kyJLEACs72esq9Itcv7QR5eV8bsO+4rexV1TI/u5w2MXdQi9by5xgysMfdYsKmYS7tcr3dv0wgq
 +C7NviPyUsjvF0qlafAuV+nohNE97Ipz/KyuZfXClo4LM3B0DYDKo/0X0QSoUkha9nZFfwhvw7X
 xkHsS4te/rua/ZtM0P9oQIl53ck9MzuTnqewVRpGcRSjPfZEFH3hUgkEjVZRMIsNxrL9CrbHGzG
 OILnS+UzustFYShQoMCHEV2hR36lTAEblyFiWoA+3zMrbEJ22ywTUPL9Vlz2RrCg4yQkOh4g42d
 tEpUUdJyxhEsvu7tug1+KOAvEbZ8ikNA9CpOPZLuN49K18U1jbW2Y4zTI7s9Ui5l1aWBJTO6oyi
 ufl+4LZpqv7iWDZQszm4UWa3yUtgO3/BuWW3wA+FtWenkTFxEtT1Tk0eCpqfDr6JTJKEDVCxvxo
 G6E+Jgm14x/nHvccsvpnKS8P7eYU8PDUgN2G5oLMkeL2GiHfpb++rtjG3MW93IiKoFDCUIC64I4
 PXRsfY6kFxKCWAIEl7sTp3xqdc1uAdRG9HtgOfM8YpaF0N5kT/jkE+J4ZpWuM+M3KxVC2YSS94h
 AQEAwpefDlUIrSdguuAQ978lfZFW3qdqrs0HLUvB7BVc7e69e/pYGy+Xtrwi5CGf45HYoH2Vaa9
 ZdJwgQTux3IcE0A==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Adds support for -N/--config-nfc ethtool command for
configuring RX classfiers.

Currently only raw Ethernet (flow-type ether) matching is added
based on source/destination addresses and VLAN Priority (PCP).

The ALE policer engine is used to perform the matching and routing to
a specific RX channel.

The TRM doesn't mention much about order of evaluation of the
classifier rules, however, it does mention

[1] "if multiple classifier matches occur, the highest match
with thread enable bit set will be used."

[2] "If multiple classifier matches occur, the highest matching
entry with a thread enable bit set will be used."

Based on this information and tests it was found out that on
multiple classifier matches the higher indexed classifier is used.

[1] 12.3.1.4.6.1.12.3.1 Classifier to CPPI Transmit Flow ID Mapping
[2] 12.3.1.4.6.1.12.2 Classifier to Host Thread Mapping
in AM62x TRM https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c | 395 ++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    |   3 +
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  16 ++
 3 files changed, 414 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index c57497074ae60d88b4f5944d3386bfc3a987ce95..6de1c3b8c86d86ebeb83b1b94d29338f909aa967 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
@@ -973,6 +973,399 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
 	return am65_cpsw_set_per_queue_coalesce(ndev, 0, coal);
 }
 
+#define AM65_CPSW_FLOW_TYPE(f) ((f) & ~(FLOW_EXT | FLOW_MAC_EXT))
+
+/* rxnfc_lock must be held */
+static struct am65_cpsw_rxnfc_rule *am65_cpsw_get_rule(struct am65_cpsw_port *port,
+						       int location)
+{
+	struct am65_cpsw_rxnfc_rule *rule;
+
+	list_for_each_entry(rule, &port->rxnfc_rules, list) {
+		if (rule->location == location)
+			return rule;
+	}
+
+	return NULL;
+}
+
+/* rxnfc_lock must be held */
+static void am65_cpsw_del_rule(struct am65_cpsw_port *port,
+			       struct am65_cpsw_rxnfc_rule *rule)
+{
+	int loc;
+
+	/* reverse location as higher locations have higher priority
+	 * but ethtool expects lower locations to have higher priority
+	 */
+	loc = port->rxnfc_max - rule->location - 1;
+
+	cpsw_ale_policer_clr_entry(port->common->ale, loc,
+				   &rule->cfg);
+	list_del(&rule->list);
+	port->rxnfc_count--;
+	port->policer_in_use_bitmask &= ~BIT(rule->location);
+	kfree(rule);
+}
+
+/* rxnfc_lock must be held */
+static int am65_cpsw_add_rule(struct am65_cpsw_port *port,
+			      struct am65_cpsw_rxnfc_rule *rule)
+{
+	struct am65_cpsw_rxnfc_rule *prev = NULL, *cur;
+	int ret, loc;
+
+	/* reverse location as higher locations have higher priority
+	 * but ethtool expects lower locations to have higher priority
+	 */
+	loc = port->rxnfc_max - rule->location - 1;
+
+	ret = cpsw_ale_policer_set_entry(port->common->ale, loc,
+					 &rule->cfg);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(cur, &port->rxnfc_rules, list) {
+		if (cur->location >= rule->location)
+			break;
+		prev = cur;
+	}
+
+	list_add(&rule->list, prev ? &prev->list : &port->rxnfc_rules);
+	port->rxnfc_count++;
+	port->policer_in_use_bitmask |= BIT(rule->location);
+
+	return 0;
+}
+
+#define ETHER_TYPE_FULL_MASK cpu_to_be16(FIELD_MAX(U16_MAX))
+#define VLAN_TCI_FULL_MASK ETHER_TYPE_FULL_MASK
+
+static int am65_cpsw_rxnfc_get_rule(struct am65_cpsw_port *port,
+				    struct ethtool_rxnfc *rxnfc)
+{
+	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
+	struct am65_cpsw_rxnfc_rule *rule;
+	struct cpsw_ale_policer_cfg *cfg;
+
+	mutex_lock(&port->rxnfc_lock);
+	rule = am65_cpsw_get_rule(port, fs->location);
+	if (!rule) {
+		mutex_unlock(&port->rxnfc_lock);
+		return -ENOENT;
+	}
+
+	cfg = &rule->cfg;
+
+	/* build flowspec from policer_cfg */
+	fs->flow_type = ETHER_FLOW;
+	fs->ring_cookie = cfg->thread_id;
+
+	/* clear all masks. Seems to be inverted */
+	eth_broadcast_addr(fs->m_u.ether_spec.h_dest);
+	eth_broadcast_addr(fs->m_u.ether_spec.h_source);
+	fs->m_u.ether_spec.h_proto = ETHER_TYPE_FULL_MASK;
+	fs->m_ext.vlan_tci = htons(0xFFFF);
+	fs->m_ext.vlan_etype = ETHER_TYPE_FULL_MASK;
+	fs->m_ext.data[0] = cpu_to_be32(FIELD_MAX(U32_MAX));
+	fs->m_ext.data[1] = cpu_to_be32(FIELD_MAX(U32_MAX));
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACDST) {
+		ether_addr_copy(fs->h_u.ether_spec.h_dest,
+				cfg->dst_addr);
+		eth_zero_addr(fs->m_u.ether_spec.h_dest);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_MACSRC) {
+		ether_addr_copy(fs->h_u.ether_spec.h_source,
+				cfg->src_addr);
+		eth_zero_addr(fs->m_u.ether_spec.h_source);
+	}
+
+	if (cfg->match_flags & CPSW_ALE_POLICER_MATCH_OVLAN) {
+		fs->flow_type |= FLOW_EXT;
+		fs->h_ext.vlan_tci = htons(FIELD_PREP(VLAN_VID_MASK, cfg->vid)
+					   | FIELD_PREP(VLAN_PRIO_MASK, cfg->vlan_prio));
+		fs->m_ext.vlan_tci = 0;
+	}
+
+	mutex_unlock(&port->rxnfc_lock);
+
+	return 0;
+}
+
+static int am65_cpsw_rxnfc_get_all(struct am65_cpsw_port *port,
+				   struct ethtool_rxnfc *rxnfc,
+				   u32 *rule_locs)
+{
+	struct am65_cpsw_rxnfc_rule *rule;
+	int count = 0;
+
+	rxnfc->data = port->rxnfc_max;
+	mutex_lock(&port->rxnfc_lock);
+
+	list_for_each_entry(rule, &port->rxnfc_rules, list) {
+		if (count == rxnfc->rule_cnt) {
+			mutex_unlock(&port->rxnfc_lock);
+			return -EMSGSIZE;
+		}
+
+		rule_locs[count] = rule->location;
+		count++;
+	}
+
+	mutex_unlock(&port->rxnfc_lock);
+	rxnfc->rule_cnt = count;
+
+	return 0;
+}
+
+static int am65_cpsw_get_rxnfc(struct net_device *ndev,
+			       struct ethtool_rxnfc *rxnfc,
+			       u32 *rule_locs)
+{
+	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = common->rx_ch_num_flows;
+		return 0;
+	case ETHTOOL_GRXCLSRLCNT: /* Get RX classification rule count */
+		rxnfc->rule_cnt = port->rxnfc_count;
+		rxnfc->data = port->rxnfc_max;
+		rxnfc->data |= RX_CLS_LOC_SPECIAL;
+		return 0;
+	case ETHTOOL_GRXCLSRULE: /* Get RX classification rule */
+		return am65_cpsw_rxnfc_get_rule(port, rxnfc);
+	case ETHTOOL_GRXCLSRLALL: /* Get all RX classification rules */
+		return am65_cpsw_rxnfc_get_all(port, rxnfc, rule_locs);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* validate the rxnfc rule and convert it to policer config */
+static int am65_cpsw_rxnfc_validate(struct am65_cpsw_port *port,
+				    struct ethtool_rxnfc *rxnfc,
+				    struct cpsw_ale_policer_cfg *cfg)
+{
+	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
+	struct ethhdr *eth_mask;
+	int flow_type;
+
+	flow_type = AM65_CPSW_FLOW_TYPE(fs->flow_type);
+	memset(cfg, 0, sizeof(*cfg));
+
+	if (flow_type & FLOW_RSS)
+		return -EINVAL;
+
+	if (fs->location != RX_CLS_LOC_ANY &&
+	    fs->location >= port->rxnfc_max)
+		return -EINVAL;
+
+	if (fs->ring_cookie == RX_CLS_FLOW_DISC)
+		cfg->drop = true;
+	else if (fs->ring_cookie > AM65_CPSW_MAX_QUEUES)
+		return -EINVAL;
+
+	cfg->port_id = port->port_id;
+	cfg->thread_id = fs->ring_cookie;
+
+	switch (flow_type) {
+	case ETHER_FLOW:
+		eth_mask = &fs->m_u.ether_spec;
+
+		/* etherType matching is supported by h/w but not yet here */
+		if (eth_mask->h_proto)
+			return -EINVAL;
+
+		/* Only support source matching addresses by full mask */
+		if (is_broadcast_ether_addr(eth_mask->h_source)) {
+			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACSRC;
+			ether_addr_copy(cfg->src_addr,
+					fs->h_u.ether_spec.h_source);
+		}
+
+		/* Only support destination matching addresses by full mask */
+		if (is_broadcast_ether_addr(eth_mask->h_dest)) {
+			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACDST;
+			ether_addr_copy(cfg->dst_addr,
+					fs->h_u.ether_spec.h_dest);
+		}
+
+		if ((fs->flow_type & FLOW_EXT) && fs->m_ext.vlan_tci) {
+			/* Don't yet support vlan ethertype */
+			if (fs->m_ext.vlan_etype)
+				return -EINVAL;
+
+			if (fs->m_ext.vlan_tci != VLAN_TCI_FULL_MASK)
+				return -EINVAL;
+
+			cfg->vid = FIELD_GET(VLAN_VID_MASK,
+					     ntohs(fs->h_ext.vlan_tci));
+			cfg->vlan_prio = FIELD_GET(VLAN_PRIO_MASK,
+						   ntohs(fs->h_ext.vlan_tci));
+			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_OVLAN;
+		}
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* rxnfc_lock must be held */
+static int am65_cpsw_policer_find_match(struct am65_cpsw_port *port,
+					struct cpsw_ale_policer_cfg *cfg)
+{
+	struct am65_cpsw_rxnfc_rule *rule;
+	int loc = -EINVAL;
+
+	list_for_each_entry(rule, &port->rxnfc_rules, list) {
+		if (!memcmp(&rule->cfg, cfg, sizeof(*cfg))) {
+			loc = rule->location;
+			break;
+		}
+	}
+
+	mutex_unlock(&port->rxnfc_lock);
+
+	return loc;
+}
+
+static int am65_cpsw_policer_find_free_location(struct am65_cpsw_port *port)
+{
+	int loc;
+
+	for (loc = 0; loc <= port->rxnfc_max; loc++) {
+		if (!(BIT(loc) & port->policer_in_use_bitmask))
+			return loc;
+	}
+
+	return -ENOMEM;
+}
+
+static int am65_cpsw_rxnfc_add_rule(struct am65_cpsw_port *port,
+				    struct ethtool_rxnfc *rxnfc)
+{
+	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
+	struct am65_cpsw_rxnfc_rule *rule;
+	struct cpsw_ale_policer_cfg cfg;
+	int location, ret;
+
+	if (am65_cpsw_rxnfc_validate(port, rxnfc, &cfg))
+		return -EINVAL;
+
+	/* need to check if similar rule is already present at another location,
+	 * if yes error out
+	 */
+	mutex_lock(&port->rxnfc_lock);
+	location = am65_cpsw_policer_find_match(port, &cfg);
+	if (location >= 0) {
+		netdev_info(port->ndev,
+			    "same rule already exists in location %d. not adding\n",
+			    location);
+		mutex_unlock(&port->rxnfc_lock);
+		return -EINVAL;
+	}
+
+	if (fs->location == RX_CLS_LOC_ANY) {
+		fs->location = am65_cpsw_policer_find_free_location(port);
+		if (fs->location < 0) {
+			netdev_info(port->ndev,
+				    "no free location found in rule table\n");
+			mutex_unlock(&port->rxnfc_lock);
+			return -ENOMEM;
+		}
+	} else {
+		if (BIT(fs->location) & port->policer_in_use_bitmask) {
+			netdev_info(port->ndev,
+				    "another rule exists in location %d. not adding\n",
+				    fs->location);
+			mutex_unlock(&port->rxnfc_lock);
+			return -EINVAL;
+		}
+	}
+
+	rule = kzalloc(sizeof(*rule), GFP_KERNEL);
+	if (!rule) {
+		mutex_unlock(&port->rxnfc_lock);
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&rule->list);
+	memcpy(&rule->cfg, &cfg, sizeof(cfg));
+	rule->location = fs->location;
+	ret = am65_cpsw_add_rule(port, rule);
+	if (ret)
+		kfree(rule);
+
+	mutex_unlock(&port->rxnfc_lock);
+	return ret;
+}
+
+static int am65_cpsw_rxnfc_del_rule(struct am65_cpsw_port *port,
+				    struct ethtool_rxnfc *rxnfc)
+{
+	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
+	struct am65_cpsw_rxnfc_rule *rule;
+
+	mutex_lock(&port->rxnfc_lock);
+	rule = am65_cpsw_get_rule(port, fs->location);
+	if (!rule) {
+		mutex_unlock(&port->rxnfc_lock);
+		return -ENOENT;
+	}
+
+	am65_cpsw_del_rule(port, rule);
+	/* rule freed in am65_cpsw_del_rule() */
+	mutex_unlock(&port->rxnfc_lock);
+
+	return 0;
+}
+
+void am65_cpsw_rxnfc_init(struct am65_cpsw_port *port)
+{
+	struct cpsw_ale *ale = port->common->ale;
+
+	mutex_init(&port->rxnfc_lock);
+	INIT_LIST_HEAD(&port->rxnfc_rules);
+	port->rxnfc_max = ale->params.num_policers;
+
+	/* disable all rules */
+	cpsw_ale_policer_reset(ale);
+}
+
+void am65_cpsw_rxnfc_cleanup(struct am65_cpsw_port *port)
+{
+	struct am65_cpsw_rxnfc_rule *rule, *tmp;
+
+	mutex_lock(&port->rxnfc_lock);
+
+	list_for_each_entry_safe(rule, tmp, &port->rxnfc_rules, list)
+		am65_cpsw_del_rule(port, rule);
+
+	mutex_unlock(&port->rxnfc_lock);
+}
+
+static int am65_cpsw_set_rxnfc(struct net_device *ndev,
+			       struct ethtool_rxnfc *rxnfc)
+{
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_SRXCLSRLINS:
+		return am65_cpsw_rxnfc_add_rule(port, rxnfc);
+	case ETHTOOL_SRXCLSRLDEL:
+		return am65_cpsw_rxnfc_del_rule(port, rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 const struct ethtool_ops am65_cpsw_ethtool_ops_slave = {
 	.begin			= am65_cpsw_ethtool_op_begin,
 	.complete		= am65_cpsw_ethtool_op_complete,
@@ -1010,4 +1403,6 @@ const struct ethtool_ops am65_cpsw_ethtool_ops_slave = {
 	.get_mm			= am65_cpsw_get_mm,
 	.set_mm			= am65_cpsw_set_mm,
 	.get_mm_stats		= am65_cpsw_get_mm_stats,
+	.get_rxnfc		= am65_cpsw_get_rxnfc,
+	.set_rxnfc		= am65_cpsw_set_rxnfc,
 };
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 93ff139966ea0e26d3cd44a2f6eb7f9cbd2611d5..1466cf5706c911ede9e03d53f58af83c24a66544 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2778,6 +2778,7 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 		return -ENOMEM;
 	}
 
+	am65_cpsw_rxnfc_init(port);
 	ndev_priv = netdev_priv(port->ndev);
 	ndev_priv->port = port;
 	ndev_priv->msg_enable = AM65_CPSW_DEBUG;
@@ -2890,6 +2891,7 @@ static void am65_cpsw_nuss_cleanup_ndev(struct am65_cpsw_common *common)
 			unregister_netdev(port->ndev);
 		free_netdev(port->ndev);
 		port->ndev = NULL;
+		am65_cpsw_rxnfc_cleanup(port);
 	}
 }
 
@@ -3192,6 +3194,7 @@ static int am65_cpsw_dl_switch_mode_set(struct devlink *dl, u32 id,
 	/* clean up ALE table */
 	cpsw_ale_control_set(cpsw->ale, HOST_PORT_NUM, ALE_CLEAR, 1);
 	cpsw_ale_control_get(cpsw->ale, HOST_PORT_NUM, ALE_AGEOUT);
+	cpsw_ale_policer_reset(cpsw->ale);
 
 	if (switch_en) {
 		dev_info(cpsw->dev, "Enable switch mode\n");
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 61daa5db12e631588eba71351ba3bc0139456bf5..320da76cfbac0cbc878859ca78c651c5c54db83a 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -16,6 +16,7 @@
 #include <net/devlink.h>
 #include <net/xdp.h>
 #include "am65-cpsw-qos.h"
+#include "cpsw_ale.h"
 
 struct am65_cpts;
 
@@ -40,6 +41,12 @@ struct am65_cpsw_slave_data {
 	struct phylink_config		phylink_config;
 };
 
+struct am65_cpsw_rxnfc_rule {
+	struct list_head list;
+	unsigned int location;
+	struct cpsw_ale_policer_cfg cfg;
+};
+
 struct am65_cpsw_port {
 	struct am65_cpsw_common		*common;
 	struct net_device		*ndev;
@@ -59,6 +66,12 @@ struct am65_cpsw_port {
 	struct xdp_rxq_info		xdp_rxq[AM65_CPSW_MAX_QUEUES];
 	/* Only for suspend resume context */
 	u32				vid_context;
+	/* Classifier flows */
+	struct mutex rxnfc_lock;
+	struct list_head rxnfc_rules;
+	int rxnfc_count;
+	int rxnfc_max;
+	u64 policer_in_use_bitmask;
 };
 
 enum am65_cpsw_tx_buf_type {
@@ -229,4 +242,7 @@ int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common,
 
 bool am65_cpsw_port_dev_check(const struct net_device *dev);
 
+void am65_cpsw_rxnfc_init(struct am65_cpsw_port *port);
+void am65_cpsw_rxnfc_cleanup(struct am65_cpsw_port *port);
+
 #endif /* AM65_CPSW_NUSS_H_ */

-- 
2.34.1


