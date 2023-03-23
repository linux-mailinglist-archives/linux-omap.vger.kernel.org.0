Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99A86C61AC
	for <lists+linux-omap@lfdr.de>; Thu, 23 Mar 2023 09:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjCWIaD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Mar 2023 04:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjCWIaC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Mar 2023 04:30:02 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220DE12CC2
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 01:30:00 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5416698e889so382887967b3.2
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
        b=auh9w4//9ZjxHavJWL3nkpB/8hz0Qp657Qd/SCGI99yNlonXV4rVy5V4S1re8qkcn1
         wkHuP4yLqaLpr3BATeYTwZhpHFNYMfhfFvBhiaCPBw/43c/9AHaP5/WD1W6q26CxW/vS
         lDzn2Qownfc29i6U6Qtbr59OzMfkO34zvh/5tfqdspVIwECXzBhf/LUIKt4b4RECX1wZ
         0CNn004ZOkQV1DzcmtML/tSlFQkB2aeZRstUu/ubRvYRPMUI0u3BBd1ay5qU/mNNTDqk
         sZdrN1sJgL8NQhS71hyQ6ktPfYar/qav4R/fpkO1+qUOzmGfL8gHp/MFV+mULzky+X56
         ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
        b=jpReBuPgxVxjc7+t30WJKwHIu0aYj9Gsq2dZjNOVlTlKu1qK/6OurgJm5gsq4zPrWK
         q87U4Lt8VN9gtY8ETte/q6EZej9hpE1MPTVDPy23xs92bChiluEsZh9r4p6znjzB1SqJ
         zgPmgu01ZRxgOJNoJ7TlYfqLPgDILW/mSrdilH/7gIj/Orau9Bp0xK99Vq/T1KNndvn+
         ZBOQuVtJrjK4Ygf9ikaDvv0LXh/GB6ppGz7Fy8O0Dt4cuhJ3uRDSr3/wJQcEC97Z7EVF
         N8gbedauyP/KVM2titpk5SfSL7vaKirIhRZ98GUU6a/9fJCymMf0lXaPbywvqcxQIqKz
         1YOA==
X-Gm-Message-State: AAQBX9eqXUno6nhtyQiaEuLO+XxbGI8j7BtgDN+JS51Fb56+hVkqMY6b
        Oy0pjZ3AcfW6C2Hq5dvPLgsqnb1hydlvdQylpvLqQ2rsBr7DRKtW0JA=
X-Google-Smtp-Source: AKy350ZNlg5R5/BZzQajdKFhT8TJ5d/EfLNOqmBrkrroUQh7Bq9HML1sAQV9tmcb+eMmwJWymvt43FU84C+ft7dowAo=
X-Received: by 2002:a0d:ec4a:0:b0:541:753d:32f9 with SMTP id
 r10-20020a0dec4a000000b00541753d32f9mr1395590ywn.9.1679560199380; Thu, 23 Mar
 2023 01:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
 <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com> <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:29:48 +0100
Message-ID: <CACRpkdbaCX0Fdr5guWZqCO_iVQrnOMmN-FYMV=LfFDsz9cdULA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sean Wang <sean.wang@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Mar 20, 2023 at 7:18=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> > So I need a new version of this patch before I can apply it
> > I guess, or there will be conflict with Reseas stuff?
>
> Can you just drop drivers/pinctrl/renesas/pinctrl.c from this patch?

You just exposed how lazy I am ;)

OK I did that, patch applied sans the renesas hunk.

Yours,
Linus Walleij
