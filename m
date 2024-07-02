Return-Path: <linux-omap+bounces-1648-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A873E9239CD
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2024 11:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691D22827BA
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2024 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B915218A;
	Tue,  2 Jul 2024 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2Hjq0TU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC881A28B;
	Tue,  2 Jul 2024 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719912259; cv=none; b=O7YKfsa++dM2XqlrCsJFMJ8RGJM0OMyvu43zdiUeYiCS/nvhAH4i7tsqChR+qFAv2qoVWrQ5WUhBvgh9e9p8mA5zMtLsT/Dd+2zTk4RlvWzBwKD6L4R2zCwivcrvnfQIDWQqYeNRS1d1xoUXsV9am0ajXWyQzElfmWbwLWBlGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719912259; c=relaxed/simple;
	bh=AtHy76LhHZBuSG9Zh2PI2i7sJXyX+B7OpLr/QLRadpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm129PvAWYF1pj90DPUqB+OCU8aS7wtaYc/Tk+XXXxRJVRUytn9gsPgibwKIcgpupms0iBptBj8eWhztlaxZEaHomaHvd83Oc5dSd8x+NqQoEslULRMmWFLm76T0FXOO0agO6xYcUbsC3VZlYm3y+rcA8etaAkj7PLMoQX5ymy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2Hjq0TU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF5EC116B1;
	Tue,  2 Jul 2024 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719912258;
	bh=AtHy76LhHZBuSG9Zh2PI2i7sJXyX+B7OpLr/QLRadpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2Hjq0TU9t3QwFokgmXFJjV7uoaiaMVjGf4tOzonGWAPERO39E9APLO+kpIb9ziSZ
	 JNhvtfxPTYxiaBYEsus2q2gKwUqEwI8Xr9jIt/gnWnsj21Sp2Q8XfmiTVwcUlMlXVl
	 3suRjumYVFt53AALwPX1M2NvEJl6HWQtuD9SzLNH4sdwkKq0j39UhpBeewFeaFqbRL
	 oMBn910fmL31N/GZTE/hxNURN7TDwHEPel7oP4X0sH/E+zCANua+sUi4aDCIH3jxFo
	 z+oKC49/gCjvlmLAAI4TsYX6WjwZxtgdbemQ+BkatQxA4VxOKzBURC1W1AK7iVaHGL
	 DA2wMa4ZST45w==
Date: Tue, 2 Jul 2024 10:24:13 +0100
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
Message-ID: <20240702092413.GB598357@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-6-c399cb77db56@kernel.org>
 <20240701073505.GI17134@kernel.org>
 <4124798a-cda5-47fe-a67b-e84d72f3ecf8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4124798a-cda5-47fe-a67b-e84d72f3ecf8@kernel.org>

On Mon, Jul 01, 2024 at 01:32:08PM +0300, Roger Quadros wrote:
> 
> On 01/07/2024 10:35, Simon Horman wrote:
> > On Fri, Jun 28, 2024 at 03:01:55PM +0300, Roger Quadros wrote:
> >> Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
> >> priorities to N receive threads (flows). N depends on number of
> >> RX channels enabled for the port.
> >>
> >> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> >> ---
> >>  drivers/net/ethernet/ti/cpsw_ale.c | 57 ++++++++++++++++++++++++++++++++++++++
> >>  drivers/net/ethernet/ti/cpsw_ale.h |  1 +
> >>  2 files changed, 58 insertions(+)
> >>
> >> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> >> index 75a17184d34c..51da527388df 100644
> >> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> >> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> >> @@ -1650,3 +1650,60 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
> >>  	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
> >>  	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
> >>  }
> >> +
> >> +/* Disable all policer entries and thread mappings */
> >> +static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
> >> +{
> >> +	int i;
> >> +
> >> +	for (i = 0; i < ale->params.num_policers ; i++) {
> >> +		cpsw_ale_policer_read_idx(ale, i);
> >> +		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_DST_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
> >> +		regmap_field_write(ale->fields[POL_EN], 0);
> >> +		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
> >> +		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
> >> +		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
> >> +
> >> +		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
> >> +	}
> >> +}
> >> +
> >> +/* Default classifer is to map 8 user priorities to N receive channels */
> >> +void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
> >> +{
> >> +	int pri, idx;
> >> +	int pri_thread_map[8][9] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
> >> +					{ 0, 0, 0, 0, 1, 1, 1, 1, },
> >> +					{ 0, 0, 0, 0, 1, 1, 2, 2, },
> >> +					{ 1, 0, 0, 1, 2, 2, 3, 3, },
> >> +					{ 1, 0, 0, 1, 2, 3, 4, 4, },
> >> +					{ 1, 0, 0, 2, 3, 4, 5, 5, },
> >> +					{ 1, 0, 0, 2, 3, 4, 5, 6, },
> >> +					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
> > 
> > Hi Roger,
> > 
> > Perhaps it is obvious, but I'm wondering if it is appropriate
> > to add a comment explaining the layout of the table, especially
> > the latter rows where the mapping of priority to receive channel
> > seems somewhat non-trivial.
> 
> Sure. I took the table straight off from the All new switch book. [1]
> 
> Priorities 3 to 7 are straight forward. Priorities 0 to 2 are listed like so in
> decreasing order of priority
> 
> 0 (default)	Best Effort
> 2 		Spare (undefined)
> 1 (lowest)	Background
> 
> [1] Table 13-2 IEEE 802.1p Recommended Priority Mappings to Class of Service.

Thanks Roger,

I was able to correlate this with tables G-2 and G-3 of 802.1D-2004.

I do think it would be adding some sort of comment to the code
about this.

...

