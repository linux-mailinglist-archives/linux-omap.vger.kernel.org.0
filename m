Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744F8D13C5
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 18:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731168AbfJIQOg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 12:14:36 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:58394 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbfJIQOg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 12:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UijyCer4OUN5eEElHKm/eMJByc5emA01vxX2Cs2zO/g=; b=JjcNe/0a3WIMrZSOZNK+M8m/i
        dNNTIIkD771PD5Rc4fqbhSw2jXBpX2MMpN5lLzZEjzWX8pKTQyCjx5AXyuH+2yArTKWTkCg6CvHDM
        vY0bmLWi4GgkETi6iqWhWi5vT7yoGqwZjltEdpXZoGY1AYXG8iXXzWpbLhy9oJsCDy1BKIfkm8Ag8
        Y3+zBSb6iQ9XENF2vbntrPzASEMsCgEkWA0VwbM4InKwjVnQzq7I7UsSNX20cECEHI09oH/4sUtmA
        OTnmHnGf0M+PvKERHfj32Fv/rWOq5Ut+NtEZylL9SoH71daS1kz653VQgYxID+jc7vBXd+x6ZKiE5
        2V0cdoRjg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42014)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iIEbZ-0002Vj-ET; Wed, 09 Oct 2019 17:14:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iIEbY-0007q4-3M; Wed, 09 Oct 2019 17:14:24 +0100
Date:   Wed, 9 Oct 2019 17:14:24 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: force iomem for omap_interconnect_sync
Message-ID: <20191009161423.GB1337@shell.armlinux.org.uk>
References: <20191009133902.28405-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009133902.28405-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 09, 2019 at 02:39:02PM +0100, Ben Dooks wrote:
> Force the type of omap_interconnect_sync to avoid the
> following sparse warnign:
> 
> arch/arm/mach-omap2/omap4-common.c:142:27: warning: incorrect type in assignment (different address spaces)
> arch/arm/mach-omap2/omap4-common.c:142:27:    expected void [noderef] <asn:2> *static [toplevel] sram_sync
> arch/arm/mach-omap2/omap4-common.c:142:27:    got void *
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-omap@vger.kernel.org
> ---
>  arch/arm/mach-omap2/omap4-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
> index 5c3845730dbf..d27c5f61d708 100644
> --- a/arch/arm/mach-omap2/omap4-common.c
> +++ b/arch/arm/mach-omap2/omap4-common.c
> @@ -139,7 +139,7 @@ static int __init omap4_sram_init(void)
>  		pr_warn("%s:Unable to get sram pool needed to handle errata I688\n",
>  			__func__);
>  	else
> -		sram_sync = (void *)gen_pool_alloc(sram_pool, PAGE_SIZE);
> +		sram_sync = (void __force __iomem *)gen_pool_alloc(sram_pool, PAGE_SIZE);

Not sure about this one - did you check whether the memory returned
here really is iomem memory?  If it isn't iomem memory, then the
warning should remain.

Never hide a valid sparse warning - to do so goes against the whole
point of sparse checks.  It isn't "pointing out that a cast is missing,
we must add a cast", the point of sparse is to find and identify where
the code is actually incorrect - in other words, MMIO accessors are
used on memory that is not MMIO, or direct dereferences are used on
memory that is MMIO.  If we go around merely casting the warnings away,
it makes sparse completely pointless.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
