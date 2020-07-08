Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DE02181D7
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 09:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgGHHxl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 03:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgGHHxk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jul 2020 03:53:40 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4220C08C5DC;
        Wed,  8 Jul 2020 00:53:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z2so25540746wrp.2;
        Wed, 08 Jul 2020 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z6+nuHAx7L8u/EGJ0fxzxH9P5Mn+J7bZgvUQH6/6JiE=;
        b=LOnG/4u/IfXDoZja+V359IRXUa777GMUh6ivYJbbH4q3X71H9TB+D6+zxVOIKeAXOE
         ysQynx6nYq1xfJZoWqOewlbDJ5HQFNvj3RoGGpPjcLqsdwC0MLehdixEZXIKMzcq448I
         ugQptdLNzyLveI+oqu/19JPhvmlUMTSYVcSjBbswKNMchb5dnwjx6NzGdH4I2jFZ8AHb
         SNz1Fcr3xkGONcAew1Rv2NS+JP4OnXpc4ch+v0wznqQELoUbiXnfLGSqUwz5lMgcMGMv
         CN0rjhB+xsaK1LbugknbJn3rSDAg8qm3XoGBDAaijqJAR6QW2rrZhLG0X97m0MhYeTcv
         h0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z6+nuHAx7L8u/EGJ0fxzxH9P5Mn+J7bZgvUQH6/6JiE=;
        b=Pew59TPA/Yz9m+Pw5JWgTuob3/3cr4GLWx74BkQtiz6depOe1/lf4Kwphi18d2J0S4
         F/KBUnisSqrrexxdp9AGxxXj79jNkFtwmsOHX3lbwjmo8MmwNq6luqUThx5qNI8vV5PA
         CprqkL/ffW33JoVvfEwBBv/fvAju30HQbAdwDu1+9LMiAz0wKsOKZorIzPlO69umgKVP
         q6qzv5OXt76gcjR+2g/hKLe6zE6E7YN6D2KjYJfzEtXkKWXuQIntHp/BCNBidc5SL6xs
         1HRhiYwIVv/I1Pm8e8yOLJE/eGlRGiB4EPQGSLop/qwtSHVYdJgjxv0kAG9pUvBzW+G/
         GVpA==
X-Gm-Message-State: AOAM530MqJEAZ3FJ8ZXSC6cY1Ff6YUr9HM8rXXwo0SPdgK3ElWzvW4/8
        rgLrVQk50WFptfQisBVVNLI=
X-Google-Smtp-Source: ABdhPJz8A2muEKNqwpqnXdusputoDmaFnzX4LyW0vTh9d2EDx90cds41auLtb5xmTsdRuQdUAC7OMQ==
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr46352817wrw.244.1594194818597;
        Wed, 08 Jul 2020 00:53:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id u1sm5597306wrb.78.2020.07.08.00.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 00:53:37 -0700 (PDT)
Date:   Wed, 8 Jul 2020 09:53:36 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-crypto@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Eric Biggers <ebiggers@google.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 05/13] crypto: sun8i-ce - permit asynchronous skcipher
 as fallback
Message-ID: <20200708075336.GB19609@Red>
References: <20200707063203.5018-1-ardb@kernel.org>
 <20200707063203.5018-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707063203.5018-6-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 07, 2020 at 09:31:55AM +0300, Ard Biesheuvel wrote:
> Even though the sun8i-ce driver implements asynchronous versions of
> ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
> synchronous. Given that SIMD based software implementations are usually
> asynchronous as well, even though they rarely complete asynchronously
> (this typically only happens in cases where the request was made from
> softirq context, while SIMD was already in use in the task context that
> it interrupted), these implementations are disregarded, and either the
> generic C version or another table based version implemented in assembler
> is selected instead.
> 
> Since falling back to synchronous AES is not only a performance issue, but
> potentially a security issue as well (due to the fact that table based AES
> is not time invariant), let's fix this, by allocating an ordinary skcipher
> as the fallback, and invoke it with the completion routine that was given
> to the outer request.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++++++++----------
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  8 ++--
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 

I finally took the time to rebase all my hash/xrng serie on top of this change and test this patch.

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-pine-h64
Tested-on: sun8i-h3-orangepi-pc
