Return-Path: <linux-omap+bounces-2681-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173E9C8A91
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9FB0B22F39
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD9F1FA84A;
	Thu, 14 Nov 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPc2tnyk"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA731E883F;
	Thu, 14 Nov 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731588433; cv=none; b=UH9oob2tQIpKPJeAmzC3GWt1F7FLdbKJQ/R4945WCZeobqxVnbQ8kpO6ip/GQ3jnfH2dRxbqJq+iniEkIA+ovtfgMFovvbqIPxuI54Migkt4wxcUGHkpS2+nq1KFYRv/d1NNFg2lYdgjJ9GNFnENTdgbb7g3IKaHJEEMO/AG5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731588433; c=relaxed/simple;
	bh=LM2UJ++XVFcdQxrEHjPndh+FibA3jWXJI7JXihkurqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh5MbxOGH7Y+c9mNxOu6OZo7iQZfjhg/cWu8tiV3ZhmHV8UPdiUwuwfJOA6P6m08G8HznIlReGvtMf232nARzzVAU2hvUBiJG/KYw7eVX1Qx8D5b8SKN9joY19UUapXVDblnnEjcfrmj6wlM5YFUyZj3XIU9YmzCTJGUhqcSPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPc2tnyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA07C4CECD;
	Thu, 14 Nov 2024 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731588432;
	bh=LM2UJ++XVFcdQxrEHjPndh+FibA3jWXJI7JXihkurqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QPc2tnykPn/pZ7kmhZ4WbSfG617lzNmuAjNDOh0YHwi2oMeY3GfWDYDjAgs4lJLB3
	 ObFpuQg1vVhCSVvxgOZQ6vOqMvrVIGun62oTpxFYvZaygvQEgEx77NjxQTifX+ClnZ
	 wzx7b2sLGsApXR9hvMBDrUak4MoAs7vBrscooyCvb7oLdi4/8QeC5IiffNdcRRsdLS
	 h1igR/PFOJYTn+Tc+2Fk+sXREjUilbHBpYMmMcaBQyXWgf567cqzOFq3CIAv3qdxuS
	 LuIBX+sjI6WgO8JQez3xH1/lNww+Bl9bTEQpQIjvUOjiDBhnRd3vTcuestBjD3MJLL
	 ow2H9jfQWt3ZQ==
Message-ID: <e9d3a6c8-fb12-4926-8c2b-414017681f03@kernel.org>
Date: Thu, 14 Nov 2024 14:47:07 +0200
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
 <ZzVBS1zXIy31pnaf@debian> <76dd6141-5852-43ae-af98-f0edf0bc10f5@kernel.org>
 <8bfe8acc-9514-4ba8-9498-2427ddb0bb78@kernel.org> <ZzXm6SHjRfbaOX14@debian>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ZzXm6SHjRfbaOX14@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/11/2024 14:02, Guillaume Nault wrote:
> On Thu, Nov 14, 2024 at 12:12:47PM +0200, Roger Quadros wrote:
>> On 14/11/2024 11:41, Roger Quadros wrote:
>>> On 14/11/2024 02:16, Guillaume Nault wrote:
>>>> So what about following the IETF mapping found in section 4.3?
>>>> https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
>>>
>>> Thanks for this tip.
>>> I will update this patch to have the default DSCP to UP mapping as per
>>> above link and map all unused DSCP to UP 0.
>>
>> How does the below code look in this regard?
> 
> Looks generally good to me. A few comments inline though.
> 
>> static void am65_cpsw_port_enable_dscp_map(struct am65_cpsw_port *slave)
>> {
>> 	int dscp, pri;
>> 	u32 val;
>>
>> 	/* Default DSCP to User Priority mapping as per:
>> 	 * https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
> 
> Maybe also add a link to
> https://datatracker.ietf.org/doc/html/rfc8622#section-11
> which defines the LE PHB (Low Effort) and updates RFC 8325 accordingly.
> 
>> 	 */
>> 	for (dscp = 0; dscp <= AM65_CPSW_DSCP_MAX; dscp++) {
>> 		switch (dscp) {
>> 		case 56:	/* CS7 */
>> 		case 48:	/* CS6 */
>> 			pri = 7;
>> 			break;
>> 		case 46:	/* EF */
>> 		case 44:	/* VA */
>> 			pri = 6;
>> 			break;
>> 		case 40:	/* CS5 */
>> 			pri = 5;
>> 			break;
>> 		case 32:	/* CS4 */
>> 		case 34:	/* AF41 */
>> 		case 36:	/* AF42 */
>> 		case 38:	/* AF43 */
>> 		case 24:	/* CS3 */
>> 		case 26:	/* AF31 */
>> 		case 28:	/* AF32 */
>> 		case 30:	/* AF33 */
> 
> Until case 32 (CS4) you've kept the order of RFC 8325, table 1.
> It'd make life easier for reviewers if you could keep this order
> here. That is, moving CS4 after AF43 and CS3 after AF33.
> 
>> 			pri = 4;
>> 			break;
>> 		case 17:	/* AF21 */
> 
> AF21 is 18, not 17.
> 
>> 		case 20:	/* AF22 */
>> 		case 22:	/* AF23 */
>> 			pri = 3;
>> 			break;
>> 		case 8:		/* CS1 */
> 
> Let's be complete and add the case for LE (RFC 8622), which also
> maps to 1.

All comments are valid. I will fix and send v4 for this series.

> 
>> 			pri = 1;
>> 			break;

For sake of completeness I will mention CS2, AF11, AF12, AF13
here that can fallback to default case.

>> 		default:
>> 			pri = 0;
>> 			break;
>> 		}
>>
>> 		am65_cpsw_port_set_dscp_map(slave, dscp, pri);
>> 	}
>>
>> 	/* enable port IPV4 and IPV6 DSCP for this port */
>> 	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_CTL);
>> 	val |= AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN |
>> 		AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN;
>> 	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_CTL);
>> }
>>
>>>

-- 
cheers,
-roger


