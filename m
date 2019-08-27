Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64739E936
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 15:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfH0NYY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 09:24:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37300 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0NYY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 09:24:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so18815638wrt.4
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qYft6ifZy5mTUwacDiMIXjwiW6tgCTL6xB0fehIA/4E=;
        b=VmSsB5KvZYQ4d+MnDJ9vEPgXz17z/0vG9olmwsIJom6dI2JFcBUXoIMwNVlMWQwD3h
         5ktNLFdupDN+EpRVKNs5KVwo6lshsqe+iVp7NOrvI/UEVM8Kll2Z1RnDz+/CmibmAkS6
         UKHghoNFW6jtLXCqZsDYx3pR5puBCNsENjVAflhUet53WSdL7ADKXUi23XPolKFDb8+0
         ga0J+QZlsBHhKp8RxNvFCCykorwCtrDcBlfCnOegenoOgdFlK4IK03EwSsWPaz4syah2
         hcgKo3hSASRLk9XeHy3kxKLLHJAQWWi8SjCBd8/YsYLAfwQkI39degVnmfVMyyaGP1B5
         v/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qYft6ifZy5mTUwacDiMIXjwiW6tgCTL6xB0fehIA/4E=;
        b=jeFte8M0D9etmMNmRTD0s/vvNaiJHlTJGNwkOU8vyQjDW/mQYK/EaKA8x759CKeO1w
         9hJEiDgkTT/UvDT2lu0laUr8xrzOdNU4CAv9rfTrY3FrpN4kg6PD9qTbFcvxIMPtl3+A
         mG7Lfwj9J5b+vPT/jmkzJr9OEHu04/ywMHjtIEuIbXUDT6iNGqQO1EPEPL2q1iNV1rFQ
         fVpXbp4wt5a0rkJyNkjE9QxYs66G9ef9qk2a4rPFgCVnfMjr91GhKBq3YdVqePnGA9vP
         BucUwyFYCmlwio6zpgXCaOHMnpkemBmuftvlCiaJShE1QGjKy+RcaqUW01ESvAQjkYbO
         ueDA==
X-Gm-Message-State: APjAAAUOXqd7Lx1QXxD2ZX/SqYcTU1s2CrlqKIm6aoHJf34hy5ToXC8y
        zJaWKxONb1jnCMvXFgGkL78=
X-Google-Smtp-Source: APXvYqyHkkPHceevxS2oAVqV4JIXOLf+5TgNNBo1Sa7Se97yvMyt4LPCbkqpmbx/hs8AlD74srM+bg==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr30800235wru.258.1566912261919;
        Tue, 27 Aug 2019 06:24:21 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id x13sm3121304wmj.12.2019.08.27.06.24.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 06:24:20 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:24:19 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827132419.wgcn36557zlwjmah@pali>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> On Tue, Aug 27, 2019 at 3:12 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> >
> > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > Hi,
> > > >
> > > > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > > > and noticed this:
> > > >
> > > > [    3.297668] omap3_rom_rng: initializing
> > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
> > > >
> > > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> > > > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > > > How this driver is supposed to work now? I guess it has been broken for
> > > > a while. :-(
> > >
> > > You should have a DT node for the device, which contains the clock handle.
> 
> I am interested in enabling the RNG too, because sshd takes a long
> time to initialize without the hwrng.
> 
> I am not able to find addresses in either the DM3730 TRM nor the
> OMAP3530 TRM.  Can someone from TI make a recommendation as to what
> the node address should be?  Having this would be a nice starting
> point.  Also looking at the other omap RNG nodes there are references
> to hwmods, but looking at the platdata in pdata quirks, I am not
> seeing anything.
> 
> There is also chunks of code that exist insdie
> arch/mach-omap2/omap-secure.c which appear to only be referenced from
> this driver, so I wonder if there might be some way to
> combine/condense this once it's been converted to device tree and
> functional again.

This part of code calls N900's PPA function via SMC instruction, which
is provided by closed Nokia bootloader NOLO/X-Loader. So it is needed.

> adam
> >
> > Hello, I have not tested new kernel on N900 for a longer time. And at
> > that time (4.9) it worked fine. So it is just missing DT node? Maybe you
> > could fix it when you testing it?
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
