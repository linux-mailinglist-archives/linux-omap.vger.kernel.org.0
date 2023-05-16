Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC72B704D6A
	for <lists+linux-omap@lfdr.de>; Tue, 16 May 2023 14:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjEPMHt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 May 2023 08:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbjEPMHs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 May 2023 08:07:48 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC9459FA
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 05:07:43 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-559f1819c5dso204098997b3.0
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684238862; x=1686830862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXBzkr7XTYihjpoMOMSdGJ+v/IJspSyEie+tjErWmBg=;
        b=svJkFnnTK0Qk1XY5JfSqDfIvtnPZn8bTj2//4u5xhU4QRrZLBU0N6aLp5W2Q1Jgk2e
         LLFwpb5BcO8PwnC/j9ZM4RvXQCwp9hzN8w3Gz8GaIjNOfNS9BJcMSCn4JJeXfaCR9Vva
         iLd5dEis+8A05OPGeoW8S/hjB1gwoGeqqADX+7+7yUmHHyPOINtiPt+9puUY+dfs3Q4+
         JFJyp3pRbzSh89f3S8mgKUfegD/Og8OTAt3kdYJsP3raSWzVR804dTsKY+IaP/tixHoU
         QqwpExAEtMQiAfeqvIYrcptwBJuouWk5b2nNTcevoGf/B4EoeaBrTU1y3qg1ayj8RLNK
         tTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684238862; x=1686830862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXBzkr7XTYihjpoMOMSdGJ+v/IJspSyEie+tjErWmBg=;
        b=TVfSf1xJe/joRxV5hbOfKNfNjj2MejUs8ddgacrwj4/Jd+Yl8TgzSLsDUEcQUTXKH1
         2qmu9D+3XxK8VGHWCijR2/zbZIWUo3BJco95qiJ3E+fndkDsu0v7iXiJybjnyBEIm2Rx
         zIZ+dg8e8D+PzAMw6Uh/Bd8aOhmZNt8Uy2w3jNhOQa868cCpj+/obcITvoXXlGLpTydm
         RPHLvo1A2QX0XvVIFbJnNfWX8MG9ss6PaJkb6jt1C3IPIF5LHLJzXdppsesp6cNPv5/y
         SQBYCy4JF/1YHEPZBdDKH+IVgJwJ+4XEGaw7pln2c3eLnXVWBCun5ac1sPca7cifRpIl
         oiPg==
X-Gm-Message-State: AC+VfDxGN4hpWVhI35/gCnpO7hQnMvvLJsWw8o3j1lpp6pzpADPh8NBg
        lvtCCDK1neoL3DUWhZ8xyAMJvd12ZmkuNUCoeLNYpP8bhMzN0G4I
X-Google-Smtp-Source: ACHHUZ7AAoHWKBCqPnMMtbU7pv68BVqjOLKj9mnRi/mT9BaVrD0v+kdG6baQkUtrchKiEDckPNZNjvs6YZyQ/Z6fjVo=
X-Received: by 2002:a0d:cb01:0:b0:561:a80b:6647 with SMTP id
 n1-20020a0dcb01000000b00561a80b6647mr579558ywd.45.1684238862573; Tue, 16 May
 2023 05:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230430093505.561265-1-linus.walleij@linaro.org> <20230515210254.GA271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230515210254.GA271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 14:07:31 +0200
Message-ID: <CACRpkdYauX+Q2p+Nccxmd__fxjEjyGvs=Oysv-5BaArSScV2wg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 15, 2023 at 11:02=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> There is still a problem that smc_irq is not working. It seems when I
> tested the previous version, I only quickly checked that the eth0 again
> probes and the link comes up, without testing any actual traffic - sorry.
>
> It seems the irq is stuck hi:
>
> gpiochip1: GPIOs 208-223, parent: platform/omap_gpio.1, gpio-0-15:
>  gpio-208 (                    |smc_irq             ) in  hi IRQ
>
> To fix it I had to add:
>
>         irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_RISING);

I just added that onliner, it gives a nice symmetry to the CF card
IRQ.

> But I'm not sure why this is now needed?

Me neither. I hope some people will test the other boards as well,
or I will fix them as they report breakage, as is custom.

Yours,
Linus Walleij
