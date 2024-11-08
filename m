Return-Path: <linux-omap+bounces-2615-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA99C1D06
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D260E286244
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9421E7C3D;
	Fri,  8 Nov 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Go7R970h"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B5E1E7C06;
	Fri,  8 Nov 2024 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069049; cv=none; b=r/Auh+Fv/OjqiVRndwaoHV89DckrBWDRRQHPw0Jw0oF/ucZEDAe5WL0EMsitGkCADJce1HK3pW4Xzs85YDJE8CQMmowg2sdCUoIWGyzsSBC7t6sG15ru+wmKFNHaBiit36+HuB4I2C5xLilqyl59l7AJ905im644E+SkBw9nbcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069049; c=relaxed/simple;
	bh=Ldm4gOTIksb3nGyt0Pl1ll27PtjAelWbJrhBkyzYrrk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZGPOzXR6iig9xiBZt5Lj66PAmUeM5ran3bVuIswNNoBVK6iYiCg4I/rFuGe2u8+KSSkenN1zJVVHkGvSQ5azRquvZYhTBVIui0YsjOg2d4HaY4uoxrj8LBRB8jY2/Cu6qNDGji1C2l0zFXvmioOpTDhYnUCcmsQUNnZDzxlIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Go7R970h; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CUUUS067685;
	Fri, 8 Nov 2024 06:30:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731069030;
	bh=mLJWNoZktoBO6v4MYX1aptzzDn/jCQdbA65IirP2CYs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Go7R970hAZD8Dp0jhW+EXrGCw4u+TkKtu5SGWVhtOEFhcv/tZF0RY4alZanxMPVeP
	 0X6bB/KR3pO48ikHRNatEbZU3QOCKGpBUw2mh22WpkkeCqt0VSAvfqnWTslVxkq9Lz
	 +EQQ/p3pzVKxBVXetES6f7Lb40bar0fT+57qKNgk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8CUUBC005948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 06:30:30 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 06:30:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 06:30:30 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CUSlk004575;
	Fri, 8 Nov 2024 06:30:29 -0600
Date: Fri, 8 Nov 2024 18:00:28 +0530
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
Subject: Re: [PATCH net-next 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Message-ID: <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Nov 05, 2024 at 04:18:11PM +0200, Roger Quadros wrote:

Hello Roger,

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

