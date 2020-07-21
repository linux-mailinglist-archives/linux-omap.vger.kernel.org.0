Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34262284FB
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 18:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgGUQKc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 12:10:32 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35101 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgGUQKc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 12:10:32 -0400
Received: by mail-io1-f66.google.com with SMTP id v8so22011203iox.2;
        Tue, 21 Jul 2020 09:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VwfsV06hD71inBjFyFOL8OsY8zC4624povq1N9705fc=;
        b=UvRI+ZEGhdPp012Mx92PNnr2Bu9Bao+Kl+aRGZC9PBNQhDHkThxMeZTeZUtEwVq7Cy
         1XgpNLdqZQHDGyLV3OOA1CcpR1vs6scyL5fwIZtrojPXry7nYoqVrm7G7nPmA+F/gC4n
         N6/uqMeaunJglT/YD6YH0T1iefdqYylullP7AnAl488BvDzVi5FMwJUtB1W9xGegCMYc
         +fjKZ7+oG4q72u5Z4tqBSL3ZEPwlsy6ov81qTi4w68IP0dteizUGJkAWSBeH8XSzAQJT
         Xle7YhL/MLCMsUt58uyRYXrXYgEWfVAnB1z+vcm0pJDqjuhssNV/yL2vlbnUWFRd/M7y
         fMpw==
X-Gm-Message-State: AOAM531Cp4puLOgXsV7of/WnIvcY4Izipe1DVQvS54isAed5gbrP6/2/
        Mmabd2qHSa7uPLs1EjGX+gnbxbgDSyll
X-Google-Smtp-Source: ABdhPJxdf2sFFoZrRlvrQtZQpOQz8vyHwSZpLmkP5dADwW0WJNMXv9lHuLaPhOMa2aM31cLgfKbrWQ==
X-Received: by 2002:a5d:9699:: with SMTP id m25mr28818001ion.74.1595347831374;
        Tue, 21 Jul 2020 09:10:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e16sm11571007iow.37.2020.07.21.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:10:30 -0700 (PDT)
Received: (nullmailer pid 389136 invoked by uid 1000);
        Tue, 21 Jul 2020 16:10:28 -0000
Date:   Tue, 21 Jul 2020 10:10:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     linux-omap@vger.kernel.org, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH for v5.9] mfd: Replace HTTP links with HTTPS ones
Message-ID: <20200721161028.GA389086@bogus>
References: <20200719195613.61458-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719195613.61458-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 19 Jul 2020 21:56:13 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
>  drivers/mfd/hi6421-pmic-core.c                       | 2 +-
>  drivers/mfd/lp873x.c                                 | 2 +-
>  drivers/mfd/lp87565.c                                | 2 +-
>  drivers/mfd/omap-usb-host.c                          | 2 +-
>  drivers/mfd/omap-usb-tll.c                           | 2 +-
>  drivers/mfd/smsc-ece1099.c                           | 2 +-
>  drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
>  drivers/mfd/tps65086.c                               | 2 +-
>  drivers/mfd/tps65217.c                               | 2 +-
>  drivers/mfd/tps65218.c                               | 2 +-
>  drivers/mfd/tps65912-core.c                          | 2 +-
>  drivers/mfd/tps65912-i2c.c                           | 2 +-
>  drivers/mfd/tps65912-spi.c                           | 2 +-
>  include/linux/mfd/hi6421-pmic.h                      | 2 +-
>  include/linux/mfd/lp873x.h                           | 2 +-
>  include/linux/mfd/lp87565.h                          | 2 +-
>  include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
>  include/linux/mfd/tps65086.h                         | 2 +-
>  include/linux/mfd/tps65217.h                         | 2 +-
>  include/linux/mfd/tps65218.h                         | 2 +-
>  include/linux/mfd/tps65912.h                         | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
