Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668BA708977
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 22:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjERUYn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 May 2023 16:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjERUYm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 May 2023 16:24:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629B510D2
        for <linux-omap@vger.kernel.org>; Thu, 18 May 2023 13:24:41 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso2217709276.0
        for <linux-omap@vger.kernel.org>; Thu, 18 May 2023 13:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684441480; x=1687033480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sjQ8HMzRnhXDW8nuatwt2iBrGOqn5I8hNTBOm7x6mQ=;
        b=zxWWjgd00k/iw1A+lrsF+hFhJoKWOgPJc79gBxjbvu61cm0l5iaCZuXs67mVWBFgSQ
         FAsLIRMkgf47xkJps6bw0+qn5XZedH9A5+JqTpsHRknWBU5/u4CFI06p3VUzdT7s/ktl
         xkjczAXmFuhK2SzwbwR/ncDcdeMdGaa/xoqsQBYLqb3DTbX3F29LwE3Y5YSxJ25XTgoV
         aDQUByrx8u5bslXwfN0P0L/4i4kKfi8mUyIDfeaUqmBcaQFIC2UXfUVe9ObN+aivVZ+G
         qIkNdT+zkNpnLWApeDtFPS8uvZbsfvkly8EQ4VFJyoR7nwIwLZ3Z55zK7Yc8sXyTcE9R
         zixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684441480; x=1687033480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sjQ8HMzRnhXDW8nuatwt2iBrGOqn5I8hNTBOm7x6mQ=;
        b=PO2nbeOGeAEI2kmd80nWowsRmcBJyQNny766d/KctUATagszx5nbMFupiHiCbcpuuc
         bg5PaEZAYnJsYNsiYqdYlxEPJ/9QpHKrcGRVZPKc4TsxCTOnTRpPZED0OPudT20nY0ON
         C2coZMttTc7muxpkq9n+8+GQpq4UfJ9zUUKJ+WYv4tG0OD33mrBPRxJa9BgDU8b3HMB9
         9QQvC1/lOiQav508ZRlnPXaEQqLVYtsffFYArJA+L4X/WgjY4bdHFepSCWjvoVLg4Kg8
         2pBCslXoHnZbt7/9OQQc5zkpT4ZNOmn6DVCJbY1iW58TTGIX9wgjAdxa4litZyfEBnKs
         2fqA==
X-Gm-Message-State: AC+VfDyh9rohSWdDJCRvoz1YPtn5ZmydWF1/R3xTE08op+9+BTHlVMrU
        C48YL7pZjvd1zfLOlWbnv7rzren4sGf1vun/bqUAcw==
X-Google-Smtp-Source: ACHHUZ5IXHcDuMS9yrSC1G7ZPpfm5/6vhdT3fbCIzUoF51GOJR5dgnBZBzLl4stJzmvENjmLmifkbD72j2POK7Vjb40=
X-Received: by 2002:a25:ada6:0:b0:ba7:4977:465d with SMTP id
 z38-20020a25ada6000000b00ba74977465dmr251521ybi.47.1684441480570; Thu, 18 May
 2023 13:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230517213538.2143792-1-linus.walleij@linaro.org> <20230517221256.GL271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517221256.GL271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 May 2023 22:24:28 +0200
Message-ID: <CACRpkdboOST1SNB4H4ozLeWUxXLc=Gw9wv84OuifwJq4-ZpkAA@mail.gmail.com>
Subject: Re: [PATCH v5] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 18, 2023 at 12:13=E2=80=AFAM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:
> On Wed, May 17, 2023 at 11:35:38PM +0200, Linus Walleij wrote:
> > A recent change to the OMAP driver making it use a dynamic GPIO
> > base created problems with some old OMAP1 board files, among
> > them Nokia 770, SX1 and also the OMAP2 Nokia n8x0.
> >
> > Fix up all instances of GPIOs being used for the MMC driver
> > by pushing the handling of power, slot selection and MMC
> > "cover" into the driver as optional GPIOs.
>
> OMAP2 and N8x0 uses DT, so could the GPIO table data pushed there instead
> of the board file?

The board file is actually supplying "auxdata" which is a (unrecommended)
way of augmenting existing device tree nodes with some extra platform
data.

Nevertheless: it could. The current MMC nodes for n8x0 looks like this:

                msdi1: mmc@4809c000 {
                        compatible =3D "ti,omap2420-mmc";
                        ti,hwmods =3D "msdi1";
                        reg =3D <0x4809c000 0x80>;
                        interrupts =3D <83>;
                        dmas =3D <&sdma 61 &sdma 62>;
                        dma-names =3D "tx", "rx";
                };

As you can see this node has no distinction of the two "slots" that is
used by the MMC, so the device tree bindings will need to be augmented
to define the two slots (I guess as separate nodes?), so we can put the
GPIOs in the right slot.

Then these bindings are text based, so they need to be converted to
YAML at this point, before adding props.

So the task quickly grows a bit out of hand :/ also I feel very insecure
about such things since I can't test it on hardware...

Ideally everything in arch/arm/mach-omap2/board-n8x0.c should be
put into the device tree and/or pushed down into respective driver,
but at least this makes it a bit easier to fix it, I hope.

Yours,
Linus Walleij
