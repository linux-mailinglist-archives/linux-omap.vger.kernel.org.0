Return-Path: <linux-omap+bounces-3720-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D87AB6B02
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D3F1890F41
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2627E1CA;
	Wed, 14 May 2025 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iddsvVmo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183127D76A;
	Wed, 14 May 2025 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224295; cv=none; b=NT7Cp2xqv76Q19KbKVlkYqrZ+LmDAl5KxToAgNFqjkdkvsc4Nn8m4oD2ri3SUW76W/uBiAFtKz1fZbNn5XBGqLs7thhWEa9iejcbbzq5rgFQSXoxfhY8xaGUSsxLgof5CMXsevCRkz22LZbDnNDRNIZb3t4SLgQaFzb9gcOt3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224295; c=relaxed/simple;
	bh=ETc3C9Ve09FV4dP091Lg8o78pkW+mExFHoB0dZG+riU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPPcKEo4kOC5F2WPMaVpi5hfKnvCD0cP6VuQP1uR7qcTPmhCob4HvlRlAPwyZVYoV161fGp3PZXBFr4EelcIxsHzhSYkrl4O4hhprePZ0MzOr5OhpjDLMcrano0QQQytwFf72uajZIQizGEk8eHo72VkrO1DdM/b7rXANWzQn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iddsvVmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DD5C4CEEF;
	Wed, 14 May 2025 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224295;
	bh=ETc3C9Ve09FV4dP091Lg8o78pkW+mExFHoB0dZG+riU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iddsvVmoyY/3haV6OfNat2tfVWR8PhfY/oH5mQvaYH/KNqZk2zESl0mv11Q7JlJp9
	 Vf17OJeitN8t0jtnUwKSuH6Iehkbj3EoH+lQqmNhmFv/yMmFiqSkZnbuyE8S6wLsEQ
	 SSgNvCPd9ltT+56JaVROW9C0/4rxEszsZWYVk0shyqV8OJDw4uh1Nxqmao6f/IX0+q
	 YoroTcur+x+WtPbjv/R+UdhS7utv/1+JCjMoeTQ32Fz5CrNmFatlg3V+SYY6LQd/Ej
	 KcUcQZvSNkcSim9wGv0RJRPAMTgVS93QVrdUPkQWLoaoIrv9R082KEeI8SBR89e+54
	 fM86dx4oIk+/g==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:28 +0300
Subject: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13820; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=ETc3C9Ve09FV4dP091Lg8o78pkW+mExFHoB0dZG+riU=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbJh54Ue3Un7nlqhUQ2aNzJS2ui5xSf6h8Rz
 9fzW+DczL6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyQAKCRDSWmvTvnYw
 k1idD/wKpoCVnLFIUq0jW6JbG5JolAR/vh+F1GQ4T4mKdlaBb9Xs1YGX/XabiE+reW/4asQQ/Uc
 joGZTe4spef3+zUqUSAmAD5I8OMPXDjrGNR+DuBvmYDVw9ogBNoM0uvoNdpxKlCPu1kR5N4Ov9l
 a3HUydMMyiXNZ0EVC848YcqmloASuTf0+wClefpFtQ4tUYC1K3KI46HpvDHvl/kWRbselXjihAP
 Aw/o3S9baL8mbjMS/WAg82mGb5WPBoXXxiTsfQNOFmWPlkwk5TXSUYHDAMA4JzvMEi2pezOTdoT
 e9Cb+bntbxxoMp0k1+OB8BZDtAhu0WYlHwA37U5rhsZdowPadGJuZAZFAdFmfwP5S/d1bL98rOS
 U597LGxXs5JtYO0yngELpn3rF/Q8PWAKVnaKA5bdl4FuAfQKsV5EtXmFbFXaAsS5nlf0AnjCFG+
 5y70gmSODqQx0xua9FbZ3Yrx8h31HHL/NEOiojLoSUcgdimQKrkVbd339E5LzzRs4ftQXTsg4IT
 afgRS94hvn9tMzmORGfwrITd32/Y0n2kgf+ZjjKn6542WAQeBorG+1xdqCIwXHMVo/9YM7Eb6jy
 j9rU2RhZwALmuAkfD0kzcuMhEBxLQc5QAcPyz4MsbkHdzV19+0vF8zj9sQWQIqhFHWIptuh3uzQ
 BG9tMPQxH0ZyLJw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Adds support for -N/--config-nfc ethtool command for
configuring RX classfiers.

Currently only raw Ethernet (flow-type ether) matching is added
based on source/destination addresses and VLAN Priority (PCP).

The ALE policer engine is used to perform the matching and routing to
a specific RX channel.

The TRM doesn't mention anything about order of evaluation of the
classifier rules however it does mention in [1]
"if multiple classifier matches occur, the highest match
with thread enable bit set will be used."

[1] 3.1.4.6.1.12.3.1 Classifier to CPPI Transmit Flow ID Mapping
in AM62x TRM https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c | 357 ++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    |   3 +
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  15 ++
 3 files changed, 375 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index 9032444435e9..41f4baf06507 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
@@ -970,6 +970,361 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
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
+	cpsw_ale_policer_clr_entry(port->common->ale, rule->location,
+				   &rule->cfg);
+	list_del(&rule->list);
+	port->rxnfc_count--;
+	kfree(rule);
+}
+
+/* rxnfc_lock must be held */
+static int am65_cpsw_add_rule(struct am65_cpsw_port *port,
+			      struct am65_cpsw_rxnfc_rule *rule)
+{
+	struct am65_cpsw_rxnfc_rule *prev = NULL, *cur;
+	int ret;
+
+	ret = cpsw_ale_policer_set_entry(port->common->ale, rule->location,
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
+	if (fs->location == RX_CLS_LOC_ANY ||
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
+static int am65_cpsw_rxnfc_add_rule(struct am65_cpsw_port *port,
+				    struct ethtool_rxnfc *rxnfc)
+{
+	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
+	struct am65_cpsw_rxnfc_rule *rule;
+	struct cpsw_ale_policer_cfg cfg;
+	int loc, ret;
+
+	if (am65_cpsw_rxnfc_validate(port, rxnfc, &cfg))
+		return -EINVAL;
+
+	/* need to check if similar rule is already present at another location,
+	 * if yes error out
+	 */
+	mutex_lock(&port->rxnfc_lock);
+	loc = am65_cpsw_policer_find_match(port, &cfg);
+	if (loc >= 0 && loc != fs->location) {
+		netdev_info(port->ndev,
+			    "rule already exists in location %d. not adding\n",
+			    loc);
+		mutex_unlock(&port->rxnfc_lock);
+		return -EINVAL;
+	}
+
+	/* delete exisiting rule */
+	if (loc >= 0) {
+		rule = am65_cpsw_get_rule(port, loc);
+		if (rule)
+			am65_cpsw_del_rule(port, rule);
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
+	mutex_unlock(&port->rxnfc_lock);
+
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
@@ -1007,4 +1362,6 @@ const struct ethtool_ops am65_cpsw_ethtool_ops_slave = {
 	.get_mm			= am65_cpsw_get_mm,
 	.set_mm			= am65_cpsw_set_mm,
 	.get_mm_stats		= am65_cpsw_get_mm_stats,
+	.get_rxnfc		= am65_cpsw_get_rxnfc,
+	.set_rxnfc		= am65_cpsw_set_rxnfc,
 };
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 07df61f343d3..cdb83ae54656 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2758,6 +2758,7 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 		return -ENOMEM;
 	}
 
+	am65_cpsw_rxnfc_init(port);
 	ndev_priv = netdev_priv(port->ndev);
 	ndev_priv->port = port;
 	ndev_priv->msg_enable = AM65_CPSW_DEBUG;
@@ -2870,6 +2871,7 @@ static void am65_cpsw_nuss_cleanup_ndev(struct am65_cpsw_common *common)
 			unregister_netdev(port->ndev);
 		free_netdev(port->ndev);
 		port->ndev = NULL;
+		am65_cpsw_rxnfc_cleanup(port);
 	}
 }
 
@@ -3172,6 +3174,7 @@ static int am65_cpsw_dl_switch_mode_set(struct devlink *dl, u32 id,
 	/* clean up ALE table */
 	cpsw_ale_control_set(cpsw->ale, HOST_PORT_NUM, ALE_CLEAR, 1);
 	cpsw_ale_control_get(cpsw->ale, HOST_PORT_NUM, ALE_AGEOUT);
+	cpsw_ale_policer_reset(cpsw->ale);
 
 	if (switch_en) {
 		dev_info(cpsw->dev, "Enable switch mode\n");
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 61daa5db12e6..8b83c9a0965d 100644
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
@@ -59,6 +66,11 @@ struct am65_cpsw_port {
 	struct xdp_rxq_info		xdp_rxq[AM65_CPSW_MAX_QUEUES];
 	/* Only for suspend resume context */
 	u32				vid_context;
+	/* Classifier flows */
+	struct mutex rxnfc_lock;
+	struct list_head rxnfc_rules;
+	int rxnfc_count;
+	int rxnfc_max;
 };
 
 enum am65_cpsw_tx_buf_type {
@@ -229,4 +241,7 @@ int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common,
 
 bool am65_cpsw_port_dev_check(const struct net_device *dev);
 
+void am65_cpsw_rxnfc_init(struct am65_cpsw_port *port);
+void am65_cpsw_rxnfc_cleanup(struct am65_cpsw_port *port);
+
 #endif /* AM65_CPSW_NUSS_H_ */

-- 
2.34.1


