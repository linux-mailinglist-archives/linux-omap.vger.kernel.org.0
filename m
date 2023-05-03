Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7786F6003
	for <lists+linux-omap@lfdr.de>; Wed,  3 May 2023 22:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjECUZz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 May 2023 16:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjECUZy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 May 2023 16:25:54 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D134783FE
        for <linux-omap@vger.kernel.org>; Wed,  3 May 2023 13:25:52 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-b9ef06cb784so2220326276.0
        for <linux-omap@vger.kernel.org>; Wed, 03 May 2023 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683145552; x=1685737552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gEz7yCW0YNWEyofUMW+bM1YB2JKr4lLhGCi/13fTrc=;
        b=Mzh0ZV1liVt0pO7T3ehH+wp5tHq2eHIvxMQvgVLhBNtjThUcDrX/+aDvPu0tBZ/9ee
         EXtPp3wMLIa74YOBsQ0e08IZyzEb9z2PtCzmiGLSL5FFkcqFzSprSbu/p4OtMtm5Z8vg
         QTb+851VnqyKufW9AlhGHuA8W1rOsuyTf/U1ngEssyK7U0XiMTLfkIYXQJ/3BWdZ/+nL
         IlkiQndW7FfaXvB3Wtdi5hEfH46S40YPblPeGAPLxeQ85pZXExi718VSSliADLafDbtF
         EIagwxP3z0ZUYRpd+UFfoZPqXzZHPfYekCM7c+V8IvPd0peQzIxx4yrWJn2aqzP6n/mT
         v8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683145552; x=1685737552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gEz7yCW0YNWEyofUMW+bM1YB2JKr4lLhGCi/13fTrc=;
        b=W28k5TuXSTlStvCrsARMjehdUSBktyiOo1bibrvr1AmKkS0NxbHAgzmQVqKtc+uGcl
         Tbil3O2fv1k91SBELOqQaXXUDM+FbL1sCHT/m9EwTZv0r2bRp+zx4jb77XnDLrLzNKso
         PvHhktfgEYUm/dIhjrELEO2Sj/D/FYS/agmmkZDQ3MAzolFeSPFTtjfKIWub8HMpFdQb
         V2q6iR2NJ18DfNLfB3n0nQmbJomOOmlBXUGPb8NxuNMG+mGhhDU9+T2CTiefV/98/7sX
         og1IO89ELvotFxMXo4HJTjSPn4gsQrau0uhSMrZRukbJB+4qi5Bi0aUKRQSa2UxjHkdK
         0/cg==
X-Gm-Message-State: AC+VfDw0NnTbHlK0uTSctImP5HRBigiJI6/EFdisHLTo8XTevYuG/o7C
        QujuxcEyhO5l32I+x8GtQVBl1zKGBnudJ0BbS+5APA==
X-Google-Smtp-Source: ACHHUZ6bWBOMBfCcUnb1ZA+ngbZpzrLgmQlXt3j9zhiGPRBmWSduiRqy3n8tV6EAdgHxuWzjmwHy1P//RM78ldQ0LkU=
X-Received: by 2002:a25:fc0c:0:b0:b9e:7ec8:5d41 with SMTP id
 v12-20020a25fc0c000000b00b9e7ec85d41mr5902733ybd.55.1683145551966; Wed, 03
 May 2023 13:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 May 2023 22:25:39 +0200
Message-ID: <CACRpkdaZdxNZ3amHxE44NZOZcVMpBa4Kx126+7WW3XHGM2NU=A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
        linux-aspeed@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
        linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 3, 2023 at 1:03=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:

> >     'gemini' : 'gemini',
>
> This one is also a product name, not a company. Apparently,
> gemini was originally made by Storm Semiconductor, and then
> by Cortina, which was subsequently acquired by Inphi, and that ended
> up in Marvell after the product was already discontinued.
>
> Out of the four, I'd probably go with 'cortina' as the
> directory name.
>

StorLink was the initial company, thus SL3516, SL3512
the name of the chips.

Then that company changed name to Storm Semiconductor.

Git acquired by Cortina.

Then Inphi acquired Cortina.

Then Marvell scooped up the IP.

If we *have* to use a company name I would use storlink,
because the chips are named after that.

Yours,
Linus Walleij
