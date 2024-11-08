Return-Path: <linux-omap+bounces-2621-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221D9C1F82
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 15:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD018283D6D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 14:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560E11F4295;
	Fri,  8 Nov 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fqRcpZxf"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196BA188CC6;
	Fri,  8 Nov 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076975; cv=none; b=s7yrqacCxzx5nTA/C52jI2p2xTc9FoIVUNsZhM8Bre1vDcMq6kZpC4zzIRxehcv/JcFsY75WAT7nJgM5yJ6bTmf05g237eHOuNfz7HWknYWfFY546FeXYl7wVMAvGXDh/VjYnZD1PDzPMMdU2bOv3HcwduzM7pCLnzv7UZlZuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076975; c=relaxed/simple;
	bh=0vi+xxM9vbYC0ABIEErdvdskYnYP7GEmBfVDVMfmNRw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsLC+5xqqt331YGkjHtVyIyaJ9hd0KN4k1c9PBTNtG2zOwqu8hTMO40WofHo+TdqG6yDS/KQTtYj3u4YEpCXDbQjR1mEHX/50CrEzCnL0mcM2GhrY0pY9GZLpwYZEwcL1Ywc4iE3aWcioSk79u1R/c1i+sElJpEKYQ2iUyJO0to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fqRcpZxf; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Egg15049601;
	Fri, 8 Nov 2024 08:42:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731076962;
	bh=lwaXLo9fSftAJDId5wRFfi2VOW7QLA5Bl3KKudg18sI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fqRcpZxf6F0wkcCRz/30OVau3Yj8NgcLI+lVEGgbfo00GAe2DgZrWJ91qaXpX5TiO
	 Yo5nuc2UhpBrSouiSrdbvewIL3YWrkvOUmNH5xbjnVQMuy+/+qa7oSk0l/GwDfBnAK
	 DpecWhnnGqMWU+PBw8WnjMnF1k70gHGq1IEBaZaQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8EggPe111457
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 08:42:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 08:42:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 08:42:42 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8EgfIO039345;
	Fri, 8 Nov 2024 08:42:41 -0600
Date: Fri, 8 Nov 2024 20:12:40 +0530
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
Message-ID: <208a1472-c69b-4c20-9bb2-25158edfd7d8@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
 <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
 <7ae1ccf9-67c0-45ba-9cb9-886701adb488@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7ae1ccf9-67c0-45ba-9cb9-886701adb488@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Fri, Nov 08, 2024 at 02:55:18PM +0200, Roger Quadros wrote:
> Hi Siddharth,
> 
> On 08/11/2024 14:30, Siddharth Vadapalli wrote:

[...]

> >> +#define AM65_CPSW_PORTN_REG_CTL			0x004
> > 
> > nitpick: indentation needs to be fixed here to align with the macros
> > below.
> 
> It is fine in the code and in my editor in this reply email.

That's strange. But it appears the same to me as seen at:
https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org/
where the indentation looks incorrect.

[...]

> 
> >> +
> >> +	if (dscp > AM65_CPSW_DSCP_MAX)
> >> +		return -EINVAL;
> > 
> > am65_cpsw_port_set_dscp_map() seems to be invoked by
> > am65_cpsw_port_enable_dscp_map() below, where the above check is guaranteed
> > to be satisfied. Is the check added for future-proofing this function?
> > 
> 
> Right, future callers can't be guaranteed to do the check so I'd prefer
> to have the check here.

Thank you for the confirmation.

> 
> >> +
> >> +	if (pri > AM65_CPSW_PRI_MAX)
> >> +		return -EINVAL;
> >> +
> >> +	reg_ofs = (dscp / 8) * 4;	/* reg offset to this dscp */
> >> +	bit_ofs = 4 * (dscp % 8);	/* bit offset to this dscp */
> > 
> > Maybe a macro can be used for the "4" since it is not clear what it
> 
> First 4 was for 4 bytes per register. Not sure if we need a macro for this.
> The comment already mentions register offset and we know each register is
> 32-bits wide.
> 
> We could add a macro for the 8 though
> #define AM65_CPSW_DSCP_PRI_PER_REG	8
> 
> The second 4 is actually 4 bits per DSCP field. I could add a macro for this.
> #define AM65_CPSW_DSCP_PRI_FIELD_WIDTH	4

This looks good to me, but I am fine either way, in case you prefer to
drop the macros.

> 
> 
> > corresponds to. Or maybe two macros can be used for "reg_ofs" and
> > "bit_ofs".
> > 
> >> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> >> +	val &= ~(AM65_CPSW_PRI_MAX << bit_ofs);	/* clear */
> >> +	val |= pri << bit_ofs;			/* set */
> >> +	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> >> +	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_DSCP_MAP + reg_ofs);
> > 
> > The above readback seems to be just to flush the writel(). A comment of
> > the form:
> > /* flush */
> > might help, considering that other drivers do the same. Also, assigning
> > the returned value to "val" might not be required unless it is intended to
> > be checked.
> 
> This was actually left over debug code. I'll drop the readl.

Ok.

Regards,
Siddharth.

