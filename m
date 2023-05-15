Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CCE702E2E
	for <lists+linux-omap@lfdr.de>; Mon, 15 May 2023 15:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241320AbjEONdH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 May 2023 09:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241913AbjEONdG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 May 2023 09:33:06 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6349019A6
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 06:33:04 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-55a64f0053fso187105597b3.3
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157583; x=1686749583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jT5dSU6Zc4dw91O2i3tPxNANJ1xgpCSSl93YAr0fv4=;
        b=L9pdyLNRp6p0KFVfgCEkYbfVd4EdUPm31IVizvIsL0o2vUuZ/e9e8NdbLZ/L9raJm1
         MLde6xWkRAAg+V8tEktm4vNHWZFvflNd89LOkGJLdciA2CQ77s6EjjKIpHVcNpkbuGYA
         e0Q3q9El+5/faJoMy2Ozque9ApFZhM/Cr+o8jn8k6mAKv7WVBEGNsRqKipC0pLg07+Pw
         TT0u9dSdG9oFDU33Q1yifLauzuQmB6tPhS0R7/HvSqkqtQF9BxWC8LsBpRyCcWe7ZYEB
         G9j/VdIyTXR8jBubiQKMkM0paeqK2r+kEfZQZWDNyR90zRstr1H8yzCbubpy7h/2BsTL
         Arig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157583; x=1686749583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jT5dSU6Zc4dw91O2i3tPxNANJ1xgpCSSl93YAr0fv4=;
        b=HSTb1RpmyVbhbeFSSBP4ZwzgCiWXKeYM+Ou37JMnmnLM/RjGaWSq4ziMROqojmKQqK
         8pwSSsvSQyAArV9ne56cgXoJAFzv1U7Bje9yscCeaFflXkXextV45SNeEMGf60HuyUM1
         deAMLQlv3IxiNJMXgzpi3wKRuRCtv1SSXhHVQEQknRkJwsT5xTaoIO0RiTo9vDEMoxoq
         xR2LMND8/2QBMtfnV9+i3aBbrlffIRcwAgPNJOQGV8vqRaTdSdkEBBABgEEfvoZV+dpd
         DjSBnsE9T2Unsw9bRTS+iQqBM/avJUV1pZgXrYGQFMPHRt1+rYCdB4iqgE0sVeNPJZfr
         DzWQ==
X-Gm-Message-State: AC+VfDzc6ajQ2UPOsjCHDTMWx9yshpPh09T3alEVY80ivNmZBxHkTxA0
        6v0lXOfEpChZwX3fsaiFuV1Y0DQz8U9XuiKPmZqzOg==
X-Google-Smtp-Source: ACHHUZ72mvZpV7Q5+H9gzW1rSKoG134w2TTs56eGHii26cNc+97o7hYVqZhfi8QqYMVSafH6A+65dhS48i3oxTPErQA=
X-Received: by 2002:a81:4fd6:0:b0:55a:5a38:46e4 with SMTP id
 d205-20020a814fd6000000b0055a5a3846e4mr29630729ywb.47.1684157583622; Mon, 15
 May 2023 06:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230430093505.561265-1-linus.walleij@linaro.org> <20230515123647.GD10825@google.com>
In-Reply-To: <20230515123647.GD10825@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 May 2023 15:32:51 +0200
Message-ID: <CACRpkdYrSUOf0M7+Ub6F5uMAf6MDtK9=GLrdWo_Ey98fCfiv0A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
To:     Lee Jones <lee@kernel.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>
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

On Mon, May 15, 2023 at 2:36=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Sun, 30 Apr 2023, Linus Walleij wrote:

> >  drivers/mfd/tps65010.c          |  14 ++--
>
> Reviewed-by: Lee Jones <lee@kernel.org>

Thanks!

> What's the merge plan for this?

I'll make a dedicated pull request for the SoC tree.

Yours,
Linus Walleij
