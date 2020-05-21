Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A407A1DD724
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 21:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgEUTXs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 15:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730146AbgEUTXp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 15:23:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183AAC05BD43
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 12:23:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r3so5880304wrn.11
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fo34Jyqqt3gxat3KrPs3T1U40ZqnzdXLMCRUHY0WScw=;
        b=RPZS8L9I1L4Hr5Yf3I0WZyvWE9tXEyfLro5fAWIp/dmJsPqh+Ut24o0bId4XRFvqDF
         CWNOVdYaeq+l9hSylp41TgmLZtINHkAcksO5wj5BcVbkedhQ49MX9tGUQ/3N+7eUgDkh
         QogS3XHbJg8Eig36uZmDP1zvm10EDs10g1lvXCbmiQ9nQHhVWBDbGS97ToTp8ubt08Ii
         2Xu4qeSds80NBbb1GviJwPnsTO6UbTvu7rXUIIbboDX7pCpmiEmYRoMAGp7jHrS7PIqo
         2hdkDWPEb62boxYvmm6V03Ouq21CCCrrDKietbbJl0gTjuFgBxqPRwLzp8a9BlKUFOeG
         8Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fo34Jyqqt3gxat3KrPs3T1U40ZqnzdXLMCRUHY0WScw=;
        b=Mp7ZKPMKu11cJoYtN4N3/eR1TE87zOaSTQny1edhKpPl+YIWiMoL2qOI6UokauBpTt
         hpA1gpymqNsS8w6EN2cpozDwcy6klnrZgS6tYoLDpFRYhyo0l60sNb7nbgER+W0VLCDt
         A4Jw+RjO+9FDYv169zb1dTKA4F0rtHEf5OssTiSnh1Rmv1AL1N2U5a2iB2gsJ4zjkHlV
         fSR/Enu1zmkQ2ABY0F4A0qSk86BvHAS2CLmeNjiRBLoGoXOywP5f+dytkcaJUI3XXYuG
         0BBtOIgPVr3cnqUg9EC46Eh4mOxQmN4CNaz+T3JB6meWK/Yi3CLlN1/lny+NZpjBA4Hb
         s35Q==
X-Gm-Message-State: AOAM533djMhHVnO1UpXFePn7f/J3ECpPEI+8KC2jZkiIJfxt5TDm+ACv
        u99XMix6PGpJOWLj8GgSkyGPQw==
X-Google-Smtp-Source: ABdhPJy1sEiv5+j8jAF8WOiuIvxBcnPKzxFmdT9P/BihuQi5Njdrqu02Skt8Kb4CXk8rodOlNmPM3w==
X-Received: by 2002:a05:6000:85:: with SMTP id m5mr91049wrx.281.1590089022686;
        Thu, 21 May 2020 12:23:42 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id l18sm7208878wmj.22.2020.05.21.12.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:23:41 -0700 (PDT)
Date:   Thu, 21 May 2020 21:23:39 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux kernel <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH v2] arm: dts: am33xx-bone-common: add gpio-line-names
Message-ID: <20200521192339.GA429020@x1>
References: <20200520214757.GA362547@x1>
 <71dbf4e6-e65b-f001-319c-0b354f675568@ti.com>
 <CAOCHtYiw2jJuzbnW02FUmPy-xmmtErMmow46QQJUMs0VtX=cKg@mail.gmail.com>
 <cdf82f9c-48fb-49a0-99e4-926dc292c109@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdf82f9c-48fb-49a0-99e4-926dc292c109@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 21, 2020 at 08:26:42PM +0300, Grygorii Strashko wrote:
> 
> 
> On 21/05/2020 17:41, Robert Nelson wrote:
> > > Not sure if it should be in am335x-bone-common.dtsi.
> > > 
> > > For example:
> > > am335x-boneblack.dts
> > >    #include "am335x-bone-common.dtsi"
> > >    #include "am335x-boneblack-common.dtsi" <-- hdmi defined only here
> > 
> > Ah crap, yeah that's a good point.. So if we stick it in...
> > am335x-boneblack-common.dtsi
> > 
> > Then the Black-Wireless now has Ethernet...
> > 
> > am335x-boneblack-wireless.dts
> > #include "am335x-bone-common.dtsi"
> > #include "am335x-boneblack-common.dtsi"
> > 
> > It's going to be ugly, copy and paste mess, but i guess we might as
> > well stick it in the device " am335x-boneblack.dts"?
> 
> Seems like.
> 
> Unfortunately, there is no way to partially overwrite "gpio-line-names"
> property.
> 
> -- 
> Best regards,
> grygorii

Thank you for pointing out that those gpio-line-names are really
specific to the BeagleBone Black and not applicable for other boards
like the BeagleBone Green which lack eMMC.

I will post a new patch for am335x-boneblack.dts.

After that is reviewed and applied, I will then create patches for the
the other BeagleBone models.

thanks,
drew
