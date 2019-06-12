Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3139C41EEA
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408603AbfFLIUx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:20:53 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33639 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404384AbfFLIUw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:20:52 -0400
Received: by mail-ua1-f67.google.com with SMTP id f20so5596568ual.0;
        Wed, 12 Jun 2019 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ybvN6sVNB0HsC9fuhfWLcMT3o1VtdzgctfkIIPGr7rs=;
        b=FY+HAegkbKvwhji5dPWIctT+eCc/3CQZ3IxdR6AixcRxUiLo8OJRW04d6c9Nk/cS+J
         CllGFRNQmGWbZRqFoZioTwCEkD/77sUCfLDkh7+zhLiApjlEtVDYoo0zYjoWQ/Oul9Rq
         qDZoeJhLDkkoZR4vj1PjGYMvtBnd4myQtFDPwIVMdjiojoXzgU9KmEniC0n3AE+kzKdF
         D1xRepleDGLrn9gM2OvfgU8x1PNlEKpAnM0RG68zhzAgcxn0d3Bwwa0hDoDe4iZbSOWW
         8AaruT5X1nFFFvd/pk87kW/1YfFpUDj08q0x0DzhNRRPxpSAX3/auj3ERJl/BcA5+mhg
         EUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybvN6sVNB0HsC9fuhfWLcMT3o1VtdzgctfkIIPGr7rs=;
        b=AG1YGRwUsynQiIvktlnArooCmwLQCrYA5GOKqhkAtPjF0kXKIb2LpX68O3+I6Aphz8
         sfSSRqv/9OiCWTAF8RCvN+vtLE/bdvgck6y0jMDTO2Up0EB0mrVD0a9dtrRRGaK3CdAd
         CMsG/YdSISLU2lK/mg+B3gNsMB0GVyu/fGu4J/aIjB+pqmVld9L01LHI5W74+bgz9bsM
         oQdOaWFN1kS3BagofM7mzYMCjDS8Qf4WbbkCX9tg+PGXpMmn18sgPxChJI7/LU1frLUf
         lYmplBcdPbxz9Fw3vH554VbpFMiheiNiBaSCkMhki4V+FHF9+TOJ307sShUvZQBwoHtf
         0xiw==
X-Gm-Message-State: APjAAAW60Wut4DkGfcFR4LXgb/E5cbBB7g2BHq0rIxnF/sQ/vt02Woma
        xhX2YIIZXirMBY5d6CUx6x7ZuVV7i31mKaHqA3hM6sBV
X-Google-Smtp-Source: APXvYqysZ8g9WLWyZgh6SikGp5P774Pu0gepJoBxs+LwbPb0WTNU3mCFEpZs+WbUWr2XHGxsGORiDNFn4W5nLmzWRcw=
X-Received: by 2002:ab0:4744:: with SMTP id i4mr5899076uac.63.1560327650984;
 Wed, 12 Jun 2019 01:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190611093045.4810-1-yegorslists@googlemail.com> <20190612080421.GC5447@atomide.com>
In-Reply-To: <20190612080421.GC5447@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 12 Jun 2019 10:20:27 +0200
Message-ID: <CAGm1_kufcx3siXKc6EtFJhLQ_K+V7MgVtvZuXeN2YikkPcufmg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, peter.ujfalusi@ti.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Jun 12, 2019 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 02:31]:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The PHY must add both tx and rx delay and not only on the tx clock.
>
> As we're close to -rc5, I applied this against v5.2-rc1 and merged into
> omap-for-v5.3/dt as it seems it's optional or has been broken for a while
> with no fixes tag. After it hits the mainline kernel during the merge
> window you can request it be applied into the stable trees as needed.
>
> However, if this is urgent, let me know what regression it fixes and
> I'll merge it into my fixes branch too.

This is the same fix as 759c962d3c9bb1a60e3b4b780daa66ee6d4be13a:

    ARM: dts: am335x-evmsk: Fix PHY mode for ethernet

    The PHY must add both tx and rx delay and not only on the tx clock.
    The board uses AR8031_AL1A PHY where the rx delay is enabled by default,
    the tx dealy is disabled.

    The reason why rgmii-txid worked because the rx delay was not disabled by
    the driver so essentially we ended up with rgmii-id PHY mode.

It seems to be working in 4.19. So I think kernels 5.0, 5.1 are the
first to be affected. Without this patch eth1 is not working on Baltos
devices.

Thanks.

Best regards,
Yegor
