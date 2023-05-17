Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7605970746F
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjEQVhz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEQVhv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:37:51 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05071BD0
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:37:50 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-561ca1918e5so14932677b3.1
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684359470; x=1686951470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdlAQbq81DCcsXbtEFpAyD/kh0cbBqZeR7woybDeXD0=;
        b=dWvf3h1PFkGLivfpIN9/upczd38EfRcakJ6ptyWYDRtYJCozVeH+OkTtfbUwrAbh9L
         K5gLdFNQEn1wOF83KniFIZHcaf3Dk8R0KcfgGHXQrfgMXkUERRGzYpXDDsoPKC2ybeXt
         xf2HvCVJn0MZzxL4mO+oSC/appokq88u3MqTxGJV4WzDFaQhUQ9pNcG/9N5QatIYXpp1
         acoaKDD0NGk2UmRjxWqhzdM3qOz9B9kkdLruZBtnh2vT7vlPAEU/sQACdZtCQdEjdyRA
         e0JiHUuc4UF1Bc4vh2evj7n33igZAMxHjaY3KEBZQ11p5ZbbPxyNJ46o6QvuVaKD9u7I
         OcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684359470; x=1686951470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdlAQbq81DCcsXbtEFpAyD/kh0cbBqZeR7woybDeXD0=;
        b=PIFviaUNHJG3YJs5m6Gt4M0x8GWDsUVVn5s6pEI5UDq9vCYo+tI266OX5KWwcyukiI
         uaXKzOC83PALQfpsSoupUZLIwHP0+Ybx9PSLA9BaSxfXL9DVPn4JoDeeAYXH/YE3RjMH
         GJDfGIXphgVKrVxLDNA2fsfnnRn0yGYo+AIify0Eqh+Mu9d2+yhjT6KNgNwe6jcux40R
         /Dyz/xZp+OARmiY91nwWbfw/PxWok/FAVJJosDSZN6YHLAg30s2MpMMzW6FMBMqw83E8
         9N/6KZqQStDPOEMMgutAEe5/gF9e7iXPrZzjS0NkKcgniRUP08/ZtkzSERGmYytp6Seh
         aKSQ==
X-Gm-Message-State: AC+VfDxkyZsw/pICOsT2HvNcoXonO5Zz0eJ3B0zjNdwiOKIK+a1LU2KT
        rJqeeCYWfHABuf1N+0l5T3oRh8174Uq/WzmEk7H9Nw==
X-Google-Smtp-Source: ACHHUZ5o/Xv8EuIpfeU7K+xxfRkur4qgVkmmgQudPZq98yYAPj0kdQLk/OiF/Iy/zr2BnUM7VbGE3fvDCulTy14LA9Y=
X-Received: by 2002:a81:83c7:0:b0:559:f029:992d with SMTP id
 t190-20020a8183c7000000b00559f029992dmr37919555ywf.24.1684359470040; Wed, 17
 May 2023 14:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230517210135.2138388-1-linus.walleij@linaro.org> <20230517212358.GK271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517212358.GK271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 May 2023 23:37:38 +0200
Message-ID: <CACRpkdb3+FSLB_2mNRLvmo9749=Dnxu0Nx97YRoux-Emvc1G7g@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: omap1: Make serial wakeup GPIOs use descriptors
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
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

On Wed, May 17, 2023 at 11:24=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> This is omap16xx specific, so only 770 and osk need this.

Aha I get it, I fix!

Yours,
Linus Walleij
