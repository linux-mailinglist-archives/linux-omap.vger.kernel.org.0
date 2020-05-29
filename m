Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A305F1E8546
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 19:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgE2Rkk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 13:40:40 -0400
Received: from muru.com ([72.249.23.125]:56200 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgE2Rkk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 13:40:40 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E15A78030;
        Fri, 29 May 2020 17:41:30 +0000 (UTC)
Date:   Fri, 29 May 2020 10:40:37 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200529174037.GT37466@atomide.com>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
 <20200528125323.GA3074222@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528125323.GA3074222@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200528 12:54]:
> Would you be able to describe what you think AM33XX_PADCONF would look
> like if the mux and conf are seperated?

Yes it would just slightly change, see your example below.

> Is there an example you know of for another SoC?

I think the other driver already keep the padconf and mux separate.

So not sure where all #pinctrl-cells could be used. It would make
pinctrl-single.c a bit nicer though, and probably would make it
easier to implement further features.

Some hardware may need it to have #pinctrl-cells = <3> if GPIO
features are there too, ideally pinctrl-single would not even
care but just work for what is configured for the hardware.

> Currently, the macro takes dir and mux:
> 
> include/dt-bindings/pinctrl/omap.h:
> #define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))

So after fixing up pinctrl-single.c, and changing the SoC dts
to have #pinctrl-cells = <2> instead of <1>, the macro would
then need to be:

#define AM33XX_PADCONF(pa, dir, mux) OMAP_IOPAD_OFFSET((pa), 0x0800) (dir), (mux))

> For example, in arch/arm/boot/dts/am335x-bone-common.dtsi:
> AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)

Yeah so no change needed for the use.

> I think it might be more accurate to rename 'dir' to 'conf'.

Sure makes sense to rename it in the macro.

Regards,

Tony
