Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89ECC56D3FE
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jul 2022 06:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiGKEgB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jul 2022 00:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGKEgA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jul 2022 00:36:00 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C344140A6;
        Sun, 10 Jul 2022 21:35:58 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31cf1adbf92so37470617b3.4;
        Sun, 10 Jul 2022 21:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRdehC+r8UzViGQOZMjdVjQxkYFAGAfNZIwZtZap6fI=;
        b=K5ScVq0FQGwSb49KtBYTbPyODHSDeFNoVsu88KKg1san59V7FH/So5SnA3dOtVCPg8
         +kyGUxfCZzZODJUeJhw+++ZGuzRkrV8L684y4EX6/NWb5/cXnQ60ZQ7z53G3tCONrXWW
         FxRViNvFdQDyDLx5GSe2+Iskh+fAuesoszUGizcgkd0anqia8hvfNgemADpt1/XSiJoh
         tWmqNO7cdJsLAUOhgwNvkRWOfYzP86GOM73R8+QkCxDHXHVwPTYKPhnXCgSWjG4V4PgQ
         5b11MC6QhdWdyQ99DWz7xzmwWzdCU5hEll9cB4TzGGuveZafXAaZUrb7A5vRsYbLhSvk
         W20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRdehC+r8UzViGQOZMjdVjQxkYFAGAfNZIwZtZap6fI=;
        b=JCklaXGPogDQDxef3iP/6QGKRGp+7knGXZmhTqkWpStMPX344BhJAMtnfIz9HGsh/G
         d88H1vY5HtbL0sHKT/U2yhjLwHn5GiLacLj0DP0A4waNK7XP8u+Dxp5eYnJcEE7K4zrz
         WXxTqZr0DxlPeLX/bEwTDB0WyRWfujhfyrJatrN5yNIVR36HB61jmuRFdeF988whU0HX
         G29GCE3ZPrhSFQphK7AZCBp1eZ9O7+/CdtqN2SPfLFcQhmtEvZWphVYrIFo2CRG5qJ25
         smD1aqi+9Nl+JaCb8TIG2IxG8hHway8hGTXmqB27QS7PlY7vOQh+jg7pcKk+JdH9RNI+
         MWsA==
X-Gm-Message-State: AJIora8a1grrFqLnotnjMEfOb4kKItWwgJTr/iO+llU1j9hEtllYd9P1
        XcjhtnJGSHZjTv4r27v4N8+WWkby0fVONVQEoeWaE4X4
X-Google-Smtp-Source: AGRyM1uIkr5tuV17CUKD4ey6NpISfqLYVz7YsDCbAKAnRNIwGZyAxk10p/V2bAEKOEynLEaT9hzq+u6e8fhlAiauc2o=
X-Received: by 2002:a81:9b02:0:b0:31c:9ae4:99ec with SMTP id
 s2-20020a819b02000000b0031c9ae499ecmr17295823ywg.495.1657514157558; Sun, 10
 Jul 2022 21:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220705122355.14854-1-yegorslists@googlemail.com> <c12d9017-41bf-ce13-b0f9-93c608c8c67c@kernel.org>
In-Reply-To: <c12d9017-41bf-ce13-b0f9-93c608c8c67c@kernel.org>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 11 Jul 2022 06:35:46 +0200
Message-ID: <CAGm1_kuswhND7fc0TnZgGH7Cp328OmCu+J40fdJyQd61AdnfhA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos: change nand-xfer-type
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Roger,

On Sun, Jul 10, 2022 at 8:54 AM Roger Quadros <rogerq@kernel.org> wrote:
>
> Hi Yegor,
>
> On 05/07/2022 17:53, yegorslists@googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Use "prefetch-dma" instead of "polled".
> Does using "polled" still cause the issue while Erasing NAND?

Yes, it does.

Yegor

> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Acked-by: Roger Quadros <rogerq@kernel.org>
>
> > ---
> >  arch/arm/boot/dts/am335x-baltos.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
> > index d3eafee79a23..6161c8929a78 100644
> > --- a/arch/arm/boot/dts/am335x-baltos.dtsi
> > +++ b/arch/arm/boot/dts/am335x-baltos.dtsi
> > @@ -197,7 +197,7 @@
> >               rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
> >               nand-bus-width = <8>;
> >               ti,nand-ecc-opt = "bch8";
> > -             ti,nand-xfer-type = "polled";
> > +             ti,nand-xfer-type = "prefetch-dma";
> >
> >               gpmc,device-nand = "true";
> >               gpmc,device-width = <1>;
