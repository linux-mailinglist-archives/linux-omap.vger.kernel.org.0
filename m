Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3AF1C4A08
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 01:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgEDXG0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 May 2020 19:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgEDXGZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 May 2020 19:06:25 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAE2C061A0E
        for <linux-omap@vger.kernel.org>; Mon,  4 May 2020 16:06:25 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id u11so7083iow.4
        for <linux-omap@vger.kernel.org>; Mon, 04 May 2020 16:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SfliJx0XK3RBAh4vp7iwJ1c/P5LHIy8aB9zeHF+04PY=;
        b=G3xqRdeMR8CYXHe+UrG4d8a//dHAi+BbEnGGyo3GN75M454MGMSgxtGgPoxr8pMvg3
         fgxJpj+Pn3W5IY+GZcS7ynh4Wc6dxrM1OEr3KXgRUTSFbUwEh7oW2HZYtIfU0AMe5A9x
         Wq3dbQTXYigHBNaNlE13aZTjJB3zY6biagX+ZCndprJJ7HdVjGqm6uekWnTbfbMAb1OO
         qH24X70xVIl4UHDoQk/EgQd7XLPtnWsEzIRazbI8xlDXwukipgjGSBueMnqXKgUe1L1A
         /u5awcrgo0rJcps9me8dKxdfN9A22qQHMQy0rE1LrQT4Biuey+tfu4IZqBCbKVEIpYBr
         Gjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SfliJx0XK3RBAh4vp7iwJ1c/P5LHIy8aB9zeHF+04PY=;
        b=fNR6xJ9oGZbe3zqvLpErbOJdp6bfhOOzNhB8k3GhYCpJFZys6L2qopW6WFws/0EFS8
         IWQ/4mgB86Ctn9wylN6EmGn5U//kko6o/GLIyCJkbX8wG4qS3BqcxWrMungurtvyDoow
         pJExbLPDXmZvFVbw2mwMNNU1vmLTEFAD0qFzbgwsnzFDXNsgUq7Q8Dk9I4WSrnkoh6CA
         jHKXBAzEaERw16jOMNmeNFTjJTSGAojn8SHsbbvJ2hHwv9X6wRPFPGVEoWKjtekkTIZS
         Xw0JfTpys6i8LSp9KDPtYyx3KYARkFHMgEqYVkJ5/h9xgGbMhAcxtUzvku5wfVK9LNBa
         BxIA==
X-Gm-Message-State: AGi0PuZlNJHrxd/LiwIS1WTx8RaEa5uLcx129uJaTCBI+lM9B5Coeh1t
        Q3npV6K4tqr9SSFXnF30+gkse1KhHa9ttvFzIVw=
X-Google-Smtp-Source: APiQypLxfQNY+aAEO909mS34VMrVEv37jUYP5GE9GXIVEaxH66DYLgvobiHuDtuKDVmkCUMH3dsjYCF0o/26csS214M=
X-Received: by 2002:a05:6638:ece:: with SMTP id q14mr760166jas.65.1588633584839;
 Mon, 04 May 2020 16:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
 <7b4ffe96-7d97-81c1-629f-af56018b84ae@ti.com> <20200504150649.GI37466@atomide.com>
In-Reply-To: <20200504150649.GI37466@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 May 2020 18:06:14 -0500
Message-ID: <CAHCN7xJKhtsTBnY6HS=M_TdpJuSvkCzy8yRVijE73rkUrx7p=Q@mail.gmail.com>
Subject: Re: OMAP36 AES and SHA addresses and hwmods
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 4, 2020 at 10:06 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tero Kristo <t-kristo@ti.com> [200504 06:29]:
> > On 03/05/2020 18:48, Adam Ford wrote:
> > > According to the dm3730 reference manual, there are supposed to be two
> > > AES and SHA engines, but the addresses of their IP doesn't appear in
> > > the reference manual.
> > >
> > > The AM35xx has references to two memory locations for each:
> > >
> > >     AES1 shows it's at 0x480A 6000
> > >     AES2 shows is 0x480C 5000 (matches omap3630 entry)
> > >
> > >     SHA1MD5 2 shows it's at 480c 3000 (matches omap3630 entry)
> > >     SHA2MD5 shows it's at 0x480A 4000
> > >
> > > Is it reasonable to think the other IP block addresses for the
> > > am3630/dm3730 would match the am35xx?
> > >
> > > Currently in the OMAP3630, there are hwmods setup for AES and SHA
> > > engines, but the rng uses the newer approach with ti,sysc and
> > > sysc-omap2.
> > >
> > > I tried to just copy the existing blocks to the other addresses, but I
> > > got some errors. I assume it's due to hwmods.  It seems like we should
> > > be able to convert the hwmods out, and add the additional addresses
> > > for the omap36, but before I go too far, I want to know if it'll even
> > > be possible.
> >
> > All omap3 family should share identical address space for these IPs.
>
> For configuring the accelerators, the dts entries needed should be
> very similar to the other SoCs. AFAIK, there are no "ti,sysc-omap4"
> compatible devices for omap3 though, and they should be configured
> as "ti,sysc-omap2". I could be wrong though, but this can be seen
> from the module revision register.
>
> For omap3, you need to specify both "fck" and "ick" for the ti-sysc
> config. Not sure what's up with the multiple addresses or instance,
> it's best to check what works.

I wasn't seeing both clocks, but I was able to migrate the AES from
hwmods by referencing aes2_ick and aes1_ick.

[    8.002349] omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
[    8.066375] omap-aes 480a6000.aes1: will run requests pump with
realtime priority
[    8.425506] omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
[    8.492614] omap-aes 480c5000.aes2: will run requests pump with
realtime priority

Feel free to reject if you think I missed something.  I will admit
that I am not fully understanding the migration path, but I used the
RNG stuff you did to help.

If / when this gets accepted, I'll do the same for the SHA engine, but
I wanted to start with one first, before moving on.

Tony - Is there value in doing the migration to other areas (like GPIO) as well?

adam
>
> Regards,
>
> Tony
