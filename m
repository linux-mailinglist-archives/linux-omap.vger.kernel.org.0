Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91461F43F8
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 19:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733188AbgFIRzE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 13:55:04 -0400
Received: from muru.com ([72.249.23.125]:57470 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733180AbgFIRzD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Jun 2020 13:55:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BB308088;
        Tue,  9 Jun 2020 17:55:54 +0000 (UTC)
Date:   Tue, 9 Jun 2020 10:55:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200609175500.GQ37466@atomide.com>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
 <20200528125323.GA3074222@x1>
 <20200529174037.GT37466@atomide.com>
 <20200608180543.GA2825296@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608180543.GA2825296@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200608 18:06]:
> Tony - would this be how the macro would need to be changed?
> 
> diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
> index 625718042413..2d2a8c737822 100644
> --- a/include/dt-bindings/pinctrl/omap.h
> +++ b/include/dt-bindings/pinctrl/omap.h
> @@ -65,7 +65,7 @@
>  #define DM814X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define DM816X_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
>  #define AM33XX_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> -#define AM33XX_PADCONF(pa, dir, mux)   OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> +#define AM33XX_PADCONF(pa, conf, mux)  OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)

Yes looks right to me :)

Tony
