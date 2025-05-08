Return-Path: <linux-omap+bounces-3679-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB92AAFC42
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 16:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF68F1C209E0
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 14:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B4822D7BC;
	Thu,  8 May 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlLc5mLr"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1E22C35E
	for <linux-omap@vger.kernel.org>; Thu,  8 May 2025 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712813; cv=none; b=kzuN/iO4SEFj/jaX3mW6khMljHVnPUGe6pWRAXJC6YzWam54HBxAg+o/4Fqi5Hy3QGCAA8Zpn7t1h78WMhRaxM9fIVx8nWG/37HVpWt204j/opAVtALHMmR2XxpISJa+rJcjGHWWrenXmpHKgiyvrFJKJFSAG81OnrX5DxveGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712813; c=relaxed/simple;
	bh=0CBNblVGBwzC4K+9AanOCAcHMIo1KuKGB49HbiekJQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kltRbJb3o6MAWVBoH919nxVpfdec9RIfw6uKpmmbR+9jNkey9OWvKJUDVSqgmpzuWFs0dI+saCeBYK6unOpBlk4zocmu9cnlJTWlvrXDtxxH6sSlnCCD2Vw66BUn9Eh3MghWcF20zgUpYZFyXVbrxo9dHJyKjgG1FTVB3N9vlys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OlLc5mLr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9N9KFBFAtHdvMwtJNTBznZFyJ6K9qRAlGv8LqfVMqBw=;
	b=OlLc5mLryunthBx23rro8PQYJw/P/9PmLdXe4gV+Mlw4rJd7v4M+OF9quS4w8vlF5KKaYa
	lBbmKfabq0iznQvhIDh3w5ozjmKFmYPq3Hp10NychL72XCj0bskBjFgpqzRSPhTbwWz7jP
	3q36Pq1dXIoFDOwoj4K40p05ogp7pSk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-fPvu4qQMMeGpemcwPJiqoQ-1; Thu, 08 May 2025 10:00:09 -0400
X-MC-Unique: fPvu4qQMMeGpemcwPJiqoQ-1
X-Mimecast-MFC-AGG-ID: fPvu4qQMMeGpemcwPJiqoQ_1746712808
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso4707055e9.0
        for <linux-omap@vger.kernel.org>; Thu, 08 May 2025 07:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712808; x=1747317608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9N9KFBFAtHdvMwtJNTBznZFyJ6K9qRAlGv8LqfVMqBw=;
        b=gt+gHiFLxn5HVbeTGKAllaW7lOiBRmM7JftO6eV1dSz1YlLmDCej8nJCkIG8st54jz
         6l5IBhCpcaNtWFN/SEINXeRc5E9tdgU5vg0x2f+vqCxcllpvOrc26X1WF2nDYCisHIB3
         eJ83uz91eCpz4BDibTabBdGMZ5/TpHA8EYhx074bpeh0Sty4NyP32Chy+QUtF9GjtMz/
         cAyf8PDsM3dhgjnyKZ+NGKd0Z14pfdGXhivAq++0K2ReNB3b6LdioW3KJn/aLtvQsRnT
         dxJh5sUa7Enf/oD+/NRC7glOUKdc9p4JbdwNoKGD+QQK6/vZsYEXvfbB4zNE3RyWRcgX
         fJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCURUTS0xBGWIGMJX66drBD70Cze89xTV3ry0Lj99i9TB4kpf/Tbv7ERAClwr7avR0WlpQroFG3iBVMn@vger.kernel.org
X-Gm-Message-State: AOJu0YzvIK8FYf/JFi2tjH7BwO+AaXnSWIUlfc5OkIVkQefwdCqHgnSV
	CJMFL5cVXyVhWX1XYoUdZXfFR3ZLdN2UQ69ad/S1esDoMIAGwSahQqIUf59tytVmjfILKyuIrLi
	K7N/8OYFxKalZwoYERL1XrzdzmJBKn3ZmebNsooaxxsEtRvtahEvUUN/p9R4=
X-Gm-Gg: ASbGncsY/Vo2W87rnQqZ0O2MC2wwCDrp1VL0Oz/A1vRQL25CCJCouLdtiVGmdb0Ys9u
	wXKk8lS21izqz3ZShJrg9JIff3RpMBbvE0Kf4+8XI18WBjSOwaHhEbAPp55uL9wM6ojtrO8rE85
	8S5HRmREsEh0bBzDBu6RCNYBM6w/iePSl9OMuBkTNfPM+q7d9ROXqVoGncmma57oWzvaz5GRoRa
	UjblN3UGkZW3QEzRMkVWK+PyUGCdkcCQcEFuupmEWjji3FIJxoD5cputUa4H+IEHGgVoa+4DKUt
	GgsSpKREPe3fO7wj
X-Received: by 2002:a05:600c:5491:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-441d44dc05amr62664185e9.24.1746712807962;
        Thu, 08 May 2025 07:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC2fc8m3vhbJavq1eX+bZPuWSNvi1AlBB3FQAZ2SaPCTNloEhwJvAd3tWCs+J3g6gFaFKD4A==
X-Received: by 2002:a05:600c:5491:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-441d44dc05amr62663825e9.24.1746712807597;
        Thu, 08 May 2025 07:00:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244b:910::f39? ([2a0d:3344:244b:910::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd2b2050sm39103855e9.0.2025.05.08.07.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:00:07 -0700 (PDT)
Message-ID: <244138b2-a90e-404d-946f-9ce25c6155e1@redhat.com>
Date: Thu, 8 May 2025 16:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
To: Roger Quadros <rogerq@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
 <20250505-am65-cpsw-rx-class-v2-8-5359ea025144@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-8-5359ea025144@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 6:26 PM, Roger Quadros wrote:
[...]
> +/* validate the rxnfc rule and convert it to policer config */
> +static int am65_cpsw_rxnfc_validate(struct am65_cpsw_port *port,
> +				    struct ethtool_rxnfc *rxnfc,
> +				    struct cpsw_ale_policer_cfg *cfg)
> +{
> +	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
> +	int flow_type = AM65_CPSW_FLOW_TYPE(fs->flow_type);
> +	struct ethhdr *eth_mask;

(Minor nit only mentioned because of more relevant comments on previous
patch) Please respect the reverse christmas tree order above.

> +
> +	memset(cfg, 0, sizeof(*cfg));
> +
> +	if (flow_type & FLOW_RSS)
> +		return -EINVAL;
> +
> +	if (fs->location == RX_CLS_LOC_ANY ||
> +	    fs->location >= port->rxnfc_max)
> +		return -EINVAL;
> +
> +	if (fs->ring_cookie == RX_CLS_FLOW_DISC)
> +		cfg->drop = true;
> +	else if (fs->ring_cookie > AM65_CPSW_MAX_QUEUES)
> +		return -EINVAL;
> +
> +	cfg->port_id = port->port_id;
> +	cfg->thread_id = fs->ring_cookie;
> +
> +	switch (flow_type) {
> +	case ETHER_FLOW:
> +		eth_mask = &fs->m_u.ether_spec;
> +
> +		/* etherType matching is supported by h/w but not yet here */
> +		if (eth_mask->h_proto)
> +			return -EINVAL;
> +
> +		/* Only support source matching addresses by full mask */
> +		if (is_broadcast_ether_addr(eth_mask->h_source)) {
> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACSRC;
> +			ether_addr_copy(cfg->src_addr,
> +					fs->h_u.ether_spec.h_source);
> +		}
> +
> +		/* Only support destination matching addresses by full mask */
> +		if (is_broadcast_ether_addr(eth_mask->h_dest)) {
> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_MACDST;
> +			ether_addr_copy(cfg->dst_addr,
> +					fs->h_u.ether_spec.h_dest);
> +		}
> +
> +		if ((fs->flow_type & FLOW_EXT) && fs->m_ext.vlan_tci) {
> +			/* Don't yet support vlan ethertype */
> +			if (fs->m_ext.vlan_etype)
> +				return -EINVAL;
> +
> +			if (fs->m_ext.vlan_tci != VLAN_TCI_FULL_MASK)
> +				return -EINVAL;
> +
> +			cfg->vid = FIELD_GET(VLAN_VID_MASK,
> +					     ntohs(fs->h_ext.vlan_tci));
> +			cfg->vlan_prio = FIELD_GET(VLAN_PRIO_MASK,
> +						   ntohs(fs->h_ext.vlan_tci));
> +			cfg->match_flags |= CPSW_ALE_POLICER_MATCH_OVLAN;
> +		}
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int am65_cpsw_policer_find_match(struct am65_cpsw_port *port,
> +					struct cpsw_ale_policer_cfg *cfg)
> +{
> +	struct am65_cpsw_rxnfc_rule *rule;
> +	int loc = -EINVAL;
> +
> +	mutex_lock(&port->rxnfc_lock);
> +	list_for_each_entry(rule, &port->rxnfc_rules, list) {
> +		if (!memcmp(&rule->cfg, cfg, sizeof(*cfg))) {
> +			loc = rule->location;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&port->rxnfc_lock);
> +
> +	return loc;
> +}
> +
> +static int am65_cpsw_rxnfc_add_rule(struct am65_cpsw_port *port,
> +				    struct ethtool_rxnfc *rxnfc)
> +{
> +	struct ethtool_rx_flow_spec *fs = &rxnfc->fs;
> +	struct am65_cpsw_rxnfc_rule *rule;
> +	struct cpsw_ale_policer_cfg cfg;
> +	int loc, ret;
> +
> +	if (am65_cpsw_rxnfc_validate(port, rxnfc, &cfg))
> +		return -EINVAL;
> +
> +	/* need to check if similar rule is already present at another location,
> +	 * if yes error out
> +	 */
> +	loc = am65_cpsw_policer_find_match(port, &cfg);
> +	if (loc >= 0 && loc != fs->location) {
> +		netdev_info(port->ndev,
> +			    "rule already exists in location %d. not adding\n",
> +			    loc);
> +		return -EINVAL;
> +	}
> +
> +	/* delete exisiting rule */
> +	if (loc >= 0) {
> +		mutex_lock(&port->rxnfc_lock);

The rxnfc_lock mutex is released and re-aquired after the previous
lookup. Con some other thread delete the matching rule in-between and
add another one at a different location?

/P


