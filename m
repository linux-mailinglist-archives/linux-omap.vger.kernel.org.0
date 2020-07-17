Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864B422467E
	for <lists+linux-omap@lfdr.de>; Sat, 18 Jul 2020 00:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGQW4c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 18:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQW4b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 18:56:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D37AC0619D2
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 15:56:31 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j4so12650657wrp.10
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XSBU/QuoKMLwWIya+pUntB2Jjk6UxC+KfLj3Ajn9LAk=;
        b=ut74ryjSIkFhiCOiWgubGdGIS9RB6Z+4HdCiP0TJ9y5ifuWhBDgBQEcHPCwgaj8fOJ
         pRbPXKXjcthUlK8tMNXHTzBQyNEd9LhuzO7viKEIUBflK/j8yPGDFY2YFJQcsqlLXw+X
         I7KrBftaJFvqqtQnW5QpfldjCjovbuu9/XgNdpjYtZicYR/Wm9bCo47WaE8PVvNTbtbn
         ViDz3SIUAnKcEFtcHnhQHkuwtOkqf1DIJF17J7bF5zaLWvjRwVVp74Wa0+ebB+eMzVRL
         9Z46rXnwKgsD24E161RS1mQ5leGUHfOpxj/LTl4yFZMXHmMXXCgQiTB8YC8G9bnT+G0C
         0Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XSBU/QuoKMLwWIya+pUntB2Jjk6UxC+KfLj3Ajn9LAk=;
        b=tvm9V3krh/Q9/dA7p4weKknlYK/ePtEeVW1r099vfSWUJtFkPKnJY0uXfgWvegZq5v
         aj7R9DJgYv1IsZxeXvAVC/KB5roJY9nlpcxW/s/dkotntxSNeUUKUtmoJXYiCxt/Y+2d
         J18VVdkzpfd9w131PZ3gMDLDKpX2cCRvZvVivpPGXdLKSIVRrXVzzC4RTbCahyeGxs7/
         cikZSXp4Tk0a6gL9Ho8nDgODvCP2a4Sicdyiqg6KnxoJP16lOmRhv+aaprSvcdQgOwWk
         031cTGIrFhfW1AbwVXnQLq4RE5CwoeTmE2/qaG4uLZfnaOabTjSMcW6wkuH+orKVpFlG
         MWXg==
X-Gm-Message-State: AOAM533xVo7DEliCPUlohvgPiBmLbLDfZuwqLamRHz9wum8B9WUGJgya
        o8+GuAE7sSxo/RFmcuCsXjrL7g==
X-Google-Smtp-Source: ABdhPJxfiidWmuTojE5ubWEoW0GT+dfyapBu9++UhsLrUCbM10CUC/8ka+RvHHO0MYLcQcLmM72fhA==
X-Received: by 2002:adf:9307:: with SMTP id 7mr12063802wro.414.1595026590289;
        Fri, 17 Jul 2020 15:56:30 -0700 (PDT)
Received: from x1 (92.40.248.191.threembb.co.uk. [92.40.248.191])
        by smtp.gmail.com with ESMTPSA id l14sm17576118wrn.18.2020.07.17.15.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 15:56:29 -0700 (PDT)
Date:   Sat, 18 Jul 2020 00:56:24 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] pinctrl: single: print gpio number in pins debugfs file
Message-ID: <20200717225624.GA1781278@x1>
References: <20200717013338.1741659-1-drew@beagleboard.org>
 <CAHp75Vd_s-W7Z1iG4fA5JvY51OzstkTYUcQcd=OGJUQtcJ75Ww@mail.gmail.com>
 <20200717195028.GA1775511@x1>
 <CAHp75VcL8Cz3E5HB6WkpddNzGRBY8w5m5m_vbxEr5EfBz7mWdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcL8Cz3E5HB6WkpddNzGRBY8w5m5m_vbxEr5EfBz7mWdA@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 17, 2020 at 11:09:11PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 10:50 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Fri, Jul 17, 2020 at 06:14:06PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 17, 2020 at 4:36 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> ...
> 
> > > >   pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
> > > >   pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
> > > >   pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
> > > >   pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
> > > >   pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
> > > >   pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
> > > >   pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
> > > >   pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
> > > >   pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
> > > >   pin 9 (PIN9) 44e10824 00000030 pinctrl-single GPIO-23
> > >
> > > Wouldn't it be better to have this for all types of pin controllers?
> > > But I'm not sure about the format of output.
> 
> ...
> 
> > I added the gpio column based on Tony's feedback [0].
> >
> > I'm not sure how I could do it genericly.
> >
> > The pin_dbg_show callback is implemented in pcs_pin_dbg_show() which
> > prints the contents of each line in the 'pins' file.
> >
> > Any advice on how I could implement a gpio column for 'pins' file
> > without chaning the pin_dbg_show in all the drivers?A
> 
> My question was exactly about changing core, i.e. pinctrl_pins_show(),
> rather than each driver.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Ah ok, so I see in pinctrl_pins_show() that it prints:

                seq_printf(s, "pin %d (%s) ", pin, desc->name);

and then calls ops->pin_dbg_show() to have the driver finish printing
the line.

I will try to add the gpio number to the seq_printf() after desc->name.

thanks,
drew
