Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705C91F1EB0
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 20:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbgFHSFu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 14:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729979AbgFHSFt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jun 2020 14:05:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C638C08C5C2
        for <linux-omap@vger.kernel.org>; Mon,  8 Jun 2020 11:05:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e1so18437379wrt.5
        for <linux-omap@vger.kernel.org>; Mon, 08 Jun 2020 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OUXB4ipv3XkC/6W1VxF01NhdeM7SHvwRPK5v3pgHlAQ=;
        b=tiqy9JiW208d48gicGNMOVENiNIyyOdHIZNJmeZRYlAyWA9eLf6z5mUTVQVV9WlRS/
         xTcXk7SCX8qAh88P8EMGUbdv53EB6TDh1nexGuHBXIOwZBD4HjtbOTdjMiHhPhVjok+n
         GSxJtzQyQRnJ3cYmbewM3rjwpsMP95e3Iti2/lgdgfcaeMmBomMgbw5/LcpuK6v8H46r
         8YSK5pXHdqAJNtEA2MGbvtJQfwfbXNMhIU2YyJZujiIvFUMmdBr0UkGpbf9WR0Gazg4z
         p55P70VST15PkXCMU9rv882VxygS2V5sy1Uz2T9G95e+CFK7j/i/ZaHTxUWeYTKtC4c/
         Vo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OUXB4ipv3XkC/6W1VxF01NhdeM7SHvwRPK5v3pgHlAQ=;
        b=CWsBcYYXaeT6/Hwa/1vnrSKNTKsM7y33A/E11wEjawPDLCZHIZxSdNxeM/jvK7C36X
         UFGPICNuTJbUaoDaW+o6utQFlemvT7k08kXIBIbLfI77Xyk/Kepk1FkXj3rCVdAPdeT9
         pD7HbN907eU5GprtidzZhphXfp2w+GzMJ/Dk7jeiwV0ZZrjL8znU4oOq2RbHx5UwXV2Z
         xBkdAE3llt4OmTuEvc+eA4cEtwoYK9oDvW9LJVaQLOO7B3+Ga82IxaN/qsXAy4VZY7jz
         el74XOrot1irhv6fPIH8Bj7B54nldpm9+Ahjr31mjz3yOygVDK3WLZz2RKpEC/nl921R
         +dOg==
X-Gm-Message-State: AOAM531vWLeY+y8lH5qiSS0V/xTTf6Fou2iKhAMlKRFR2pZlFZuJa7SH
        7gEiBgnBQ7DdyWLUvLzvgwhqXg==
X-Google-Smtp-Source: ABdhPJwHIIrhB2K980sUcL1OJaJ9tOYPiV5CmqJzMmhIGhWbAkDmtz8x3Y1QiWtka01tl7Ea3CWFfA==
X-Received: by 2002:adf:a51c:: with SMTP id i28mr76253wrb.78.1591639546765;
        Mon, 08 Jun 2020 11:05:46 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id a81sm303773wmd.25.2020.06.08.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 11:05:45 -0700 (PDT)
Date:   Mon, 8 Jun 2020 20:05:43 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200608180543.GA2825296@x1>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
 <20200528125323.GA3074222@x1>
 <20200529174037.GT37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529174037.GT37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 29, 2020 at 10:40:37AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200528 12:54]:
> > Would you be able to describe what you think AM33XX_PADCONF would look
> > like if the mux and conf are seperated?
> 
> Yes it would just slightly change, see your example below.
> 
> > Is there an example you know of for another SoC?
> 
> I think the other driver already keep the padconf and mux separate.
> 
> So not sure where all #pinctrl-cells could be used. It would make
> pinctrl-single.c a bit nicer though, and probably would make it
> easier to implement further features.
> 
> Some hardware may need it to have #pinctrl-cells = <3> if GPIO
> features are there too, ideally pinctrl-single would not even
> care but just work for what is configured for the hardware.
> 
> > Currently, the macro takes dir and mux:
> > 
> > include/dt-bindings/pinctrl/omap.h:
> > #define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> 
> So after fixing up pinctrl-single.c, and changing the SoC dts
> to have #pinctrl-cells = <2> instead of <1>, the macro would
> then need to be:
> 
> #define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) (dir), (mux))
> 
> > For example, in arch/arm/boot/dts/am335x-bone-common.dtsi:
> > AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)
> 
> Yeah so no change needed for the use.
> 
> > I think it might be more accurate to rename 'dir' to 'conf'.
> 
> Sure makes sense to rename it in the macro.
> 
> Regards,
> 
> Tony

Tony - would this be how the macro would need to be changed?

diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 625718042413..2d2a8c737822 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -65,7 +65,7 @@
 #define DM814X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define AM33XX_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_PADCONF(pa, dir, mux)   OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
+#define AM33XX_PADCONF(pa, conf, mux)  OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)

 /*
  * Macros to allow using the offset from the padconf physical address

