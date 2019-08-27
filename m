Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD98F9E9F9
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 15:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfH0NtK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 09:49:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38042 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfH0NtK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 09:49:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id e16so1793475wro.5
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=f9rt416bPUGlMW/XdLMSNOZOlpKfYyj7j/25R9MShag=;
        b=ZNRTATH9LjU0dFeLsulyz0+me2sey+ck66wMvXTwoe68qBu3ZFGd5FSamHHxqDM5U/
         ciMZkOfZ21LuWk+ycXx8IrR+QQVIpdjFFlBth0SpSu8ByYStj5N/M6l2/sTFqoEkGgP8
         +QtXEK2L8KCdzt6cA9xP9tUsCaRR3ygR3X9Jf4LrGaWek5DW85eeFKiJZJqtWTRrxDNc
         8iJ+HIebrmAI4RfNVBtuQmekMBWapUblWGjUTC6wT2O3KxB7A5op56RpO9VFsZ+7CpD+
         6RCLxWibVKZbXunlbUEokoFi3JuSN2EEYmvKf8Y6XxC0zLMdNp/yNR/s/kK3Cz9aM3p9
         cVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=f9rt416bPUGlMW/XdLMSNOZOlpKfYyj7j/25R9MShag=;
        b=fz7zD7vMmudIPDvOFIS1R3+DigKZoW2b8MgZuyy5YAoXouvbsL3yPot0rQJa0bap1R
         GblRrkSXTnwaT36PNeCGwzUGrZ8BPxQYMRhjDPWCaCjiluQZaH7WZSLPUUOjSq65yuX/
         YIfFFxRB7uf+VS+BX0pzMJrbyENCA/XPcG/YRX1vmtuhYhXWGoPkPNWiOGgRo3XPMehd
         fuVg3KM0efryUj3Kt/nwhqEQYv62weawsprgw5WO8uLoL+Fij5rqiVPE0VdOuY40ZhF7
         L/mlp+Y+xTkImh3uOWiJCfvQOZWn4r2Cl3AsJ2wjmrNv5CaIltJ7OUo6bmU0tXIMNoPi
         vwdA==
X-Gm-Message-State: APjAAAXXjMO76cyDLS5cfg1M8Wg/2o3l4L4lza9lbXorZvdsCi++Nglh
        dRs7WWRM8M7vUofn5mgyx5U=
X-Google-Smtp-Source: APXvYqyVxejGw47pprEDQh9IuRPSKVcKdyKyGGUyK2B+TFgbc7j6Lb7oaMXPqMyJusJoXpOAZFavmQ==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr28438023wrw.326.1566913747447;
        Tue, 27 Aug 2019 06:49:07 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z12sm13183459wrt.92.2019.08.27.06.49.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 06:49:06 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:49:05 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827134905.5mc5b3rxpmojp3ay@pali>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali>
 <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> On Tue, Aug 27, 2019 at 8:24 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> >
> > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > On Tue, Aug 27, 2019 at 3:12 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> > > >
> > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > Hi,
> > > > > >
> > > > > > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > > > > > and noticed this:
> > > > > >
> > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
> > > > > >
> > > > > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> > > > > > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > > > > > How this driver is supposed to work now? I guess it has been broken for
> > > > > > a while. :-(
> > > > >
> > > > > You should have a DT node for the device, which contains the clock handle.
> > >
> > > I am interested in enabling the RNG too, because sshd takes a long
> > > time to initialize without the hwrng.
> > >
> > > I am not able to find addresses in either the DM3730 TRM nor the
> > > OMAP3530 TRM.  Can someone from TI make a recommendation as to what
> > > the node address should be?  Having this would be a nice starting
> > > point.  Also looking at the other omap RNG nodes there are references
> > > to hwmods, but looking at the platdata in pdata quirks, I am not
> > > seeing anything.
> > >
> > > There is also chunks of code that exist insdie
> > > arch/mach-omap2/omap-secure.c which appear to only be referenced from
> > > this driver, so I wonder if there might be some way to
> > > combine/condense this once it's been converted to device tree and
> > > functional again.
> >
> > This part of code calls N900's PPA function via SMC instruction, which
> > is provided by closed Nokia bootloader NOLO/X-Loader. So it is needed.
> 
> I am arguing that there is open source code for OMAP2 and OMAP4 RNG, I
> don't understand why we can't have support for everyone.  The TRM
> references the RNG, but it doesn't give much info.  There are other
> RNG's supported in the open source so I would think if the IP is
> present in the chips, we should be able to use it without a custom
> bootloader.

I do not know about general solution for OMAP3.

But Nokia N900 is HS device, has signed and closed bootloader (Nokia
X-Loader) which is running in secure mode and it does not enable L3
firewall (or how it is called in OMAP world) for accessing RNG blocks
outside of secure mode. It just export PPA function which "other side"
can use to get access to RNG.

Accessing blocks which are not allowed by that firewall cause immediate
reset of board. So kernel must avoid such things.

So for OMAP3 HS devices, like N900, we need signed bootloader which
either enable direct access to RNG (which we do not have) or bootloader
which provide custom PPA call for RNG (which we have).

Exactly same problem is with AES acceleration on N900. See for details:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=69540a7c277d96382257216436f41abc040cc878

Later I played a bit with that L3 firewall and reading its configuration
is also disabled. After trying to read it 3 or 4 times from userspace I
got immediate reset of board. I was told that this is normal (firewall
violation) and reset is there for security reasons.

Public GP TRM does not provide information because RNG is part of crypto
IP and it is for HS devices. And IIRC TRM for HS devices is (or was)
available only under NDA and only for licensed customers.

Somebody from TI should really provide up-to-date information about this
topic. All those information are from time when I played with AES which
is from year 2014.

> adam
> 
> >
> > > adam
> > > >
> > > > Hello, I have not tested new kernel on N900 for a longer time. And at
> > > > that time (4.9) it worked fine. So it is just missing DT node? Maybe you
> > > > could fix it when you testing it?
> > > >
> > > > --
> > > > Pali Rohár
> > > > pali.rohar@gmail.com
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
