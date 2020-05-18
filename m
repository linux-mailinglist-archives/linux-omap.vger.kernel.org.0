Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A391D7B26
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 16:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgEROYI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 10:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgEROYI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 10:24:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44604C05BD09
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:24:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id v5so8195265lfp.13
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n1fBLRPhoaETkliq/A27B/1RTPiV9jHJlDqYtxK0Yw0=;
        b=TNTTmdPizHT9crmFFEjj9L02FrgJrG8L0bUlQVGrvvAH963M6bvF/nW2rf3Gp1o/73
         k7PcRx0EdXy2xcLiIdONyHqqbStU4qU7eGASiXa25+hFP5vC30q6miUEVyYkY5KgvC4k
         /zGKHQZ/uiTrC2U46IjBHynwE2FG1JUVhlKwaCHi5/xLauPlJ/oD/8qqhhgew/Xrx2Q/
         tzl1KqMCLYbSyeGRG1MkqowBeKyhVM/S47EHW7K9JlQyAGNH8j1DlvsN4FL9vrTV499o
         uJKlXDnE8hUNwBcGyAR0TgjgVM9GFlojBk/WbVgFVR5vEgAKK88vNPI5KG9TIpKxBixk
         99tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n1fBLRPhoaETkliq/A27B/1RTPiV9jHJlDqYtxK0Yw0=;
        b=TOQqrqc+FwS4A3kTk6Bn5RPx2+p3U2I3ku8vmLfwhSvd2lk33Ct+rP+cThuCZ8innT
         T/W/vh7XPs3RG6r0HWUBPY4QIuXz49MzIvyNxVkokFwyY438vxQSppUA5HRhWTfLOikF
         zK3ZNSAEG7nYIZM17b+Nc5Hp0b34Slnff6CU9JyK9NoSDVobX4vWo1g8c80r7SLz+boe
         V+GAMdmo/LFu9wCzD52V8lZWFPGm525Oay2dszwgImx3nut++aiBZ+oXkLNuzEOE3ahi
         b9ADXgfifLAxaH7i3PnDrxPc+uqtJ5pseA4pt3pLlG8lNGNDXnjtxH4yxPl7uVNGonK/
         p0tQ==
X-Gm-Message-State: AOAM5316mR0x7Ewg/N51DENTo0he4IxKlH/NcrcOTW7bgcGM1j4rJoaa
        Jo5fqSsK5TDJEsu41463IiabfA==
X-Google-Smtp-Source: ABdhPJz1oUVBZQTXPnfWBabJX27Y9GJSHH/mmmmILTNHRuqsL7eQMEbJSFWn9U8RcWnQA/QURPYc0A==
X-Received: by 2002:a19:4854:: with SMTP id v81mr7521098lfa.189.1589811846308;
        Mon, 18 May 2020 07:24:06 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id 3sm2581016lfq.55.2020.05.18.07.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:24:05 -0700 (PDT)
Date:   Mon, 18 May 2020 16:24:02 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
Message-ID: <20200518142402.GB916914@x1>
References: <20200508165821.GA14555@x1>
 <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
 <875zcty7tt.fsf@kernel.org>
 <CACRpkdZnnRXwv0-71t93HX42jL-muty4yJx5gW6_P3yOM-sGAg@mail.gmail.com>
 <87zha5whf4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zha5whf4.fsf@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 03:34:23PM +0300, Felipe Balbi wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> 
> > On Mon, May 18, 2020 at 10:18 AM Felipe Balbi <balbi@kernel.org> wrote:
> >> Linus Walleij <linus.walleij@linaro.org> writes:
> >> >> gpiochip0 - 32 lines:
> >> >>         line   0:   "ethernet"       unused   input  active-high
> >> >>         line   1:   "ethernet"       unused   input  active-high
> >> >
> >> > Why are the ethernet lines not tagged with respective signal name
> >> > when right below the SPI lines are explicitly tagged with
> >> > sclk, cs0 etc?
> >> >
> >> > Ethernet is usually RGMII and has signal names like
> >> > tx_clk, tx_d0, tx_en etc.
> >> >
> >> > Also some lines seem to be tagged with the pin number
> >> > like P9_22, P2_21 below, it seems a bit inconsistent
> >> > to have much information on some pins and very sketchy
> >> > information on some.
> >>
> >> the pin names match the beagle bone documentation and would help users
> >> figure out which pins on the expansion headers match to a gpio signal.

Thank you for pointing this out.  That is my goal with the line names.

> >
> > OK if it is how it looks in the documentation I agree that is what
> > users need, maybe the documentation is confusing but there is not
> > much to do about that.
> 
> the board has two expansion headers, P1 and P2:
> 
> https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#531_Expansion_Headers
> 
> Pins are always the pin number on the header, hence P2_21 and P1_10 and
> so on.

Just to clarify, the patch was for the BeagleBone {White,Green,Black}
which have P8 and P9 headers.

The PocketBeagle has lower pin count headers labeled P1 and P2.  I do 
plan to submit a patch for am335x-pocketbeagle.dts with the respective
line names, but I wanted to first integrate feedback regarding P8/P9 on
the bone.

thanks,
drew
