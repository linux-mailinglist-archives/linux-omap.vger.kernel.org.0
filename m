Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E998F27FC21
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 11:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731661AbgJAJBM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 05:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731628AbgJAJBK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Oct 2020 05:01:10 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6F5C0613E3
        for <linux-omap@vger.kernel.org>; Thu,  1 Oct 2020 02:01:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t17so2161456wmi.4
        for <linux-omap@vger.kernel.org>; Thu, 01 Oct 2020 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LCvd+9oMPV1TUiWupBH/r0LupF+7kFOX6DhC7Gcrx0g=;
        b=YR4MIEhAGcvomD/uxMVbUiIe763pjYh55U/6WKdK4ANeEYvJpvBHgTir3soHKMF71P
         AYTqH6nrgBCmxI/LBlS3IhuTQ0XywPfkfloSXMhcqazuIEAwJgweqhvCUPLMGjwFUpzw
         U5t0MUPEclTgs1+05Kiz/OCkn/tBgcluzBtttN1p3Pe/P6aOGSy3RsJujNT5101KictT
         SqZ13V6DEIWcCRn9UvJdvjNLKE1oOGTVJZPtKipBlEi6zRhnlwEBoynnMRi6DFWzLbEF
         Sy2Wto4i8ft6p3F+AiH9+jZHlEQdqs1e+48zEqL1W+DjJk9mSeTsdSjisq02VhbdBNp5
         boKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LCvd+9oMPV1TUiWupBH/r0LupF+7kFOX6DhC7Gcrx0g=;
        b=mGmOssEXx+Orh2XKw+blat5RbzqBTobqI7xZxTGg6r5i42WaVCU2zraMi48/4s5GzR
         AW1x7SBDCi1mqlPe0WpUowrLtyo7WrlF6ZqziAwlTddENedDMlopdYC43VFFeAJPBre3
         RybgHk2YIJsWpSeuyPG2SULlJCLOve73xbyxbPxgWPEIZZBE1IgwUaaJXIALPPIa9vvN
         r7NUneHev6W7onC914aDA6bq71xg+yOgiP1SCxa6K3dJtLFkhbyAcCgTQ6/Wmnl4g1u4
         08aAqC17XxI8x8HLPK9bgQ+Xaeo5cZEvHw/2QF61d32yq5uAv6h+OjRnDHl6e7lzgqtN
         mzUg==
X-Gm-Message-State: AOAM5327kj7sX9apTZEJS+7lInmgCkF9RhTGwlI9rPD5FUgPTGjuVhEd
        la+bmWQvANoiQLXCOSMJO8k17g==
X-Google-Smtp-Source: ABdhPJwTZ1RYKtWIyoBk+8fpiZQFsYIgVtzcvQYqDG+wI52Vzemq2cBusw6V5zUhwT6eqp7ki3sNsA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr7125986wmj.19.1601542867376;
        Thu, 01 Oct 2020 02:01:07 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id i16sm7968008wrq.73.2020.10.01.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:01:06 -0700 (PDT)
Date:   Thu, 1 Oct 2020 10:01:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
Message-ID: <20201001090104.GM6148@dell>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
 <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 30 Sep 2020, Linus Walleij wrote:

> On Sun, Sep 27, 2020 at 1:59 AM Michał Mirosław <mirq-linux@rere.qmqm.pl> wrote:
> 
> > Use regmap accessors directly for register manipulation - removing one
> > layer of abstraction.
> >
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I suppose it is easiest that Lee apply all patches to the MFD tree?

Yes, that's fine.

It won't be for this release though, as we're already at -rc7.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
