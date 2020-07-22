Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B48A22915F
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jul 2020 08:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgGVGye (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jul 2020 02:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgGVGyd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jul 2020 02:54:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF8AC0619DC
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 23:54:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so779487wrw.1
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ocBmwtCFiYWP9YFIU9y/qGa4fpuschond1lKiBqRad4=;
        b=IsAoqvXNG2/0xQHeu18hvZcm6DuJpizwx+JDHvWFU2JKIN2MpdQDmUQ+uu2ylHccoI
         rJdblvsBWP/F5sJjt+ptjDC26ZfdRZDhCbl5/c7eJo7gg6xVok0/gXRFbA6bGdlsK+YI
         yJF7m5VWJY+VT/8DasrqeqIwKreZRj2FwcpU2EIGQhCBBj21Cfm4ZQvK9V/QIAM4kUiz
         3WH0GrgLYsyCQQsfK9ZHsB3flBg2QcBZFllL884AZaxPmRmmuNwrn++/k3q19c/wIQZS
         +dSOwzNYmZB0Zawp3c3EYJPI9lVSmHeieq1TmcZpLjVjfJr9v8pU6KcmPjcreQ9qD0LE
         mNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ocBmwtCFiYWP9YFIU9y/qGa4fpuschond1lKiBqRad4=;
        b=IR7JIi/1TNN7uHtARhKZyzn32x5NaMdpFU1pLM7eE70DFtBKLVWfn0QOIiFhQKhJyk
         Ga3/af/yYth1zwvOlfKVy7givhgJw8EVwvb8Ia+yyQVZ9gU3O62OxTvaGPzE2pvTkifY
         lz2gw4fDzrTL0aOg50jQeya/q1w0nzcb7dZk+9EyE2EcS6YafnoNaL+Y7Y5jv8dDIWRk
         fB8WsRjpSDco+U2cvFTmelVqno8+MrVR9Cwyt/RTc+hQ3YOGNHG8EVMvcvP0arjuYq56
         6QWMUxcGh7Z1b6SxKlfPdMv7MeZZaqSsMfLhy7weeSV62V7aWaaUulAZeMgDgHd5nAbA
         jJIg==
X-Gm-Message-State: AOAM533PyptD++UsMJzQLENqDlxr2hT4/xsyA3KZvxQ8Ci11SA6DNzxj
        J9wPqtFKBqA4/frAJeWVjTOJbQ==
X-Google-Smtp-Source: ABdhPJyo10m2wQJAJRAjVOGmLFVQEnAPrhWt00A+y6ezpxtZSlEAclgSzZxiLt39v1L/xOQWpCQkGg==
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr28162290wrb.232.1595400871982;
        Tue, 21 Jul 2020 23:54:31 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id h14sm39439532wrt.36.2020.07.21.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 23:54:31 -0700 (PDT)
Date:   Wed, 22 Jul 2020 07:54:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, tony@atomide.com, devicetree@vger.kernel.org
Subject: Re: [PATCH for v5.9] mfd: Replace HTTP links with HTTPS ones
Message-ID: <20200722065429.GI621928@dell>
References: <20200719195613.61458-1-grandmaster@al2klimov.de>
 <20200721161028.GA389086@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721161028.GA389086@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Jul 2020, Rob Herring wrote:

> On Sun, 19 Jul 2020 21:56:13 +0200, Alexander A. Klimov wrote:
> > Rationale:
> > Reduces attack surface on kernel devs opening the links for MITM
> > as HTTPS traffic is much harder to manipulate.
> > 
> > Deterministic algorithm:
> > For each file:
> >   If not .svg:
> >     For each line:
> >       If doesn't contain `\bxmlns\b`:
> >         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> > 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> >             If both the HTTP and HTTPS versions
> >             return 200 OK and serve the same content:
> >               Replace HTTP with HTTPS.
> > 
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > ---
> >  Continuing my work started at 93431e0607e5.
> >  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> >  (Actually letting a shell for loop submit all this stuff for me.)

I'm guessing something went wrong with your submission, as Rob's reply
is the first time I saw this patch.  Did your bot send it to me?

You really should be fully reviewing anything that gets sent to the
MLs.  "Sorry, I didn't send it, my bot did" is not an acceptable
excuse for inadequacies.

> >  If there are any URLs to be removed completely
> >  or at least not (just) HTTPSified:
> >  Just clearly say so and I'll *undo my change*.
> >  See also: https://lkml.org/lkml/2020/6/27/64
> > 
> >  If there are any valid, but yet not changed URLs:
> >  See: https://lkml.org/lkml/2020/6/26/837
> > 
> >  If you apply the patch, please let me know.
> > 
> >  Sorry again to all maintainers who complained about subject lines.
> >  Now I realized that you want an actually perfect prefixes,
> >  not just subsystem ones.
> >  I tried my best...
> >  And yes, *I could* (at least half-)automate it.
> >  Impossible is nothing! :)
> > 
> > 
> >  Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
> >  drivers/mfd/hi6421-pmic-core.c                       | 2 +-
> >  drivers/mfd/lp873x.c                                 | 2 +-
> >  drivers/mfd/lp87565.c                                | 2 +-
> >  drivers/mfd/omap-usb-host.c                          | 2 +-
> >  drivers/mfd/omap-usb-tll.c                           | 2 +-
> >  drivers/mfd/smsc-ece1099.c                           | 2 +-
> >  drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
> >  drivers/mfd/tps65086.c                               | 2 +-
> >  drivers/mfd/tps65217.c                               | 2 +-
> >  drivers/mfd/tps65218.c                               | 2 +-
> >  drivers/mfd/tps65912-core.c                          | 2 +-
> >  drivers/mfd/tps65912-i2c.c                           | 2 +-
> >  drivers/mfd/tps65912-spi.c                           | 2 +-
> >  include/linux/mfd/hi6421-pmic.h                      | 2 +-
> >  include/linux/mfd/lp873x.h                           | 2 +-
> >  include/linux/mfd/lp87565.h                          | 2 +-
> >  include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
> >  include/linux/mfd/tps65086.h                         | 2 +-
> >  include/linux/mfd/tps65217.h                         | 2 +-
> >  include/linux/mfd/tps65218.h                         | 2 +-
> >  include/linux/mfd/tps65912.h                         | 2 +-
> >  22 files changed, 22 insertions(+), 22 deletions(-)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
