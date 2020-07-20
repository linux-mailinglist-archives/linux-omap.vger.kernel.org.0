Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EB3226EF0
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 21:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730763AbgGTTVg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 15:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbgGTTVg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 15:21:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4DBC0619D2
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 12:21:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so577485wmi.3
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=drjVrz0HKTqiToPN//uGoymbbNQ2vz3ohN8cWfYssWg=;
        b=Po6qusc4mrfN07bDoys3gc5YNjQ7WwJ5lRNemTfMTH5LCzYhvbsUwIPf36T5CvV5VO
         MyCmnvPST4Z9WwTqFlB80J2oLlnka8OEM4V6p6+f5+7o8RhobGmpspYFoxRPZnfJkNn+
         3nRF7Pth4CCVRTWmoDHdr2P6VOhwHMSN2UqZRpSkm+ra7sAHZmNKB1NPm1NPWXOooKYn
         +afbM6DSoYNR9aIX6J5XTHj7jmkh4VhYlU0AFYbJReG5gunawA6raqfYBVtoFYQ5NXFV
         24W8cpeQJ1+35kxDi1Pb/BWGibmbRdfek3YTPA6vM4c6/FnbFapDn3LY4b6jgGwv7E3G
         M3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drjVrz0HKTqiToPN//uGoymbbNQ2vz3ohN8cWfYssWg=;
        b=bJBIZb9eWyJpTV7un5I1Uc+PCXj4IOq2BpTeTVeD9OPryGtKM+JgMwi2xkSZItHyuX
         e1xhuMoRwfSKNzgpceEfgS4So9IxghgK+T+anCoEohr++9B8EmyPqwMAOBN6svhd17CJ
         QKH3brprqd7puNXt+yC4h3AIeFnKFF6Uri2I2WL2LeB8LXsAYZzWJQ/wt1rOyCo2teTp
         atdCKakFI59l+Gjq71ES3egAVwx0OzT6J1hl/rOJZLKppo+syUVLZkTvyuvtNI02BeVL
         v3LOEhfNTr19KUxhdXNqwZD4a03NTQwOEvN3xR708yiO+CuGScjAY1Mq/Rp+itE+nRNN
         ztPw==
X-Gm-Message-State: AOAM532OiKVrSWZD7OEQvr6S69u2y7PvmckCBEMvSL5tgQQB0B7D09Yy
        s6BT0n8j3V1o1gisBEiLE0q9fA==
X-Google-Smtp-Source: ABdhPJx1amXkvtsBfSgruslRd3KssogIQVO5s9XZ5d18x4zAavO+ESaxDVGpN5zxwpvV+6mZtkYQ4g==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr742229wmj.117.1595272894524;
        Mon, 20 Jul 2020 12:21:34 -0700 (PDT)
Received: from x1 (50.red-80-27-209.dynamicip.rima-tde.net. [80.27.209.50])
        by smtp.gmail.com with ESMTPSA id w14sm34110232wrt.55.2020.07.20.12.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:21:33 -0700 (PDT)
Date:   Mon, 20 Jul 2020 21:21:30 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] pinctrl: core: print gpio in pins debugfs file
Message-ID: <20200720192130.GA1964904@x1>
References: <20200718154908.1816031-1-drew@beagleboard.org>
 <CACRpkdapJj5Q3MBKrJkd3CBeJJDuuS-Cj6D=Gk67uyt4O_Oj-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdapJj5Q3MBKrJkd3CBeJJDuuS-Cj6D=Gk67uyt4O_Oj-A@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 20, 2020 at 04:26:21PM +0200, Linus Walleij wrote:
> Hi Drew,
> 
> thanks for this patch, we're going the right direction here
> and creating things that are generically useful.
> 
> On Sat, Jul 18, 2020 at 5:53 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
> > pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
> (...)
> 
> Uh oh, that is the global GPIO number that we want to get
> rid of.
> 
> > +               gpio_num = 0;
> > +               list_for_each_entry(range, &pctldev->gpio_ranges, node) {
> > +                       if ((pin >= range->pin_base) &&
> > +                           (pin < (range->pin_base + range->npins)))
> > +                               gpio_num = range->base + (pin - range->pin_base);
> 
> There should be a break; here should it not?

Yes, good point. 

> > +               }
> > +
> > +               if (gpio_num > 0)
> > +                       seq_printf(s, "GPIO-%u ", gpio_num);
> 
> Can we print the gpio_chip name and offset instead?
> I want to discourage the world from thinking about these
> global GPIO numbers.
> 
> You can fetch the gpio_chip for the range pretty easily
> with
> 
> struct gpio_chip *chip = gpio_to_chip(gpio_num);
> 
> Also notice that this code needs to be
> #ifdef CONFIG_GPIOLIB somehow
> (maybe IS_ENABLED() works) because there
> are pin controllers in use without gpiolib believe it
> or not.
> 
> Yours,
> Linus Walleij

I've just posted a v2 [0] which makes sure the gpio information is only
if CONFIG_GPIOLIB.

I had a hard time finding line offset so I printed the line name
instead.  I would appreciate it if you could point me in the right place
to get the offset as that is cleaner in the 'pins' output.

thanks,
drew

[0] https://lore.kernel.org/linux-omap/20200720191740.1974132-1-drew@beagleboard.org/
