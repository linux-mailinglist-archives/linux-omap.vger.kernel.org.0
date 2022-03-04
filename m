Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF444CDB1D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Mar 2022 18:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238123AbiCDRmA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Mar 2022 12:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiCDRl7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Mar 2022 12:41:59 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702091B127B
        for <linux-omap@vger.kernel.org>; Fri,  4 Mar 2022 09:41:09 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id e6so8115885pgn.2
        for <linux-omap@vger.kernel.org>; Fri, 04 Mar 2022 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=PVlhcCn7DaGojmQuPVn01R8bc+sVgt8z7aPBiwXDtKA=;
        b=28LE/bh1PCver1vlxXW2uY48K0BNBXlo7W2CUgCSAgdVq+qPP30mJwwvBhfA/6L7Cu
         hMmXie39seY56jl9FnYvsxLKRmtsTVhsSjNcFupD3HGgAj9Y2zD5hHz7NaejIKh6/vm4
         QIU7z8n+FwTUFGeebviFwZXaGZ6LKQg4Tv9CCseXKCXsJhVBZ3rySuMU/0vA7gldpRsw
         Y9XGiIJ63OZWPitaMmqUYd7OSMbs5kGXEvieIpcz6gTRFGAXINhpuArFhnxPaLB6/hJG
         wMiG8AlpP6ECn1vKfBXEpiosjNrKRFEVeojePtYHGAJ2SUacybFgAOIpuZ93ct9IqOIH
         onYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=PVlhcCn7DaGojmQuPVn01R8bc+sVgt8z7aPBiwXDtKA=;
        b=oA4oBv6HdXkX4JJaT7bxsyjTh1G7CNSgb72ass8bVmSdhzti8DREhxL1WZwrHKntbd
         X/4TiDFADVgmFGfOd0RYbI7AfqEK2zmKMZj4ZB4bEdJ9PxQcCakeFpzTdVuaXFIP6RZ5
         0y8oyOgx/NOWE2td4k9dNUAXUNEjWluNauFDj8rCOco6SI/2/WL1vxVO7doOakjLE2Mi
         eFn2qmkRfJY+BfA0L+t/lsZt2CZ3U413Czy5vUAQbGyiibcA15GZPisTCB5Gqf8TVvwq
         iJCkwZZAhzVfOPntvyPL3D2dwbvqSoetXMn+3zXZn/nwIzpIZh5UpOeR+1bsn53qtnXn
         kpug==
X-Gm-Message-State: AOAM53037PTLAlbP0fRO+r96fFX2ipKxIFQ37mW+NJatgYleL7rqp0bO
        VhEi2yDK9FeIkzM6KfpGvrBeUg==
X-Google-Smtp-Source: ABdhPJx8/jcrgsC8eOxqGC4hQISCKORpNObve0/4qNvQ59vUxhPXKYZnwgfx+fCtkkqtGPkIn/S1Dw==
X-Received: by 2002:a63:544c:0:b0:378:907d:1e37 with SMTP id e12-20020a63544c000000b00378907d1e37mr22764324pgm.394.1646415668764;
        Fri, 04 Mar 2022 09:41:08 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm6880950pfi.98.2022.03.04.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 09:41:08 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with
 reserved status
In-Reply-To: <20210611060224.36769-1-tony@atomide.com>
References: <20210611060224.36769-1-tony@atomide.com>
Date:   Fri, 04 Mar 2022 09:41:07 -0800
Message-ID: <7h7d99ehu4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Tony Lindgren <tony@atomide.com> writes:

> Jarkko Nikula <jarkko.nikula@bitmer.com> reported that Beagleboard
> revision c2 stopped booting. Jarkko bisected the issue down to
> commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend
> and resume for am3 and am4").
>
> Let's fix the issue by tagging system timers as reserved rather than
> ignoring them. And let's not probe any interconnect target module child
> devices for reserved modules.
>
> This allows PM runtime to keep track of clocks and clockdomains for
> the interconnect target module, and prevent the system timer from idling
> as we already have SYSC_QUIRK_NO_IDLE and SYSC_QUIRK_NO_IDLE_ON_INIT
> flags set for system timers.
>
> Fixes: 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

I'm debugging why suspend/resume on AM3x and AM4x are mostly working,
but getting the warning that not all powerdomains are transitioning:

   pm33xx pm33xx: PM: Could not transition all powerdomains to target state

I bisected it down to $SUBJECT patch, and verified that reverting it
makes both on am335x-boneblack and am437x-gp-evm fully suspend, and I'm
now seeing:

   pm33xx pm33xx: PM: Successfully put all powerdomains to target state

Note that it doesn't revert cleanly due to some other changes, but this
one-liner[1] effectively reverts the behavior of $SUBJECT patch, and
also makes things work again.

I verified the revert (and hack[1]) on both v5.10 stable and mainline
v5.16 but TBH, I'm still not 100% sure what's going on so looking for
some guidance from you Tony on what the "real" fix should be.

Kevin

[1] 
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c                                                                                                            
index 54c0ee6dda30..82379ff9dce5 100644                                                                                                                               
--- a/drivers/bus/ti-sysc.c                                                                                                                                           
+++ b/drivers/bus/ti-sysc.c                                                                                                                                           
@@ -3304,7 +3304,7 @@ static int sysc_probe(struct platform_device *pdev)                                                                                             
                                                                                                                                                                      
        error = sysc_check_active_timer(ddata);                                                                                                                       
        if (error == -ENXIO)                                                                                                                                          
-               ddata->reserved = true;                                                                                                                               
+               return error;                                                                                                                                         
        else if (error)                                                                                                                                               
                return error;                                                                                                                                         
         
