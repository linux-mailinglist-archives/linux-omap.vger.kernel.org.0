Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7153A1E5AAB
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 10:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgE1IYd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 04:24:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34427 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgE1IYd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 04:24:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id b6so32328787ljj.1;
        Thu, 28 May 2020 01:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=htN54AV/Ihu6JzPNFvenMo8mjoWrRH1sjEjPiN8cCzk=;
        b=ulMG+2s1laMLyaQ/fBjFjyudzzlg7UtXeIjTVIUmI7fAj+LV6xjDjYHVh+qMcwd4v5
         AgsBTyX6iz8C5hSEm+tuhvyVEHEjBCuXAXMrj6Uzay/OKj47Rm2IUPzQ2aikMF04RAtL
         YsupteV2O9uk6Pwz0+fGUg/RenlHSq9rRB18cWkHe/s6c39SPi/WY67QX6l4LDN+LxPz
         3ZvUHO7/Hqz3ikBplcMMDmcS82XaxHYTUZzNt0jHn2qUwp+okOWo2UJV+sVYV9Lt3lnC
         flgaCihZ0sYEarDkfTl1FXP415xHiOFJ8KxT+Kq89wuQfqQextNpo0M8kTM2Gncgq97y
         4G0Q==
X-Gm-Message-State: AOAM531fSwjDNtKbA6tqDDAVw7pJGHep1v1H8deLs5sDeoCcWeUrcRc+
        keyA8rU+bB/nAPs25VGn6rs=
X-Google-Smtp-Source: ABdhPJw0lfniAdlAI2ff5VOzb5wHTOW7tmV6sPriJoXUvYGZu9htTeK/qTi3Nk+AwKcKnzJOR4uUXA==
X-Received: by 2002:a2e:a171:: with SMTP id u17mr953864ljl.225.1590654269229;
        Thu, 28 May 2020 01:24:29 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u16sm1292531lji.58.2020.05.28.01.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 01:24:28 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeDps-00035C-Ur; Thu, 28 May 2020 10:24:21 +0200
Date:   Thu, 28 May 2020 10:24:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200528082420.GA10358@localhost>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423153756.GE37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Sorry about the late reply on this.

On Thu, Apr 23, 2020 at 08:37:56AM -0700, Tony Lindgren wrote:
> * Johan Hovold <johan@kernel.org> [200423 11:44]:

> > I know the location of this driver has been up for discussion already,
> > but drivers/tty/serdev/protocol still isn't right (e.g. we don't have an
> > drivers/i2c/protocol directory where we stuff random i2c client
> > drivers).
> 
> Argh, the location of driver again.. So we do have the custom motorola
> layer to deal with on top of TS 27.010, but the custom handling is
> contained within the driver. So maybe just drivers/serial for the
> custom driver then.

Yeah, that should do for now; n_gsm is a serial driver (exposing tty
devices) after all.

> > Last, it seems you've based the serdev-ngsm-motmdm.c chardev
> > implementation on a more or less verbatim copy of drivers/gnss/core.c.
> > I'd appreciate if you could mention that in the file header and
> > reproduce the copyright notice if you end up keeping that interface.
> 
> Oh yes indeed, thanks for pointing that out. I'll add it to the next
> version. The chardev code is for sure based on drivers/gnss.
> 
> To explain my ignorance, I added the chardev support initially as an
> experiment to see if I can handle the motorola packet layer better
> that way compared to the n_gsm ttys and userspace handling. It ended
> up working quite nicely, so I kept it but then I accidentally left
> out references to the source. Sorry about that.

No worries.

Johan
