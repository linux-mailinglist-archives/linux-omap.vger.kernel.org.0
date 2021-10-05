Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67B54223CB
	for <lists+linux-omap@lfdr.de>; Tue,  5 Oct 2021 12:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhJEKru (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Oct 2021 06:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbhJEKru (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Oct 2021 06:47:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59F5C06161C;
        Tue,  5 Oct 2021 03:45:59 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g10so16999605edj.1;
        Tue, 05 Oct 2021 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIIxJObi+e13NmHv65VtLTgT3/9mPzupU8skdaC+/ac=;
        b=moF1A5AADl4m9a/AWvqtYEGUruMAE24BQ0ekMHjyRw9JBhSB9uLARlzooYReDJm83N
         ZqdWx4rSiCxofnYQHFkq6nlrsxxt/kEarV6q76IpKaWAQy32eZ/m8RgX1O9nGx0PSiwD
         6PuMtSCkfxhff+rgkcMCvv4suLA7jfxXf26my09QMdeEQxBGAi+q3v7CwW4B5kZ+QIQB
         nnV1HhzFapxDw4tKLqLgpExtZBen3LUkgV7bpWQaUK2N6kfsuQsxTwQdZADJTxKomwS+
         4ujkzJMIY908r8OBaw+jXEbwfWMtaamCNi0p9uEc1bzBFtVGY2cSaqp8THtt6Rd20gCh
         ndLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIIxJObi+e13NmHv65VtLTgT3/9mPzupU8skdaC+/ac=;
        b=AugDPtooqHf3ysaed7IFEIiBGeShNnXJXy7XyJeeD6LM7trN5v44WvGWmmKXUycBGY
         sAm8SX35XOgPGHmtKYPu0Jcv7nBEq3cBPa0TW0YcNiv0QhusCgTfNaG5va5eb3yJJm5Y
         56x2we1kmqnT+lgHhN3U4LmJYFXPwaS8ak6tOaAXCrgQm7Qo2MRr5GMsxkzikM6nbCRU
         3D8MJIBzcTBxNbBVPJbkEjaL2M99ft3GLGvfPeDVzKTrtjd10sAz1eTR4GWassQa4m2G
         9UB7mPYVqVJTE3Xt4pkdr8Ke6enMYNboOpKu9La6k+Svz4Ry9XPJltLpmdfSiRvkbjpL
         C6LA==
X-Gm-Message-State: AOAM531BVWQVGCHEBX67RkiQDnoRx1l+X5nJiHIojWi4F+ClNSUtS0yq
        JdxStK6AssikFS4ldY79N2YceiU84IyYRThzpQ/bspXb
X-Google-Smtp-Source: ABdhPJyLahJVk0oA8O9uOJ3sJ4bZ5NZT4ZV1Vn9RfrurcfjD3ViTjOfDDkA8qpc8CM24WI20/bKb1FTujaVHOeqsN84=
X-Received: by 2002:a50:be81:: with SMTP id b1mr26068397edk.59.1633430757237;
 Tue, 05 Oct 2021 03:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210930065733.31943-1-tony@atomide.com> <20210930065733.31943-2-tony@atomide.com>
 <CAHCN7xJ_28ALRds4rduQP3LZoEK9y6mdia_czKU0DWse7FnjoA@mail.gmail.com> <YVwHEqaAtk0MFwmR@atomide.com>
In-Reply-To: <YVwHEqaAtk0MFwmR@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 5 Oct 2021 05:45:46 -0500
Message-ID: <CAHCN7xLBi09oHa75SxOc=CJ3hHZCNTxn6Z7m0NwuMcLY8+UL6g@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: sdhci-omap: Update binding for legacy SoCs
To:     Tony Lindgren <tony@atomide.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 5, 2021 at 3:04 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [211002 13:29]:
> > I noticed that you added omap3 compatibility to the driver and the
> > bindings, but no device tree changes for omap3.dtsi to enable this.
> > Is there anything holding back?
>
> There is at least the wl1251 quirk handling missing as I mentioned in
> the cover letter. I guess we could enable sdhci except for wl1251 users
> though.

Sorry, I guess I missed the cover letter.  I didn't see any obvious
differences between the drivers other than the hsmmc driver enumerated
before the DMA, so it threw some splat indicating that.  The newer
driver appears to enumerate after the DMA, so that message
disappeared.

>
> > I modified omap3.dtsi and changed the compatible flag to
> > ti,omap3-sdhci and it boots from SD card just fine.  For some reason,
> > I cannot get the wl1283 to function, but the driver probes, so I need
> > to spend some time investigating this.
> >
> > If i can get my wl1283 working again, I'll reply with a tested note.
> > I hope to have more time tomorrow, but i can't do it any more today.
>
> I don't have wl1283 omap3 devices online, but I have tested that the
> sdhci patches do work with wl12xx and mwifiex drivers. Did you figure
> out why your wl1283 is not working with sdhci?

I did get it working.  It was a MAC address issue.  I didn't properly
set the MAC address.  Once I did, it worked just fine.

I think I sent a 2nd reply with a tested-by message.

adam
>
> Regards,
>
> Tony
