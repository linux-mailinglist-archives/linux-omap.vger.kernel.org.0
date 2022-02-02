Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2674A7A8D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Feb 2022 22:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347661AbiBBVgM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Feb 2022 16:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbiBBVgL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Feb 2022 16:36:11 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF2CC06173B
        for <linux-omap@vger.kernel.org>; Wed,  2 Feb 2022 13:36:11 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d18so408984plg.2
        for <linux-omap@vger.kernel.org>; Wed, 02 Feb 2022 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MOimAmoAOPfxgkWePJ3JiDN9ly5dvPP67ZR3jfbjMUg=;
        b=pPXBoTGgijMdCibrlpp1eVq5j5ImtRxSed0OIMHqKD0kxqkngejwYD73KVPYelfCvn
         m1L1SKABywGyAVt79zvVpuq+p72IlerPPyVF7RwAa6wFcEoHIE+W2fYn9aU8oECZriAt
         OsOKtVurQee7YXB6+sEzSZdSp8r5riWUbhSbFqlsICmFOzbn1ECQQg/jQlm7CMKCEtny
         fRxud5D8zeHtVWwh5GK23cr8Oq1ziPa/DCcU4dcjKI051E5uAh3WCs+6WRlxbRKU48ZN
         +RNuE7dD7arHpJWvY1Hqa1P+mBEMSakgHfZB7TDE5jT/PyheLoAtmg9ZEFdlwixhc7ba
         6Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MOimAmoAOPfxgkWePJ3JiDN9ly5dvPP67ZR3jfbjMUg=;
        b=eI4Q5pZ7CTfNim0cJQauFoCkzQaZsfjfxQK3KdmPIhYt7Oz0tm6fZoB7F1srJn4ItS
         3bJWqZOn/mSR/ZVjddfLJIlSadj4e8u+EGNPkVdfUiAZhzev2W4PtOPREBfDZYtVZdLv
         pQjwHvwZ+6f5wVKxf9vcebPGLnImFlorkcMDDxvlqeZSQX5gf6CNimAzaI9kk6HFJp1G
         T50TyFMjQ/GazIGHBI+Kvxbr+tqNHN8TEzds3MIeZoNzn5FZ1NE2pG3yCI2gEmlJy4xA
         CA7KHld9P6KYv0egYUu/h0ahjrcbkl3OEe9E50pAI331UmYNXxZmmw5HSuwmhas9TR9l
         Ii6g==
X-Gm-Message-State: AOAM5321l07MA9VPZ4J8NbEOKcF2WWyXxnc0f/Xnb11ivw/4eVWZUJUi
        14vRGhCNprKAFkLLpXZYcdvS0w==
X-Google-Smtp-Source: ABdhPJwNQzY6gGbj9JTumO6K6dA0tSnzkaTG5kYM9FDLzT4mNpoEtVrvRYTPbs3JiDGQpTvlO9OSmQ==
X-Received: by 2002:a17:90a:3e4a:: with SMTP id t10mr10312952pjm.70.1643837770937;
        Wed, 02 Feb 2022 13:36:10 -0800 (PST)
Received: from x1 ([2601:1c2:1001:7090:9646:73e6:2457:2f0f])
        by smtp.gmail.com with ESMTPSA id h11sm15405022pfe.214.2022.02.02.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:36:10 -0800 (PST)
Date:   Wed, 2 Feb 2022 13:36:34 -0800
From:   Drew Fustini <dfustini@baylibre.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>, khilman@baylibre.com
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: fix regression from
 errata i940 fix
Message-ID: <Yfr5YufU9W8Zx/iP@x1>
References: <20220202212554.1316032-1-dfustini@baylibre.com>
 <69b94cab-43fb-23a7-5819-66a37205bd23@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b94cab-43fb-23a7-5819-66a37205bd23@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Feb 02, 2022 at 03:33:45PM -0600, Suman Anna wrote:
> On 2/2/22 15:25, Drew Fustini wrote:
> > The existing fix for errata i940 causes a conflict for IPU2 which is
> > using timer 3 and 4. From arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi:
> > 
> >   &ipu2 {
> >           mboxes = <&mailbox6 &mbox_ipu2_ipc3x>;
> >           ti,timers = <&timer3>;
> >           ti,watchdog-timers = <&timer4>, <&timer9>;
> >   };
> > 
> > I discovered the timer conflict from when booting mainline on a
> > BeagleBoard X15 (AM5728):
> > 
> >   remoteproc remoteproc1: 55020000.ipu is available
> >   remoteproc remoteproc1: powering up 55020000.ipu
> >   remoteproc remoteproc1: Booting fw image dra7-ipu2-fw.xem4
> >   omap-rproc 55020000.ipu: could not get timer platform device
> >   omap-rproc 55020000.ipu: omap_rproc_enable_timers failed: -19
> >   remoteproc remoteproc1: can't start rproc 55020000.ipu: -19
> > 
> > I modified the errata fix to use timer 15 and 16 instead which resolves
> > the timer conflict.
> > 
> > Fixes: 25de4ce5ed02 ("clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940")
> > Link: https://lore.kernel.org/linux-omap/YfWsG0p6to3IJuvE@x1/
> 
> Suggested-by: Suman Anna <s-anna@ti.com>

Yes, thank you for adding.
