Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0F07055A6
	for <lists+linux-omap@lfdr.de>; Tue, 16 May 2023 20:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEPSHo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 May 2023 14:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjEPSHn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 May 2023 14:07:43 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3535E0
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 11:07:41 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-55a14807e4cso248993267b3.1
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684260461; x=1686852461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inQ5f7VRz5BOFEfnn5RAjhto61AF05QWWJr9NbIc+z0=;
        b=IV7kVXdwi4x4PcwPjv+BtXQmnqKe7c83SYOcPGXUA1t8eNm3cAcYaEE2FNk24PpE5u
         qmbV4OK6r2BVjSkn5LH26L15qgtXbdSdxdr2qEam9Y9996Q0MGmrSKDhyabUmvxxm3H/
         +ef2oIOGONILaQqvI9UjhwouFY+at/Fb5BuAbYu9Ud0fOInH149sPGu+Tt1Ruk8tPmYA
         Ax5ydboqb7uKoc1vCNs4xGbG4TqoBBRIqdLi4oscZ6LhDJFDr6GnfilQNIh+yYH8IF10
         dUhhnNGF4qQbuIBgmgT/Zklp6j2oiHzBgZIWq5FNhioVeaYO3K+K7qhf8mG83tZhqThA
         IlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684260461; x=1686852461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inQ5f7VRz5BOFEfnn5RAjhto61AF05QWWJr9NbIc+z0=;
        b=KyBwtG2FDBDa0f4bc4Vnqc3gJz/NhJRO3hYdFJkVAe+DrszSUWLlSzG7ratD2aOUM/
         vpj8wo1lmKl+o2eoS4Vq1CDB08KvcfrXcTwHXc7RRG/Zhs39Xg4XlnFOr4aRJZWJu53A
         WaCcL9vrqhmj39lT/ITaPXLNZwaB+y4i4V2JbncRJNjmu3nXyLqgq4/SsXOtSR4rx67i
         oumD5jEW0B6RD78UPK8q3xkuhcWqTrOTqNCKFV6WhgjxaUY/2fWHMPsLyJsm0+ssON+V
         597Z4pv+OEnJ1gYE9bSCAq70eX/oSzfQvYBc4792sdNd6BDnuzUXMWlZV7w8kVX/rtOW
         Y4uw==
X-Gm-Message-State: AC+VfDwjvXDA67yXwD+ARBu+tLCLmJ3UeHkLDGuCeA21tvO34ycRsH+i
        m98XXbf5kZXahDsGL4QXvvL1Qyeg01CC0DBT/Av2Nw==
X-Google-Smtp-Source: ACHHUZ4UmBVtZeZuZXoeN4pttqBDEu4dGrtjsmraWASig/YEZe42jK+t8kt80mgm5i6kdi1orGqxtmDr3G9WbZYaVts=
X-Received: by 2002:a0d:c104:0:b0:561:b5cc:e10a with SMTP id
 c4-20020a0dc104000000b00561b5cce10amr721584ywd.6.1684260461116; Tue, 16 May
 2023 11:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230430093505.561265-1-linus.walleij@linaro.org>
 <20230515210254.GA271152@darkstar.musicnaut.iki.fi> <CACRpkdYauX+Q2p+Nccxmd__fxjEjyGvs=Oysv-5BaArSScV2wg@mail.gmail.com>
 <20230516155215.GB271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230516155215.GB271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 20:07:29 +0200
Message-ID: <CACRpkdaPzr3-ZjqJYeh+0wKPvr+N+Uj1pQjtEgFXm3OCbnq_9A@mail.gmail.com>
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

On Tue, May 16, 2023 at 5:52=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:

> > I just added that onliner, it gives a nice symmetry to the CF card
> > IRQ.
>
> It seems you forgot to add braces as they are now needed for if .. else:
>
> +       d =3D gpiod_get(NULL, "smc_irq", GPIOD_IN);
> +       if (IS_ERR(d))
> +               pr_err("Unable to get SMC IRQ GPIO descriptor\n");
> +       else
> +               irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_RISING);
> +               osk5912_smc91x_resources[1] =3D DEFINE_RES_IRQ(gpiod_to_i=
rq(d));
> +

Ooops fixed it.

> > > But I'm not sure why this is now needed?
> >
> > Me neither. I hope some people will test the other boards as well,
> > or I will fix them as they report breakage, as is custom.
>
> I will try to test all the OMAP1 boards.

Thanks!

I actually have the nokia 770. I will see if I can figure out how to hack
it.

Yours,
Linus Walleij
