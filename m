Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135165B9997
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 13:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiIOLaN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 07:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiIOLaL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 07:30:11 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C1223BC8
        for <linux-omap@vger.kernel.org>; Thu, 15 Sep 2022 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TWsIrszG1AUUN64KBWKTE94mHdxzbqFx2i9yzCNJGJk=; b=hK4xxpXftpuWCD6fWdDplvYqAH
        XRbFeOMKdITt9YtoGuIcwtJaOJ/uHCxBGwuM3A68oc3QcQ7BtJpG3khhcK71S3MR2IrKgpHbhpJMx
        oFO6FfNyIjfpOuWWKWV7M07w+o8lMijrlabv0n4bIJyj6hK2ylGaFOHp6gwyfrXlaXSvbxuGFTrzu
        nHyrARqyV3IjlRjNupPFJeD4n5yP1UK9ATGYXvGW0jBhXxTE4KPN078htsYm3i/nvcVEkoe7f6f9T
        BEejtbYE+MPu8fbP8H2Vt7ksSnpymcOLOqDRVnJV8sFG18Lxrh6JZChAvtXpqj0JorabLvbw5zwir
        uR/+fmsg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34346)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oYn4F-0005W9-8M; Thu, 15 Sep 2022 12:30:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oYn4A-0002Zs-EK; Thu, 15 Sep 2022 12:29:58 +0100
Date:   Thu, 15 Sep 2022 12:29:58 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Liang He <windhl@126.com>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, chenmengda2009@163.com
Subject: Re: [PATCH] ARM: OMAP2+: Hold reference returned from of_find_xxx API
Message-ID: <YyMMttSW97iYbkfL@shell.armlinux.org.uk>
References: <20220915014258.3999504-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915014258.3999504-1-windhl@126.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 15, 2022 at 09:42:58AM +0800, Liang He wrote:
> In omap4_twl_init(), we should hold the reference returned from
> of_find_compatible_node() which has increased the refcount and
> then call of_node_put() with it when done.
> 
> Fixes: ccd369455a23 ("ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC")
> Signed-off-by: Liang He <windhl@126.com>
> Signed-off-by: Mengda Chen <chenmengda2009@163.com>
> ---
>  arch/arm/mach-omap2/omap_twl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
> index d4dab041324d..07b5f17066ce 100644
> --- a/arch/arm/mach-omap2/omap_twl.c
> +++ b/arch/arm/mach-omap2/omap_twl.c
> @@ -213,11 +213,13 @@ static struct omap_voltdm_pmic omap4_core_pmic = {
>  int __init omap4_twl_init(void)
>  {
>  	struct voltagedomain *voltdm;
> +	struct device_node *np;
>  
>  	if (!cpu_is_omap44xx() ||
> -	    of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
> +	    (np = of_find_compatible_node(NULL, NULL, "motorola,cpcap"))) {
> +		of_node_put(np);

This is buggy - if cpu_is_omap44xx() is false, then np will not be
initialised. The simple solution is to initialise np to NULL.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
