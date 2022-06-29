Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6E555FABC
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jun 2022 10:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiF2Ihn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 04:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbiF2Ihm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 04:37:42 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 56AEE3CA5B;
        Wed, 29 Jun 2022 01:37:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2E19F80CD;
        Wed, 29 Jun 2022 08:32:25 +0000 (UTC)
Date:   Wed, 29 Jun 2022 11:37:38 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Liang He <windhl@126.com>, andre.przywara@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm/mach: Hold reference returned by of_find_xxx APIs
Message-ID: <YrwPUgzXgDp5djxM@atomide.com>
References: <20220621091937.4082422-1-windhl@126.com>
 <Yrp8sUMdmfYsiUsD@atomide.com>
 <YrspRE+g7QvzOvgr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrspRE+g7QvzOvgr@shell.armlinux.org.uk>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Russell King (Oracle) <linux@armlinux.org.uk> [220628 16:11]:
> On Tue, Jun 28, 2022 at 06:59:45AM +0300, Tony Lindgren wrote:
> > * Liang He <windhl@126.com> [220621 12:14]:
> > > diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
> > > index 668dc84fd31e..a7368d657aa8 100644
> > > --- a/arch/arm/mach-omap2/pmic-cpcap.c
> > > +++ b/arch/arm/mach-omap2/pmic-cpcap.c
> > > @@ -238,8 +238,11 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
> > >  int __init omap4_cpcap_init(void)
> > >  {
> > >  	struct voltagedomain *voltdm;
> > > +	struct device_node *np;
> > >  
> > > -	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
> > > +	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
> > > +	of_node_put(np);
> > > +	if (!np)
> > >  		return -ENODEV;
> > 
> > Hmm so here you are checking for !np after of_node_put()?
> 
> This is permissible, because the value of the _pointer_ is being
> checked without dereferencing the pointer. So the fact that the
> node may have been freed is actually immaterial.

OK yeah. This is several lines of code to check if something exists.
Maybe we should just add bool of_compatible_node_exists() to simplify
cases like this that does not keep the kfef.

Regards,

Tony
