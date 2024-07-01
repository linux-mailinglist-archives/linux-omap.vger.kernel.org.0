Return-Path: <linux-omap+bounces-1622-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7491D904
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D54281FCF
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A555F876;
	Mon,  1 Jul 2024 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f29dGmZA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160EA37142;
	Mon,  1 Jul 2024 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819311; cv=none; b=HWKCQtD2DBagGfqhBjob8Sex2HOjT5J6ya88a6DE3QBHVABlZaiqeauIBno5QMyU2ZbKjfRuOBKvPc1wg95JbGsWRQ4XaF6qdzNNA8e1rEC0yUXzq2kncQvXohhGMXlNAxFv0WBMKXHs53WOdAWC5eNJFuT+tiwUE35TS1xfG8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819311; c=relaxed/simple;
	bh=Bif20sIYf7xrjcP4nu3TdOd59ri0smG6Qu7LpJ9O0l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qotoPA3jj9Da45AErK/ZX5VEXYZSSRWchUQzN772mTjOYIAdcIqZDNUmcFYaVZfnvDwtI+t+1hY3gwAkmJMHszj/5i3gsoYZZ8X5LjlCZuTPTU+o7bagxD6H6WIkY56RdZNjQFyq5PTNSI3Ck+cXWZA45eZI+zACZKn64f/L9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f29dGmZA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DADC116B1;
	Mon,  1 Jul 2024 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819310;
	bh=Bif20sIYf7xrjcP4nu3TdOd59ri0smG6Qu7LpJ9O0l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f29dGmZAFJTpEYqr/eq0Au2YnHN/RWzGpGUxouBjLpcMoul4uC8+26+839FZiYB2S
	 6xlOXFyO5Gu+Li+Umkhnl6RyLjUMhNAVjop+PUWDVS18yBTaxgKzLx8qoVwDWn336n
	 U4vMHIXj+MV/FtgQMcK040cCh4bCvpblR9Ujjc80ddY527R1/D20vedRdvG1M5fs9p
	 9cQxNz5xm4NaC0kUEadAU/mnWE5viARnKIUGK/p0ouKAZOQh1X1H2erRCi1gjt/PuX
	 H7HkKsV4lmhl/seu61kFH+lsJ14T0BSZk+5XYYPvUKZDOL8o2+klbzAMWRXEZ6H7ti
	 xtjLvwlbF0TxQ==
Date: Mon, 1 Jul 2024 08:35:05 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com,
	pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/7] net: ethernet: ti: cpsw_ale: add helper
 to setup classifier defaults
Message-ID: <20240701073505.GI17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-6-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-6-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:55PM +0300, Roger Quadros wrote:
> Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
> priorities to N receive threads (flows). N depends on number of
> RX channels enabled for the port.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 57 ++++++++++++++++++++++++++++++++++++++
>  drivers/net/ethernet/ti/cpsw_ale.h |  1 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 75a17184d34c..51da527388df 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1650,3 +1650,60 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
>  	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
>  	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
>  }
> +
> +/* Disable all policer entries and thread mappings */
> +static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
> +{
> +	int i;
> +
> +	for (i = 0; i < ale->params.num_policers ; i++) {
> +		cpsw_ale_policer_read_idx(ale, i);
> +		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
> +		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
> +		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
> +		regmap_field_write(ale->fields[POL_DST_MEN], 0);
> +		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
> +		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
> +		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
> +		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
> +		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
> +		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
> +		regmap_field_write(ale->fields[POL_EN], 0);
> +		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
> +		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
> +		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
> +
> +		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
> +	}
> +}
> +
> +/* Default classifer is to map 8 user priorities to N receive channels */
> +void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
> +{
> +	int pri, idx;
> +	int pri_thread_map[8][9] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
> +					{ 0, 0, 0, 0, 1, 1, 1, 1, },
> +					{ 0, 0, 0, 0, 1, 1, 2, 2, },
> +					{ 1, 0, 0, 1, 2, 2, 3, 3, },
> +					{ 1, 0, 0, 1, 2, 3, 4, 4, },
> +					{ 1, 0, 0, 2, 3, 4, 5, 5, },
> +					{ 1, 0, 0, 2, 3, 4, 5, 6, },
> +					{ 2, 0, 1, 3, 4, 5, 6, 7, } };

Hi Roger,

Perhaps it is obvious, but I'm wondering if it is appropriate
to add a comment explaining the layout of the table, especially
the latter rows where the mapping of priority to receive channel
seems somewhat non-trivial.

> +
> +	cpsw_ale_policer_reset(ale);
> +
> +	/* use first 8 classifiers to map 8 (DSCP/PCP) priorities to channels */
> +	for (pri = 0; pri < 8; pri++) {
> +		idx = pri;
> +
> +		/* Classifier 'idx' match on priority 'pri' */
> +		cpsw_ale_policer_read_idx(ale, idx);
> +		regmap_field_write(ale->fields[POL_PRI_VAL], pri);
> +		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
> +		cpsw_ale_policer_write_idx(ale, idx);
> +
> +		/* Map Classifier 'idx' to thread provided by the map */
> +		cpsw_ale_policer_thread_idx_enable(ale, idx,
> +						   pri_thread_map[num_rx_ch - 1][pri], 1);
> +	}
> +}
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
> index 2cb76acc6d16..1e4e9a3dd234 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.h
> +++ b/drivers/net/ethernet/ti/cpsw_ale.h
> @@ -193,5 +193,6 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
>  int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
>  void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
>  			      bool add);
> +void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
>  
>  #endif
> 
> -- 
> 2.34.1
> 
> 

