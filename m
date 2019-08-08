Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B74886D08
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 00:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404029AbfHHWT5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 18:19:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46268 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390169AbfHHWT5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 18:19:57 -0400
Received: by mail-pl1-f194.google.com with SMTP id c2so44093048plz.13;
        Thu, 08 Aug 2019 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=omRmukneOt0MihHCUXZxNMX0+Ltg0mZt7H7F1zd8n2o=;
        b=lWTD+L5aENuLpdP+hbVz1zW94JBamoAdCqcl86FgB4Gq9OrSkWn2cAWXw3HhPgL/AD
         LiezOx8NTMfm54Zk+tA0F8ccqHvwL4T6yOQTl2KpQW0lxwNsuI0EwgMb9oV8Uf+Ial0k
         AMtVVUM108PnFiS5TUGJO+vV9el6Mh4eHHHwvOJH2GczA9dyg9nroNBmOkKRtFHTsg+g
         IpdES4WsGHSD1kzvb+Etmb3+QFdH+e6Atz+FHIzATLwrK6XczxnXHPhqruYKFDgFvAaD
         b6vG5gNLw2Pm/hvX8D5DtqTVsnkvOHffDD0YLHsR61zX3tL3kDut3H9Qndrwt6kxPC8N
         0/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=omRmukneOt0MihHCUXZxNMX0+Ltg0mZt7H7F1zd8n2o=;
        b=Sz9/2ImB/aJtTAcEQie/OIHPLvaaEVBmDJq7QD9T1Ji37A75FmCpDLrAzmbcDAPmhl
         r2CWtntwwlFXVSo+NiReZk7HKcp3elirDMqssNrXljp2PDnEgpPZ24VIiVU3puDY+yj3
         kEVucEc9XUl6xGzQftDA9JbO1h2uumnnaC6l/eCfUflDdGCYleeA899esiGA4KZzGGVS
         MhuvIzf/nrtn6MVtdI2E5pUOenZpL7Ry/W6BXbp7lICxNn+Id/dDAh3miOLTrun4IavJ
         ytmQwEbEWbzzjXvd0O1K1iW+9uh+bm1iWWnJPwGaFECrRm1cR96TX/eDLLtjXoSG7wW2
         pTAA==
X-Gm-Message-State: APjAAAW9jh9DQx6pBVQTrL4Saklj1WZ/WPwVlM/rzgbr1JUO1Vd9ZmkX
        6qjeo6kZ/pGUOEFv+A6T1T4=
X-Google-Smtp-Source: APXvYqxAqj5pomkBptw7TZm8uK7olIgSEFMF7BjQX2oUK35RHeOgdBG2oB9nWLf4oq+3hoFGh5F+SA==
X-Received: by 2002:a17:902:b285:: with SMTP id u5mr15611069plr.329.1565302795687;
        Thu, 08 Aug 2019 15:19:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s43sm3266138pjb.10.2019.08.08.15.19.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 15:19:52 -0700 (PDT)
Date:   Thu, 8 Aug 2019 15:19:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/22] input: omap: void using mach/*.h headers
Message-ID: <20190808221950.GG178933@dtor-ws>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808212234.2213262-14-arnd@arndb.de>
 <20190808214257.GF178933@dtor-ws>
 <CAK8P3a2TOcjxwCBGkZAhMAf9HuTL=FAB1e0=FAg+oHB0U1nJ0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2TOcjxwCBGkZAhMAf9HuTL=FAB1e0=FAg+oHB0U1nJ0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 08, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> On Thu, Aug 8, 2019 at 11:43 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Arnd,
> >
> > On Thu, Aug 08, 2019 at 11:22:22PM +0200, Arnd Bergmann wrote:
> > > By using the new linux/soc/ti/omap1-io.h header instead,
> > > compile-testing can be enabled, and a CONFIG_ARCH_MULTIPLATFORM
> > > conversion of omap1 may eventually be possible.
> > >
> > > The warning in the header file gets removed in order to
> > > allow CONFIG_COMPILE_TEST.
> >
> > Given that we want to migrate people off this driver everywhere but
> > OMAP1 I wonder why we would want to improve compile coverage of it.
> 
> Mainly for consistency: I'm converting all omap1 drivers in this series to
> not rely on mach/* headers and to let them be compiled standalone.
> The other drivers don't have a replacement, so I could treat this different
> from the rest and skip the Kconfig and platform_data changes if you
> prefer.

Yes, because at least with the version you posted we are losing the
#warning telling people to move to matrix_keypad. We could do:

#ifndef CONFIG_COMPILE_TEST
#warning ...
#endif

if you really want to allow compiling standalone for testing.

Thanks.

-- 
Dmitry
