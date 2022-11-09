Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B4D62305E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 17:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiKIQpX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 11:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiKIQpX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 11:45:23 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DAE1FCC7
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:45:20 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j15so26646693wrq.3
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+B/DZlmnUVVmtW1rTqtwhIks9ot8Q7pdnxqrZsgcoHw=;
        b=wN7RR+Ipb9QwhtmXdPWwHQDEAWfqcYBImB50//FSmYOFHAYfgRAFMwqJ0byJF/EOLj
         tBnumsbl5i+pyUth2I9NU2rgyR3E+B3YhTB6GTs3a6nMk307dJIUxZ4XsigPtJ/Vbta1
         2DhO90nhM11+XF547CbVb9tGH/s7zNpdyZhacb35Bzz5SNVNXaYKOzETCkw3RRjfvu2z
         RWW241F3mSJlcteho07WTdPZEy1tggmcT7G+fUg/8YKLQ/Dsyl8+ltX0sSlcl5wk91Z0
         TQiy6N6xL3aaewDQt6In9kTB6s7ql89F3ZYkrgba5HBXTdVAhQuqq5eEFWUpuUJYq21P
         k9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+B/DZlmnUVVmtW1rTqtwhIks9ot8Q7pdnxqrZsgcoHw=;
        b=fE/omz/xVvEixvDDNMF7rVOt7VB2kGD6dJKvuwoB+X/mnHDA2DbYmnqG24+Ei5YARM
         WyqZyWVmjaIuhK5DhuYWKyXiBN1KQo0KpEgZlMMx5ItCZJzVoBMitYO/oI3ZZEFIUAIS
         XtiJjT5MdO6RtVb9/nrSDuGP0EOHOUaFjeEg/YO1TS7EIb3jH7MZij90v0pS4M8cyJN5
         ojWrXdioFo9g9B6iE4wyagSY4B/rgMJ9DIUbLh6BXKKy9xlJP1Ukk8utpXVLFfmMaigu
         lxh89sM59h+jFWIiL0um43HZCHx5jDjym0hM1Yih6ltUBjmpbazcPoEjyJ36KWaM4FFW
         0JMw==
X-Gm-Message-State: ACrzQf1ejauvyDWRb8OxCGaRifRDQrguxoNc9vkNfwM7eY/zwr2IUEU/
        LS5qlJ9M8Smb2rj3TpJDiuV05urMMAlCD264cfhPZA==
X-Google-Smtp-Source: AMsMyM51EI3z3+fV13+ZvZRkrHaeThY4Z0deZ+uxqRIEtgCE6TC+ujKo24Us3GLPkbUj/K7KWSKhmWSk+HSlhXTnqao=
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr39225435wrb.45.1668012319491; Wed, 09
 Nov 2022 08:45:19 -0800 (PST)
MIME-Version: 1.0
References: <20221109160904.183147-1-mpfj@newflow.co.uk> <20221109160904.183147-4-mpfj@newflow.co.uk>
 <2af9a47e-acc4-d2f1-8fc9-281385d18d51@linaro.org>
In-Reply-To: <2af9a47e-acc4-d2f1-8fc9-281385d18d51@linaro.org>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Wed, 9 Nov 2022 16:45:08 +0000
Message-ID: <CAAbcLfjR7JZ_W+JoAJ02_4eiVQPZj--=C1-uLjPvRGQYC1dNGw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: nanobone: Enable I2C temperature sensor
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Nov 2022 at 16:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/11/2022 17:09, Mark Jackson wrote:
> > The NanoBone platform supports a temperature sensor on the I2C bus.
> >
> > Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> > ---
> >  arch/arm/boot/dts/am335x-nano.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
> > index cecc2afaeff4..2be831927af6 100644
> > --- a/arch/arm/boot/dts/am335x-nano.dts
> > +++ b/arch/arm/boot/dts/am335x-nano.dts
> > @@ -212,6 +212,11 @@ &uart5 {
> >       status = "okay";
> >  };
> >
> > +temperature-sensor@48 {
> > +     compatible = "lm75";
> > +     reg = <0x48>;
> > +};
>
> This should not work - you put the node in some random place.

Ah yes, that should be within the I2C block.
I'll fix that.

Cheers
Mark J.
