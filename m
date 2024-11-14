Return-Path: <linux-omap+bounces-2674-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54529C865B
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 10:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23ABDB23B3A
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 09:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B121F7080;
	Thu, 14 Nov 2024 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPdEYXkZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F77C0BE;
	Thu, 14 Nov 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731577272; cv=none; b=moc1qLgqHakAdrg3ZBsIpPdy/JNbliB7kFPO0jok7nEzvvDoI7/vVtuky5XkYOs5FNu6VdZqlnLjXxXdtzQIerlF94hbduax1gKh5/BalfixITHfg+YyVAZSqFYuL1A4IZP0uOf8EryzUtbtmxK5/eGVJeOL3Aj1VxmByRhiPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731577272; c=relaxed/simple;
	bh=5q3RktbUZXvf6M0hRM6HB/aJlJafYbTdCmLCZcHHYRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0COk4VvmmblIHpXcQyUPCTozHQkt49dw3X5lw+GRGCPBVWdDxbCp6TNLiUVDXfw5keCAp78cpJsLCC7SvkpaaGkdoh0gfogW0ct38X5cJDAft++E5Vq5jBtbWH3UONDIH+Tn5qGS18etTK0AIqMSfjMMPn4d9g1+Jp2tJ4JouY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPdEYXkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C56C4CECD;
	Thu, 14 Nov 2024 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731577272;
	bh=5q3RktbUZXvf6M0hRM6HB/aJlJafYbTdCmLCZcHHYRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IPdEYXkZsrnbsNA/amFr6z9+SaYXUFEEn5OGID34chnxsJmNyfI3ULyGkejnFEgxV
	 +rIeZC7SCUBgT9L2KsA84kPhdSfWCnUP4A2Ldg6Dc+CMCLB9Nk8ljPXtr6Zamql35j
	 8i6vRWmKuw4oazJ4jsbxUBRmc71AxrDwV/aIVlWfmhyrN7NHCBiHmHuENEvl8RYNw7
	 OrW9qYHIwRlCIU3JXAnmCM/sFUj3VLY7ju0+cwBtKPYxzsmQKPluiwnvA7Yml4+zo3
	 qcVGvv2zojvmC43lcEfVqx32JY69z60Z2WLAlGRUsGQD+h+yAXYI+Cb7imS6pNPJPl
	 M6gF/uMoJX9qQ==
Message-ID: <76dd6141-5852-43ae-af98-f0edf0bc10f5@kernel.org>
Date: Thu, 14 Nov 2024 11:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
To: Guillaume Nault <gnault@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 Pekka Varis <p-varis@ti.com>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
 <20241109-am65-cpsw-multi-rx-dscp-v3-2-1cfb76928490@kernel.org>
 <ZzVBS1zXIy31pnaf@debian>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ZzVBS1zXIy31pnaf@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/11/2024 02:16, Guillaume Nault wrote:
> On Sat, Nov 09, 2024 at 01:00:08PM +0200, Roger Quadros wrote:
>> AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
>> appropriate priority queue via DSCP to Priority mapping registers
>> (CPSW_PN_RX_PRI_MAP_REG).
>>
>> We use the upper 3 bits of the DSCP field that indicate IP Precedence
>> to map traffic to 8 priority queues.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 54 ++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> index 0520e9f4bea7..fab35e6aac7f 100644
>> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> @@ -71,6 +71,8 @@
>>  #define AM65_CPSW_PORT_REG_RX_PRI_MAP		0x020
>>  #define AM65_CPSW_PORT_REG_RX_MAXLEN		0x024
>>  
>> +#define AM65_CPSW_PORTN_REG_CTL			0x004
>> +#define AM65_CPSW_PORTN_REG_DSCP_MAP		0x120
>>  #define AM65_CPSW_PORTN_REG_SA_L		0x308
>>  #define AM65_CPSW_PORTN_REG_SA_H		0x30c
>>  #define AM65_CPSW_PORTN_REG_TS_CTL              0x310
>> @@ -94,6 +96,10 @@
>>  /* AM65_CPSW_PORT_REG_PRI_CTL */
>>  #define AM65_CPSW_PORT_REG_PRI_CTL_RX_PTYPE_RROBIN	BIT(8)
>>  
>> +/* AM65_CPSW_PN_REG_CTL */
>> +#define AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN	BIT(1)
>> +#define AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN	BIT(2)
>> +
>>  /* AM65_CPSW_PN_TS_CTL register fields */
>>  #define AM65_CPSW_PN_TS_CTL_TX_ANX_F_EN		BIT(4)
>>  #define AM65_CPSW_PN_TS_CTL_TX_VLAN_LT1_EN	BIT(5)
>> @@ -176,6 +182,53 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
>>  	writel(mac_lo, slave->port_base + AM65_CPSW_PORTN_REG_SA_L);
>>  }
>>  
>> +#define AM65_CPSW_DSCP_MAX	GENMASK(5, 0)
>> +#define AM65_CPSW_PRI_MAX	GENMASK(2, 0)
>> +#define AM65_CPSW_DSCP_PRI_PER_REG	8
>> +#define AM65_CPSW_DSCP_PRI_SIZE		4	/* in bits */
>> +static int am65_cpsw_port_set_dscp_map(struct am65_cpsw_port *slave, u8 dscp, u8 pri)
>> +{
>> +	int reg_ofs;
>> +	int bit_ofs;
>> +	u32 val;
>> +
>> +	if (dscp > AM65_CPSW_DSCP_MAX)
>> +		return -EINVAL;
>> +
>> +	if (pri > AM65_CPSW_PRI_MAX)
>> +		return -EINVAL;
>> +
>> +	/* 32-bit register offset to this dscp */
>> +	reg_ofs = (dscp / AM65_CPSW_DSCP_PRI_PER_REG) * 4;
>> +	/* bit field offset to this dscp */
>> +	bit_ofs = AM65_CPSW_DSCP_PRI_SIZE * (dscp % AM65_CPSW_DSCP_PRI_PER_REG);
>> +
>> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
>> +	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
>> +	val |= pri << bit_ofs;			/* set */
>> +	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
>> +
>> +	return 0;
>> +}
>> +
>> +static void am65_cpsw_port_enable_dscp_map(struct am65_cpsw_port *slave)
>> +{
>> +	int dscp, pri;
>> +	u32 val;
>> +
>> +	/* Map IP Precedence field to Priority */
>> +	for (dscp = 0; dscp <= AM65_CPSW_DSCP_MAX; dscp++) {
>> +		pri = dscp >> 3; /* Extract IP Precedence */
>> +		am65_cpsw_port_set_dscp_map(slave, dscp, pri);
>> +	}
>> +
>> +	/* enable port IPV4 and IPV6 DSCP for this port */
>> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_CTL);
>> +	val |= AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN |
>> +		AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN;
>> +	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_CTL);
>> +}
> 
> It seems that this hardware is capable of mapping all possible DSCP
yes.

> values. Then why restricting the mapping to the 3 high order bits only?

Currently, the 64 DSCP values are mapped to 8 User Priorities (UP) based
on just the Class Selector Codepoint field (first 3 bits of DSCP).

But now looking at rfc8325#section-4.3.
"Note: All unused codepoints are RECOMMENDED to be mapped to UP 0"

So what this patch does doesn't look like a good idea.

> According to RFC 8325 section 2.3, this seem to be a common practice,
> which this RFC considers a problem:
> https://datatracker.ietf.org/doc/html/rfc8325#section-2.3

Good to know about this.

> 
> I know this RFC is about 802.11, not 802.1p, but as far as I know, the
> user priority (UP) are the same for both, so that shouldn't make a
> difference.
> 
> So what about following the IETF mapping found in section 4.3?
> https://datatracker.ietf.org/doc/html/rfc8325#section-4.3

Thanks for this tip.
I will update this patch to have the default DSCP to UP mapping as per
above link and map all unused DSCP to UP 0.

Is there any mechanism/API for network administrator to change this
default mapping in the network drivers?

> 
>>  static void am65_cpsw_sl_ctl_reset(struct am65_cpsw_port *port)
>>  {
>>  	cpsw_sl_reset(port->slave.mac_sl, 100);
>> @@ -921,6 +974,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
>>  	common->usage_count++;
>>  
>>  	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
>> +	am65_cpsw_port_enable_dscp_map(port);
>>  
>>  	if (common->is_emac_mode)
>>  		am65_cpsw_init_port_emac_ale(port);
>>
>> -- 
>> 2.34.1
>>
>>
> 

-- 
cheers,
-roger


