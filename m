Return-Path: <linux-omap+bounces-3699-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC4AB540C
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 13:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3BCE7A2E29
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 11:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3796428D8F0;
	Tue, 13 May 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALQTm+uZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505028D8D5;
	Tue, 13 May 2025 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136522; cv=none; b=o7R+Emj2xYLFJMPkPu5EkH1TbMEvu/OEBqfn4Pu1b3VFBE7ZCbTyGox2i67Jfa68AQxcDohANhImyVfFaCut1zFW4sjdnNLHvijjcSxEgGSXnj+M7cvfrMQMQ1fBUVoiU4YZui0TID/cAu67Ui0LXCSC1XPmUXQfIS4YIl99gKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136522; c=relaxed/simple;
	bh=eO9w3nrvJ3H7rmAo2MSmMtziW1MVTfuuIqYcS6Qt1nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AF+4SPash3SIrc2smLaymje5pA8ssvD3RuMrDwqdcylP5MAUHuzHRuRdKBDytYnS10JwLAKlCXTEfbh0VTvvmEU+wB34NwFbuGO+dGF4ToMxKCccDsyDkryK8bi+5IYwwe6/x3p1wgHTGlsc6uV/5xjmDIbLqLnuc8N2lQ0tR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALQTm+uZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DFAC4CEE4;
	Tue, 13 May 2025 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747136522;
	bh=eO9w3nrvJ3H7rmAo2MSmMtziW1MVTfuuIqYcS6Qt1nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALQTm+uZKtmN5UlGkFrdCVIxYdmEa51vs3Szkdm/bveJ7cMR8fbapYChmVr4IOXVy
	 JTmyKduvFQ7iheA0gswCrH+MhKqDbBOXLG445lihmw/VGg6qbqyGWZH8oImsbH9ydk
	 zreDSLU3ZMLy+3p49pfo8SRhhW1z9iPZAPKrTYido6cGWXKWY4cU6zQ6kecLo11vO3
	 KfUMs6o4Pp9FMaS8QX2R8or77RRf7C8co856S4AholzaZ40vOBemhzj27WpDu+nChG
	 0hyBFJLdyD+depPaZm3pxw7pNL1jyDahEztadYIypvXPauJPaxlfc7/YNgpgyRxEID
	 UIF6c8Cpjwv/w==
Message-ID: <58dcc38b-8150-4272-b214-b046163292a6@kernel.org>
Date: Tue, 13 May 2025 14:41:57 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
To: Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
 <20250505-am65-cpsw-rx-class-v2-8-5359ea025144@kernel.org>
 <244138b2-a90e-404d-946f-9ce25c6155e1@redhat.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <244138b2-a90e-404d-946f-9ce25c6155e1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/05/2025 17:00, Paolo Abeni wrote:
> On 5/5/25 6:26 PM, Roger Quadros wrote:
> [...]
>> +/* validate the rxnfc rule and convert it to policer config */
>> +static int am65_cpsw_rxnfc_validate(struct am65_cpsw_port *port,
>> +				    struct ethtool_rxnfc *rxnfc,
>> +				    struct cpsw_ale_policer_cfg *cfg)
>> +{
>> +	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
>> +	int flow_type = AM65_CPSW_FLOW_TYPE(fs->flow_type);
>> +	struct ethhdr *eth_mask;
> 
> (Minor nit only mentioned because of more relevant comments on previous
> patch) Please respect the reverse christmas tree order above.

Yes, will fix.
> 
>> +
>> +	memset(cfg, 0, sizeof(*cfg));
>> +
>> +	if (flow_type & FLOW_RSS)
>> +		return -EINVAL;
>> +
>> +	if (fs->location == RX_CLS_LOC_ANY ||
>> +	    fs->location >= port->rxnfc_max)
>> +		return -EINVAL;
>> +
>> +	if (fs->ring_cookie == RX_CLS_FLOW_DISC)
>> +		cfg->drop = true;
>> +	else if (fs->ring_cookie > AM65_CPSW_MAX_QUEUES)
>> +		return -EINVAL;
>> +
>> +	cfg->port_id = port->port_id;
>> +	cfg->thread_id = fs->ring_cookie;
>> +
>> +	switch (flow_type) {
>> +	case ETHER_FLOW:
>> +		eth_mask = &fs->m_u.ether_spec;
>> +
>> +		/* etherType matching is supported by h/w but not yet here */
>> +		if (eth_mask->h_proto)
>> +			return -EINVAL;
>> +
>> +		/* Only support source matching addresses by full mask */
>> +		if (is_broadcast_ether_addr(eth_mask->h_source)) {
>> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACSRC;
>> +			ether_addr_copy(cfg->src_addr,
>> +					fs->h_u.ether_spec.h_source);
>> +		}
>> +
>> +		/* Only support destination matching addresses by full mask */
>> +		if (is_broadcast_ether_addr(eth_mask->h_dest)) {
>> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACDST;
>> +			ether_addr_copy(cfg->dst_addr,
>> +					fs->h_u.ether_spec.h_dest);
>> +		}
>> +
>> +		if ((fs->flow_type & FLOW_EXT) && fs->m_ext.vlan_tci) {
>> +			/* Don't yet support vlan ethertype */
>> +			if (fs->m_ext.vlan_etype)
>> +				return -EINVAL;
>> +
>> +			if (fs->m_ext.vlan_tci != VLAN_TCI_FULL_MASK)
>> +				return -EINVAL;
>> +
>> +			cfg->vid = FIELD_GET(VLAN_VID_MASK,
>> +					     ntohs(fs->h_ext.vlan_tci));
>> +			cfg->vlan_prio = FIELD_GET(VLAN_PRIO_MASK,
>> +						   ntohs(fs->h_ext.vlan_tci));
>> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_OVLAN;
>> +		}
>> +
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int am65_cpsw_policer_find_match(struct am65_cpsw_port *port,
>> +					struct cpsw_ale_policer_cfg *cfg)
>> +{
>> +	struct am65_cpsw_rxnfc_rule *rule;
>> +	int loc = -EINVAL;
>> +
>> +	mutex_lock(&port->rxnfc_lock);
>> +	list_for_each_entry(rule, &port->rxnfc_rules, list) {
>> +		if (!memcmp(&rule->cfg, cfg, sizeof(*cfg))) {
>> +			loc = rule->location;
>> +			break;
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&port->rxnfc_lock);
>> +
>> +	return loc;
>> +}
>> +
>> +static int am65_cpsw_rxnfc_add_rule(struct am65_cpsw_port *port,
>> +				    struct ethtool_rxnfc *rxnfc)
>> +{
>> +	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
>> +	struct am65_cpsw_rxnfc_rule *rule;
>> +	struct cpsw_ale_policer_cfg cfg;
>> +	int loc, ret;
>> +
>> +	if (am65_cpsw_rxnfc_validate(port, rxnfc, &cfg))
>> +		return -EINVAL;
>> +
>> +	/* need to check if similar rule is already present at another location,
>> +	 * if yes error out
>> +	 */
>> +	loc = am65_cpsw_policer_find_match(port, &cfg);
>> +	if (loc >= 0 && loc != fs->location) {
>> +		netdev_info(port->ndev,
>> +			    "rule already exists in location %d. not adding\n",
>> +			    loc);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* delete exisiting rule */
>> +	if (loc >= 0) {
>> +		mutex_lock(&port->rxnfc_lock);
> 
> The rxnfc_lock mutex is released and re-aquired after the previous
> lookup. Con some other thread delete the matching rule in-between and
> add another one at a different location?

Good point. I will remove mutex acquiring from am65_cpsw_policer_find_match() and
add acquire it instead in the beginning of am65_cpsw_rxnfc_add_rule()

> 
> /P
> 

-- 
cheers,
-roger


