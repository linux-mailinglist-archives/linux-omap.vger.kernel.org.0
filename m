Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5027A55E6F9
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 18:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiF1QZE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 12:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiF1QYM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 12:24:12 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7234238D9E;
        Tue, 28 Jun 2022 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SY2DY9vW4n9MM8I0vn912TfMcNbEdcHbfEm8uHHbcro=; b=Yym22sGHypQQgdds1PkV606rHC
        0nk0KC34UHLaVZjrS1LcfMAC1c1o5Usn3AyA64++lH1PUcRR4YgCVRLvHzFf5VxwH4Rc7WQbtMQj2
        zDdPA0RVoDqz6Y1pGMJttTKlrLRntJR0B+/8a0bJqBYDiqYlSXAf5QrMZ83llpe+Z0ggiDaHDI8kO
        Orwf1ezdkBa81BWIKw9KXtoR4IBbK5xEtk8BFj9Cd0p5PB2WLjZievHKbcbZa98HRTy92dNNMIGCe
        cgoY030p2Zd6Ar14ncAKEHtgWotgfXrFR5kVT2de56KZv5DnwQzq4Xn7n8M7F2PbU0JJQ/+p55AQ7
        pthTVh4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33064)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1o6Dsm-0001oz-Lz; Tue, 28 Jun 2022 17:16:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1o6Dsi-00051r-2I; Tue, 28 Jun 2022 17:16:04 +0100
Date:   Tue, 28 Jun 2022 17:16:04 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Liang He <windhl@126.com>, andre.przywara@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm/mach: Hold reference returned by of_find_xxx APIs
Message-ID: <YrspRE+g7QvzOvgr@shell.armlinux.org.uk>
References: <20220621091937.4082422-1-windhl@126.com>
 <Yrp8sUMdmfYsiUsD@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yrp8sUMdmfYsiUsD@atomide.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 28, 2022 at 06:59:45AM +0300, Tony Lindgren wrote:
> * Liang He <windhl@126.com> [220621 12:14]:
> > diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
> > index 668dc84fd31e..a7368d657aa8 100644
> > --- a/arch/arm/mach-omap2/pmic-cpcap.c
> > +++ b/arch/arm/mach-omap2/pmic-cpcap.c
> > @@ -238,8 +238,11 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
> >  int __init omap4_cpcap_init(void)
> >  {
> >  	struct voltagedomain *voltdm;
> > +	struct device_node *np;
> >  
> > -	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
> > +	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
> > +	of_node_put(np);
> > +	if (!np)
> >  		return -ENODEV;
> 
> Hmm so here you are checking for !np after of_node_put()?

This is permissible, because the value of the _pointer_ is being
checked without dereferencing the pointer. So the fact that the
node may have been freed is actually immaterial.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
