Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97732A669F
	for <lists+linux-omap@lfdr.de>; Wed,  4 Nov 2020 15:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgKDOpY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Nov 2020 09:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbgKDOpR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Nov 2020 09:45:17 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269D3C0613D3
        for <linux-omap@vger.kernel.org>; Wed,  4 Nov 2020 06:45:15 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b8so22342559wrn.0
        for <linux-omap@vger.kernel.org>; Wed, 04 Nov 2020 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9OWAUFWKR6t7bxReqmvWgrAg/iWvkWfLXWjhohm+HkY=;
        b=Nt4YxLTrGbzEFLQlgB6jldAUWPyHzdaO8QckIIG3P91zfSi3pAfwp4Ov+s2oyMqdoX
         HO5TECF9Di+dt+ZvRyQC2Pq/lKyCtBkp5mtGQqV91D5mMgXffpUmxdoqFXq0w0Huwcoo
         2l4H02s1czM/hpASCPdQM/yXVm2DTdQbNHyUnvcEwLlpYbNfv3SJ509j4zbZoBuC3FMZ
         sRaE6OwzA5ESm+ElT72CbZP1uzY50LeB/Vti9QiGUy2DJydm6ZxsT1mn5I68fxCbnR4V
         DnnpB+8TayXBAOgNpNMP+Mz8wMk2YQFcVcO3JZrbFpx97CbVGR8wRnXySYYRqyNQsmMq
         e6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9OWAUFWKR6t7bxReqmvWgrAg/iWvkWfLXWjhohm+HkY=;
        b=WfIKzDZ6KQe1oMp4tkmWpQoPP9lW+MkvfNctXzWlRIurcCv9TQwnkd2Rk7x3n3SVbW
         4OeC7J+iNuxiKeHJbn9KzCyXqgWpHJZOvPV8IxHqU2bcuk5hLUTFsgi2uUXAU1eau2GT
         /lyPl5K3eoeaJYxs8zPRHMYeFc83umK/nBRGPJcMfXCODaWHwLWvkeJjwdcwINYVh2HW
         hLZZL4NhZDYYWalISx6KaT9CUiGKU5P+Nfk1XdjHqRuJ34fZvN8VLtPoqFBXwhDL826C
         b3XacoMM3lLkCMxrJ7QVJt0LtjYk56DAruohnXOb9UJLS/WVrcDL6famkId7hNpCGfdS
         S1NA==
X-Gm-Message-State: AOAM530MGOadmGiLxy5zKkIlphXSlP1+J3R5DFa7BDcCbSsc5s8aBzgF
        FFVlkHDuuWQLL2AwUFjADhsJXQ==
X-Google-Smtp-Source: ABdhPJxHdgs8yA8BtfhGVcKDYrIhx3gbi+u4kSoZc49l5ZGadrCJN8o2W482MgUhplZtxB9qoB0JSw==
X-Received: by 2002:a5d:4c8e:: with SMTP id z14mr1951514wrs.1.1604501113900;
        Wed, 04 Nov 2020 06:45:13 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id t5sm2608695wmg.19.2020.11.04.06.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:45:13 -0800 (PST)
Date:   Wed, 4 Nov 2020 14:45:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] mfd: tps65910: clean up after switching to regmap
Message-ID: <20201104144511.GI4488@dell>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <8ebfb748eb55b68e5da4c5eefcf708ae9307b418.1601164493.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ebfb748eb55b68e5da4c5eefcf708ae9307b418.1601164493.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 27 Sep 2020, Michał Mirosław wrote:

> Remove wrappers around regmap calls to remove now-useless indirection.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/mfd/tps65910.c       | 16 ++++++++--------
>  include/linux/mfd/tps65910.h | 35 -----------------------------------
>  2 files changed, 8 insertions(+), 43 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
