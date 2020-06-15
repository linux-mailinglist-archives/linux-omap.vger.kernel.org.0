Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A171F96E8
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 14:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgFOMpR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 08:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbgFOMpM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 08:45:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382CEC05BD43
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 05:45:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so14480998wmd.5
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5WfldrA7Ybz/CNtCQsbY2j9hmaVRS/lefK2C8B4/ydo=;
        b=R5VktszuPwRyfKbFUb+M5pY4vbiXCrk4+CjaMUdUvbr7PL1EAycwk6hGg4WlqYqmSY
         i46OfPU4CdegDGwNZ89JPs5mBGxAqhTNbEV7Eqxql4wv+MFbyHcmJURiBnibI5m9o+Mz
         95M+LPZV7RdAvnGdDKofnOZsLb4NljOrjzxghwOXeVYOwW1P3B2O7lly8VxrGBEin/5M
         634k7g8/GeaLN9NVEhvjgSLc/+Rv/LlOHfmPtwECdnW8JBSagOi3A4sT3GVVXvf0dhaf
         8WyQqLaEYjxztW7LztMm4qjwAeRjtZoyLIeaw6Fi4uh8tljKNIEpNLRIzQDaD7qBNE/j
         E3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5WfldrA7Ybz/CNtCQsbY2j9hmaVRS/lefK2C8B4/ydo=;
        b=KygGpzr2EznWl0/E6/RgPBZPN4jyHBO/p7rWPRN/V46mwSN5kEiFukT0Wu3JYotX6G
         KPITg1B4scAuPwQW7E0u88IjwXzDM8buD1kClVMI7v6TW/lZMLwCfbYndJsNEU+b+152
         7Z3CPCn+xGwlR1C0c5DswVS3GZCmD0MYOvzJ9WqNGTyZOfl6ZDfgp5B4WdR+wrDfuxwq
         y7e2tlX3pdVwvSPxnfDFSs4t4djwtzS4C++RJzVq2KJa1EFxyQPXwcH7ijFUhPKbCQ0N
         8uQJ872Qpo/PQxVJi5O4Wxw5WG1S3phlj6UCixMAtPwBuATmRwq4BLo5VGwcUYfXgStk
         1LxQ==
X-Gm-Message-State: AOAM531JJU3ug/TCd4um1hSF5zsvGvRp0KxWvJSB1vt04UdRtKsy/kXn
        MQBMvyOhsBQN0gr0HU2JNfIARA==
X-Google-Smtp-Source: ABdhPJyOUgN6W95sji6BAD0z9Le4kY3qbFFlPrhTK7NksEopHHTFOHCgqndp2ELuG3T5LFhG8TYLWQ==
X-Received: by 2002:a1c:188:: with SMTP id 130mr13072660wmb.93.1592225109747;
        Mon, 15 Jun 2020 05:45:09 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id c16sm24705585wrx.4.2020.06.15.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 05:45:09 -0700 (PDT)
Date:   Mon, 15 Jun 2020 14:45:06 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode
Message-ID: <20200615124506.GA3833448@x1>
References: <20200611220951.GA3355634@x1>
 <10637da2-8751-3c6f-cf1e-f0a53cca292d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10637da2-8751-3c6f-cf1e-f0a53cca292d@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 15, 2020 at 12:34:57PM +0300, Grygorii Strashko wrote:
> 
> 
> On 12/06/2020 01:09, Drew Fustini wrote:
> > Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
> > RGMII mode") the networking is broken on the BeagleBone AI which has
> > the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
> > phy-mode = "rgmii" to phy-mode = "rgmii-rxid".
> > 
> > Note: Grygorii Strashko made a similar phy-mode fix in 820f8a870f65 for
> > other AM5729 boards.
> 
> commit ref is incorrect

Do you mean commit ref 820f8a870f65 ? 
("ARM: dts: am57xx: fix networking on boards with ksz9031 phy")

I thought it made sense to point to that commit as you seemed to be
fixing a very similar issue, just for a different phy.

Or did you mean commit ref cd28d1d6e52e ?
("net: phy: at803x: Disable phy delay for RGMII mode")

I believe this is the commit that made it necessary to change the
phy-mode property for the AR8035 PHY.

> > 
> > [0] https://github.com/beagleboard/beaglebone-ai/blob/master/BeagleBone-AI_sch.pdf
> > 
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> > Fixes: cd28d1d6e52e ("net: phy: at803x: Disable phy delay for RGMII mode")
> 
> Pls change fixed tag to
> 520557d4854b ARM: dts: am5729: beaglebone-ai: adding device tree
> as this board DTB was merged only in 5.8.

Ok, will do.

> 
> > Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >   arch/arm/boot/dts/am5729-beagleboneai.dts | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
> > index 9877d7709d41..4c51c6b05e64 100644
> > --- a/arch/arm/boot/dts/am5729-beagleboneai.dts
> > +++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
> > @@ -505,7 +505,7 @@ &mac {
> >   &cpsw_emac0 {
> >   	phy-handle = <&phy0>;
> > -	phy-mode = "rgmii";
> > +	phy-mode = "rgmii-rxid";
> >   };
> >   &ocp {
> > 
> 
> Thanks, pls fix above and you can add my
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> -- 
> Best regards,
> grygorii

Thanks for taking the time to review.

-Drew
