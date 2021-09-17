Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DF940EEFA
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 03:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242157AbhIQB6P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 21:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230135AbhIQB6P (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Sep 2021 21:58:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 185B9610A6;
        Fri, 17 Sep 2021 01:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631843814;
        bh=K80xp7lJmNoCd5xe1Ifms/MzNcVhslWJWYDbBkFwr2o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jTyc7batlnavEEcvJXGxcuUp9iogsnH3kERaCQnMa2/zhBlobST4UbLdUkHo9LNq/
         PRLs/YaXWv2JiTIZgLmQ3VftFNq/KfHkLtdXXC4i+IwKvUn6dTy7ddPxVmpYfAkYHW
         sgFbcGZad8URFzQUBEM+reku4Dh1ngrf7tvKerFKN8lzqvArzv8DrA56Eo1xwGmL8l
         tx4do8C5k3mt9qbw53PBLsuzoloZybV+ICmF2HW8n01Y8TI/uV07R+XSwHLHYNXIHh
         KYP7w0fGNXGX6UUWbUHVx0N3A4+HlALGfBi8i9fAQAqlLuaYw1MHiZmfYQjlqTMETV
         +KAIxTZWQ8RsA==
Received: by mail-ed1-f49.google.com with SMTP id g8so23952695edt.7;
        Thu, 16 Sep 2021 18:56:54 -0700 (PDT)
X-Gm-Message-State: AOAM533r1DuJp99UeJwLwxHuUgO+7HvMhsoIbBOkAmUtD+GSG7PUw/Ll
        pqvgGD4ipNE4BLKYAKOA6Sj/nw70BaeikIp7Jw==
X-Google-Smtp-Source: ABdhPJy8QHoHZsuwob7Tv8fDh7AhsjMo6Uu0UldJ1bFt4f/ry9mRl4pv/jg1jgJa+kiVGAGl1Uq/ZawWqrKAdGbNU9k=
X-Received: by 2002:a50:e004:: with SMTP id e4mr9939154edl.164.1631843812626;
 Thu, 16 Sep 2021 18:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
 <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
 <YUP08Zw/Bgi+zoBK@robh.at.kernel.org>
In-Reply-To: <YUP08Zw/Bgi+zoBK@robh.at.kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 16 Sep 2021 20:56:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJv_=w7z911JSRg609HmGoXQbYK2GQ82xW77c5Jx2f-+A@mail.gmail.com>
Message-ID: <CAL_JsqJv_=w7z911JSRg609HmGoXQbYK2GQ82xW77c5Jx2f-+A@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] dt-bindings: mmc: update mmc-card.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 16, 2021 at 8:52 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 16 Sep 2021 11:55:04 +0200, Mauro Carvalho Chehab wrote:
> > Changeset 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> > renamed: Documentation/devicetree/bindings/mmc/mmc-card.txt
> > to: Documentation/devicetree/bindings/mmc/mmc-card.yaml.
> >
> > Update its cross-reference accordingly.
> >
> > Fixes: 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/mmc/host/omap_hsmmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Applied, thanks!

Now dropped. Not in my tree.

Acked-by: Rob Herring <robh@kernel.org>
