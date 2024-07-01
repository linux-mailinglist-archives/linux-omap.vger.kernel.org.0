Return-Path: <linux-omap+bounces-1632-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C491DCD4
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 12:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59B35B21F11
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 10:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C00784A27;
	Mon,  1 Jul 2024 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s60K45uw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280786E619;
	Mon,  1 Jul 2024 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829934; cv=none; b=sD6WfKzQZ0F0f6K+vCaGQhwKxvTzeixZFycaRrRObcCfmveu/MjFp5ouP7Xa3YojD9vU3bxG5eBuQwMYW9UA29zzHhPtAVjfxm6NnebjnP5wUeLPapxpaMh/Dxlz8mTDw93nBrzqdl9MUWv4Aq1/gZia4Hs+Kbq4tVIyahFbuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829934; c=relaxed/simple;
	bh=R7T8YhpIUp1RKvk1/M4DyWRs4IRJJC5D/TCvUBWV3F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BP1G4/29Qwk9DYEN2CVRSfRBOBgiC0NW/h6gmEyBBrsRCAwmfqnsXeKAvnEVz9EJcvnvvvT8Hr6spQWNxvbc4oJIvuEskRO/TS+5lBF0Akmc6m7gl+stfBPV06gGzs77nRXFfx+O3xgAhbbuxGP4uW8SzeH/Nlp+sr61gOJYJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s60K45uw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F61EC116B1;
	Mon,  1 Jul 2024 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719829933;
	bh=R7T8YhpIUp1RKvk1/M4DyWRs4IRJJC5D/TCvUBWV3F0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s60K45uwntuPFAJ/C/OpPh2FbLXUBRggc7QQcIB/0EaV59AAzy4BDHLRNCwBnXCxv
	 vLQPrLNuL1HRoJ+cAge9U1xFVrpLb1gcPrF5K9R54PWfziGEf/nebI0paNN+54dOX6
	 FMmO4eLfnhGgcPEWMMi8u8K48ZbVix9wZ4Hpoov25jxzoOU8qSGGgGm39zS8kM7lR6
	 6CGC3N1f9WRdLGZyCSB4D85BrS6uzeieuafORPuJr6DdgsX0xhvD0E9+m/+z/lgN+x
	 2QDcXB4T9vMeUtqYErJ2koLClDfAJlKw8PUGZQ5H8uwkPcDJCFl8tv9ldA1yK6BoJP
	 00q/72yuPUR3g==
Message-ID: <4124798a-cda5-47fe-a67b-e84d72f3ecf8@kernel.org>
Date: Mon, 1 Jul 2024 13:32:08 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 6/7] net: ethernet: ti: cpsw_ale: add helper
 to setup classifier defaults
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, pekka Varis
 <p-varis@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-6-c399cb77db56@kernel.org>
 <20240701073505.GI17134@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240701073505.GI17134@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 01/07/2024 10:35, Simon Horman wrote:
> On Fri, Jun 28, 2024 at 03:01:55PM +0300, Roger Quadros wrote:
>> Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
>> priorities to N receive threads (flows). N depends on number of
>> RX channels enabled for the port.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/net/ethernet/ti/cpsw_ale.c | 57 ++++++++++++++++++++++++++++++++++++++
>>  drivers/net/ethernet/ti/cpsw_ale.h |  1 +
>>  2 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
>> index 75a17184d34c..51da527388df 100644
>> --- a/drivers/net/ethernet/ti/cpsw_ale.c
>> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
>> @@ -1650,3 +1650,60 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
>>  	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
>>  	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
>>  }
>> +
>> +/* Disable all policer entries and thread mappings */
>> +static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ale->params.num_policers ; i++) {
>> +		cpsw_ale_policer_read_idx(ale, i);
>> +		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_DST_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
>> +		regmap_field_write(ale->fields[POL_EN], 0);
>> +		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
>> +		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
>> +		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
>> +
>> +		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
>> +	}
>> +}
>> +
>> +/* Default classifer is to map 8 user priorities to N receive channels */
>> +void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
>> +{
>> +	int pri, idx;
>> +	int pri_thread_map[8][9] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
>> +					{ 0, 0, 0, 0, 1, 1, 1, 1, },
>> +					{ 0, 0, 0, 0, 1, 1, 2, 2, },
>> +					{ 1, 0, 0, 1, 2, 2, 3, 3, },
>> +					{ 1, 0, 0, 1, 2, 3, 4, 4, },
>> +					{ 1, 0, 0, 2, 3, 4, 5, 5, },
>> +					{ 1, 0, 0, 2, 3, 4, 5, 6, },
>> +					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
> 
> Hi Roger,
> 
> Perhaps it is obvious, but I'm wondering if it is appropriate
> to add a comment explaining the layout of the table, especially
> the latter rows where the mapping of priority to receive channel
> seems somewhat non-trivial.

Sure. I took the table straight off from the All new switch book. [1]

Priorities 3 to 7 are straight forward. Priorities 0 to 2 are listed like so in
decreasing order of priority

0 (default)	Best Effort
2 		Spare (undefined)
1 (lowest)	Background

[1] Table 13-2 IEEE 802.1p Recommended Priority Mappings to Class of Service.

> 
>> +
>> +	cpsw_ale_policer_reset(ale);
>> +
>> +	/* use first 8 classifiers to map 8 (DSCP/PCP) priorities to channels */
>> +	for (pri = 0; pri < 8; pri++) {
>> +		idx = pri;
>> +
>> +		/* Classifier 'idx' match on priority 'pri' */
>> +		cpsw_ale_policer_read_idx(ale, idx);
>> +		regmap_field_write(ale->fields[POL_PRI_VAL], pri);
>> +		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
>> +		cpsw_ale_policer_write_idx(ale, idx);
>> +
>> +		/* Map Classifier 'idx' to thread provided by the map */
>> +		cpsw_ale_policer_thread_idx_enable(ale, idx,
>> +						   pri_thread_map[num_rx_ch - 1][pri], 1);
>> +	}
>> +}
>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
>> index 2cb76acc6d16..1e4e9a3dd234 100644
>> --- a/drivers/net/ethernet/ti/cpsw_ale.h
>> +++ b/drivers/net/ethernet/ti/cpsw_ale.h
>> @@ -193,5 +193,6 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
>>  int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
>>  void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
>>  			      bool add);
>> +void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
>>  
>>  #endif
>>
>> -- 
>> 2.34.1
>>
>>

-- 
cheers,
-roger

