Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22BB1D718A
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 09:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgERHLU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 03:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgERHLU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 03:11:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2ACC061A0C
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 00:11:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so8637638lje.10
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vabidfbMFc96pp/HPLlR3jZG3FkUzmqg2LVXthmSJ2M=;
        b=NfE56AHSj2+vxlz/6yUuJTa3t1IV7WenHpdNYEo7f95qJmJJ7+A+i4PfeTiCIrPiWQ
         uYSbSUg13aS4vfJaeyo4jtE6ZbrQ6PhWV2nsbkr+ogLPQ30ZHA1EqWD18NJP4hIn6G4P
         RwcbxQBrPzrrKZXVShOpZv+GAEPFygjSUkP+dLcRxv3Z1CxpQsJhhxVSr+jjv/o4AlLh
         wsC0H7Rt9LcPnL733Y458Bq+7fnwRXuqfAGhr/q0FVs1dT5VwHflTGdw7X1nGTXtt2Wz
         7rvUt/oAzPVBSBYkjjaUrZqOR4LyEYN+kZXN7YN1C1gpvVgr4O2aFpkfXBlHUDzpyk8T
         KNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vabidfbMFc96pp/HPLlR3jZG3FkUzmqg2LVXthmSJ2M=;
        b=RTYn2Wk2UX0qDGK1kg8bWzewbN5CIG7UQXJaPDhuDjYcLuJmem9ttnw0ns8iasazL7
         HR0sUhLjiFmItdQ8g/k3m7lukruCj3HCOMHgd6SBtgnZONGMsBUjsFGUsnm6TlI6x+/D
         hrpFrgozT/RsuzxKxHiZg+SPV9BvccDlTSbMFcQ0Ec79qGuKZI6ZXvQjp0fjjwioXZhC
         5MSXdSo5FOoBYovUTypn+L4Gzx6JmeKLdB7S8YhJ8PvQQ0jr+26JEu9pb9HAkx9ehC4h
         DY4ogyi6qRymLKJdr7ub6Liv+dXTO9vLx7Fl2GdTnCrVoeqBxYxPbQE/EHM0LBDX5+l5
         Ze1Q==
X-Gm-Message-State: AOAM53020248w0w4SDCE9TQXH104FZ7Ch+G2RK1hLRAAkChRlHuJ2q/c
        cfOVcyqp+PAToVORWx4kaLxtPprQ45hOsFnF+Uzyjg==
X-Google-Smtp-Source: ABdhPJw9hkh1xdtF0LAYyj2TI1WiZMc9QwdD8Q3PjEibbo2bM2I8adeqiZA3vX+G4exFdZvSrqFJyEySfS8r7g40xpc=
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr8865566ljd.99.1589785878126;
 Mon, 18 May 2020 00:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200508165821.GA14555@x1>
In-Reply-To: <20200508165821.GA14555@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:11:07 +0200
Message-ID: <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 8, 2020 at 6:57 PM Drew Fustini <drew@beagleboard.org> wrote:

> Add gpio-line-names properties to the gpio controller nodes.
> BeagleBone boards have P8 and P9 headers [0] which expose many the
> AM3358 SoC balls to stacking expansion boards called "capes", or to
> other external connections like jumper wires to a breadboard.
>
> Many of the P8/P9 header pins can muxed to a gpio line.  The
> gpio-line-names describe which P8/P9 pin that line goes to and the
> default mux for that P8/P9 pin.  Some lines are not routed to the
> P8/P9 headers, but instead are dedicated to some functionality such as
> status LEDs.  The line name will indicate this.  Some line names are
> left empty as the corresponding AM3358 balls are not connected.
>
> The goal is to make it easier for a user viewing the output of gpioinfo
> to determine which P8/P9 pin is connected to a line.  The output of
> gpioinfo on a BeagleBone Black will now look like this:
>
> gpiochip0 - 32 lines:
>         line   0:   "ethernet"       unused   input  active-high
>         line   1:   "ethernet"       unused   input  active-high

Why are the ethernet lines not tagged with respective signal name
when right below the SPI lines are explicitly tagged with
sclk, cs0 etc?

Ethernet is usually RGMII and has signal names like
tx_clk, tx_d0, tx_en etc.

Also some lines seem to be tagged with the pin number
like P9_22, P2_21 below, it seems a bit inconsistent
to have much information on some pins and very sketchy
information on some.

>         line  18:        "usb"       unused   input  active-high
>         line  19:       "hdmi"       unused   input  active-high

Similar comments for these.

Yours,
Linus Walleij
