Return-Path: <linux-omap+bounces-2617-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AE9C1D60
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909491C22E4A
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 12:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857F21E882E;
	Fri,  8 Nov 2024 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NbiyaICU"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E361D0F5C;
	Fri,  8 Nov 2024 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070420; cv=none; b=aHdDDI0ia4KuWNbXhb874xqKh1uEO0rjJG3H2rYmB8TIbknKSyMjVrv/62Wlb2k0JhDYTPUPCwPaO4MuXq/w1C9PSguWAY87+2yqmMgQ0R6NfSq4lAsLTiNYdRbBC9nnh7KNiwM4Z9mif8mG/L//vWwdfFySY3kGyTqgo2ndqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070420; c=relaxed/simple;
	bh=rr/x3ww89sV9jqWghsW5iDpF0nmqWuGzXO+2uSnHi0g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRqQERkzD1ZhFwXyWftNi14HHZ0CVPD1hYopEL8m+buITyw7dlCrAGOK7PshKMZA21pUggCaqxrms2mShUhf6fpVPOz66g3tMlK4UOGIQOfhXNTfqTk/2BbQruOudVTPSYZaEx/J10CbQjXMBMgHMUfwzJHbbT3maScyMVotixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NbiyaICU; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8CbrOY2072987
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 06:37:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731069473;
	bh=+LZTSCJ82I2AofMnItCbVv3OHQLGWQAtNHwmmy7zLRs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NbiyaICU0pKnJSpnYAw+VgK/VAEfbDB6EmiwA+pZ4eDgtuV8MTi0sCS0MWy+HKsq/
	 ISyc4vvHot5lJrGu3s7HsMYM/RyLPkZPvj1h8q1HcQpKWcHpkwr4FihL5o3p76dw3z
	 UZB0YXjelxnYtUWJA5b4/z9kagjqt9+gAwrBuOyQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8CbrpK039671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 06:37:53 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 06:37:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 06:37:52 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Cbpes012878;
	Fri, 8 Nov 2024 06:37:52 -0600
Date: Fri, 8 Nov 2024 18:07:51 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Pekka Varis <p-varis@ti.com>
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: ti: am65-cpsw: enable
 DSCP to priority map for RX
Message-ID: <908cc747-18a1-49c0-9b06-1c2f64e4c84e@ti.com>
References: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
 <20241107-am65-cpsw-multi-rx-dscp-v2-2-9e9cd1920035@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107-am65-cpsw-multi-rx-dscp-v2-2-9e9cd1920035@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Nov 07, 2024 at 02:29:30PM +0200, Roger Quadros wrote:

Hello Roger,

I accidentally reviewed and replied to the patch from the v1 series, but
the comments still hold for this patch. For the sake of convenience, I
am providing the same feedback as the v1 patch below.

> AM65 CPSW hardware can map the 6-bit DSCP/TOS field to
> appropriate priority queue via DSCP to Priority mapping registers
> (CPSW_PN_RX_PRI_MAP_REG).
> 
> We use the upper 3 bits of the DSCP field that indicate IP Precedence
> to map traffic to 8 priority queues.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index 0520e9f4bea7..65fbf6727e02 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -71,6 +71,8 @@
>  #define AM65_CPSW_PORT_REG_RX_PRI_MAP		0x020
>  #define AM65_CPSW_PORT_REG_RX_MAXLEN		0x024
>  
> +#define AM65_CPSW_PORTN_REG_CTL			0x004

nitpick: indentation needs to be fixed here to align with the macros
below.

> +#define AM65_CPSW_PORTN_REG_DSCP_MAP		0x120
>  #define AM65_CPSW_PORTN_REG_SA_L		0x308
>  #define AM65_CPSW_PORTN_REG_SA_H		0x30c
>  #define AM65_CPSW_PORTN_REG_TS_CTL              0x310
> @@ -94,6 +96,10 @@
>  /* AM65_CPSW_PORT_REG_PRI_CTL */
>  #define AM65_CPSW_PORT_REG_PRI_CTL_RX_PTYPE_RROBIN	BIT(8)
>  
> +/* AM65_CPSW_PN_REG_CTL */
> +#define AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN	BIT(1)
> +#define AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN	BIT(2)
> +
>  /* AM65_CPSW_PN_TS_CTL register fields */
>  #define AM65_CPSW_PN_TS_CTL_TX_ANX_F_EN		BIT(4)
>  #define AM65_CPSW_PN_TS_CTL_TX_VLAN_LT1_EN	BIT(5)
> @@ -176,6 +182,49 @@ static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
>  	writel(mac_lo, slave->port_base + AM65_CPSW_PORTN_REG_SA_L);
>  }
>  
> +#define AM65_CPSW_DSCP_MAX	GENMASK(5, 0)
> +#define AM65_CPSW_PRI_MAX	GENMASK(2, 0)
> +static int am65_cpsw_port_set_dscp_map(struct am65_cpsw_port *slave, u8 dscp, u8 pri)
> +{
> +	int reg_ofs;
> +	int bit_ofs;
> +	u32 val;
> +
> +	if (dscp > AM65_CPSW_DSCP_MAX)
> +		return -EINVAL;

am65_cpsw_port_set_dscp_map() seems to be invoked by
am65_cpsw_port_enable_dscp_map() below, where the above check is guaranteed
to be satisfied. Is the check added for future-proofing this function?

> +
> +	if (pri > AM65_CPSW_PRI_MAX)
> +		return -EINVAL;
> +
> +	reg_ofs = (dscp / 8) * 4;	/* reg offset to this dscp */
> +	bit_ofs = 4 * (dscp % 8);	/* bit offset to this dscp */

Maybe a macro can be used for the "4" since it is not clear what it
corresponds to. Or maybe two macros can be used for "reg_ofs" and
"bit_ofs".

> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> +	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
> +	val |= pri << bit_ofs;			/* set */
> +	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);

The above readback seems to be just to flush the writel(). A comment of
the form:
/* flush */
might help, considering that other drivers do the same. Also, assigning
the returned value to "val" might not be required unless it is intended to
be checked.

[...]

Regards,
Siddharth.

