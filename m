Return-Path: <linux-omap+bounces-2618-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564839C1D66
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8C5285039
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D60F1E8830;
	Fri,  8 Nov 2024 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rF6VMquF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7ED1D0F5C;
	Fri,  8 Nov 2024 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070524; cv=none; b=ZdsFftuxupAkyPKYMljKnRql1/f3Ne9FiuLGzoWDBoZTFE367+hM6k9ZmsopmyVUFDAjTXhoEldOZz3QE1/8e8XbIgSOSYYAFuknaC4a7EdzQKXKZLczCwSsAL09lYU9WS+6L0n8KtsPakH1PEzf5KgbilYpuC4GKF+BCJ0uP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070524; c=relaxed/simple;
	bh=14AWA1ouLWWPk08pR67j22pd1ODjq1MsrGbMdmhSYdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBHljhNFxS9ls54ZpMbvgYHvW4tgsX3ZtV7ZiSMYrI3IC8QQMaseyZKRIZR5GremHo6rFAMX3nJQGYIGCn0yZEhliPy8JxiNm/kWWjCGaC+xLn9x+9AVOY76C3wEMUSjqc2IVpiEgZa3UWBoBTPSfJJy9o38tKIq6MD2uhABqAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rF6VMquF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A18C4CECD;
	Fri,  8 Nov 2024 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731070524;
	bh=14AWA1ouLWWPk08pR67j22pd1ODjq1MsrGbMdmhSYdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rF6VMquFdTNDm9EFUmTB4EZAs5g+pA/6ISTlcZR775XK/K8yyB9CF6iUWip8vnvcn
	 vYh8DVrqnAPxsiQCfXBudSRN9DsZ1daE8vsPLBDRFtXEgvKQJLFPYThBjOCy4b8e+A
	 UCr9FMUUF21YgklBpaShTuPOQeog562S1TwqcqWB2EQ/ZtLcAT1nSpFAtmtqEHrg5e
	 WXaZQXNWBCoFm535DvpAr8zIqt84TACeWNgidYC1OxSfkQbhcjAHMYvnGgawMW0pvv
	 QqKiAJFIULqoz21VzhqmusXKcNruzxqUx8MMTuxuY+epxY9mwjcNmZArVvYl9Raqen
	 7Oc/wss0+HwYQ==
Message-ID: <7ae1ccf9-67c0-45ba-9cb9-886701adb488@kernel.org>
Date: Fri, 8 Nov 2024 14:55:18 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: ethernet: ti: am65-cpsw: enable DSCP to
 priority map for RX
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 Pekka Varis <p-varis@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
 <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Siddharth,

On 08/11/2024 14:30, Siddharth Vadapalli wrote:
> On Tue, Nov 05, 2024 at 04:18:11PM +0200, Roger Quadros wrote:
> 
> Hello Roger,
> 
>> AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
>> appropriate priority queue via DSCP to Priority mapping registers
>> (CPSW_PN_RX_PRI_MAP_REG).
>>
>> We use the upper 3 bits of the DSCP field that indicate IP Precedence
>> to map traffic to 8 priority queues.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 50 ++++++++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> index 0520e9f4bea7..65fbf6727e02 100644
>> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
>> @@ -71,6 +71,8 @@
>>  #define AM65_CPSW_PORT_REG_RX_PRI_MAP		0x020
>>  #define AM65_CPSW_PORT_REG_RX_MAXLEN		0x024
>>  
>> +#define AM65_CPSW_PORTN_REG_CTL			0x004
> 
> nitpick: indentation needs to be fixed here to align with the macros
> below.

It is fine in the code and in my editor in this reply email.

> 
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
>> @@ -176,6 +182,49 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
>>  	writel(mac_lo, slave->port_base + AM65_CPSW_PORTN_REG_SA_L);
>>  }
>>  
>> +#define AM65_CPSW_DSCP_MAX	GENMASK(5, 0)
>> +#define AM65_CPSW_PRI_MAX	GENMASK(2, 0)
>> +static int am65_cpsw_port_set_dscp_map(struct am65_cpsw_port *slave, u8 dscp, u8 pri)
>> +{
>> +	int reg_ofs;
>> +	int bit_ofs;
>> +	u32 val;
>> +
>> +	if (dscp > AM65_CPSW_DSCP_MAX)
>> +		return -EINVAL;
> 
> am65_cpsw_port_set_dscp_map() seems to be invoked by
> am65_cpsw_port_enable_dscp_map() below, where the above check is guaranteed
> to be satisfied. Is the check added for future-proofing this function?
> 

Right, future callers can't be guaranteed to do the check so I'd prefer
to have the check here.

>> +
>> +	if (pri > AM65_CPSW_PRI_MAX)
>> +		return -EINVAL;
>> +
>> +	reg_ofs = (dscp / 8) * 4;	/* reg offset to this dscp */
>> +	bit_ofs = 4 * (dscp % 8);	/* bit offset to this dscp */
> 
> Maybe a macro can be used for the "4" since it is not clear what it

First 4 was for 4 bytes per register. Not sure if we need a macro for this.
The comment already mentions register offset and we know each register is
32-bits wide.

We could add a macro for the 8 though
#define AM65_CPSW_DSCP_PRI_PER_REG	8

The second 4 is actually 4 bits per DSCP field. I could add a macro for this.
#define AM65_CPSW_DSCP_PRI_FIELD_WIDTH	4


> corresponds to. Or maybe two macros can be used for "reg_ofs" and
> "bit_ofs".
> 
>> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
>> +	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
>> +	val |= pri << bit_ofs;			/* set */
>> +	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
>> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> 
> The above readback seems to be just to flush the writel(). A comment of
> the form:
> /* flush */
> might help, considering that other drivers do the same. Also, assigning
> the returned value to "val" might not be required unless it is intended to
> be checked.

This was actually left over debug code. I'll drop the readl.

-- 
cheers,
-roger

