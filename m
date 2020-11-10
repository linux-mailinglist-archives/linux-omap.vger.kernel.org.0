Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7472AD7FE
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 14:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgKJNsx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 08:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJNsx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Nov 2020 08:48:53 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C5AC0613D3
        for <linux-omap@vger.kernel.org>; Tue, 10 Nov 2020 05:48:51 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id w24so3079663wmi.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Nov 2020 05:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/irRG2xVyB+MrXYW7pn63MGWNmHDLhOpvYFveUA+VF0=;
        b=mECjFv5eJoRSLGitl8gIrq4dhiY5HFhzfcKBY95IZntzwaQyfs79wbrmIoBE2V4UET
         A1oN4JoOixHHf+DG4Woj/WyU2UKFPq1XbUrOGJXAfeIzUWIQlegiZbaGph635Zax1k/F
         A7rXqblEt4ZK/hO4bkBvkRWbyI/o2HNfm36ZRwXGDjXNEUDaO9eEFP/IpUdYog5I3+UC
         TjqMaD+yyEYNd2VAkQar2YpmUwmtmeAoOR/PBuMs6zfQg+WcYmRr3Pe2LRQIMR7szvmW
         FJfjYg3neAvUiN2IBBjPexGH3g4+jhhfaBA94nZAH/ro/z1rYfOeaVAWE/ngSq0Lj/Yf
         V9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/irRG2xVyB+MrXYW7pn63MGWNmHDLhOpvYFveUA+VF0=;
        b=LMo02eguVKXjhbfBWXgzgKYBd0+sYgga87jAlWAIOgPSJ7STQYyAZfFkgHdGK2rs+r
         8MpmL+f9kd1vOVXMG8Q58GanXQgYzW6EtNVFS7nyhhR6xTYrqeqWSTtuM/wSAUo/j8Bc
         0FO1GfFWDJtE6ISjEApuEEFAApL5Znh7nf2u4yDTzjCCjYnIqXA4tMdTgfbU5LrvjD5v
         rLfhxUUtBvf7VLWWSjNO840vRaRtL11uvTMRl0bpgwo8NORHyyIl/EDps392M4TNRmAQ
         he3uYH76x+hp/VCSQiBMJ+OmW3EKop7SpI3R1RJ0ww5s9DBHrcyy97xopyGdY1H2zu1E
         SkQw==
X-Gm-Message-State: AOAM532P18OI5iMpBGWcoQShNBE437HS0ElTdikJTFk6uzEqeY4l6kPK
        c6TnZ/3tLWCJWNbzEA0UO19P7A==
X-Google-Smtp-Source: ABdhPJy2WHqNyjwgYOcyRGR8cFbNeeCtWzoyqpsu+IJ1FSAn1ZC5vDcy1JNl9nz+wz2T3D0KPNDRzQ==
X-Received: by 2002:a1c:b0c8:: with SMTP id z191mr4685731wme.99.1605016130163;
        Tue, 10 Nov 2020 05:48:50 -0800 (PST)
Received: from dell ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id o11sm18265222wre.39.2020.11.10.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 05:48:49 -0800 (PST)
Date:   Tue, 10 Nov 2020 13:48:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
Message-ID: <20201110134847.GI2063125@dell>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
 <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 27 Sep 2020, Michał Mirosław wrote:

> Use regmap accessors directly for register manipulation - removing one
> layer of abstraction.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/gpio/gpio-tps65910.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
