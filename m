Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6398DADF44
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 21:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732369AbfIITTZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 15:19:25 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44419 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbfIITTZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 15:19:25 -0400
Received: by mail-io1-f65.google.com with SMTP id j4so31448148iog.11;
        Mon, 09 Sep 2019 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=itY8GiF4v2ICnk3w7fmpHKt0Jrf4g4tgby4BDHrpXnA=;
        b=UmDHiRpalMxsNVmUuJrpSU7F/aXt3LVtEpUq0X4urb7xXw2TAWHTdi8ok31DEKB/xu
         5bcHIDJ6ApFP9vzR7o66a4fCG3jIS2SIhH174WknxHSftO/ErTgWVUBL2R9puCaU4ZGq
         z9ec/kPpCbkFXV4h71gcgyx4bcbQERUKt6ixJa07MakYsZNE9JxUpXvyW/3GHJFUSJJh
         Y5DXf7zi++e3hASYrkCIz4JrIHNZwRH4OHYITGdC2n6yz7jwSpuMRQMDGIimLybfYK15
         5fN/FFI5fadPsQK/fyOdRJ/FKV141VzFJe/2wBluDkF8pqvI8V5Xbeim0n1moyMio8AW
         5hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=itY8GiF4v2ICnk3w7fmpHKt0Jrf4g4tgby4BDHrpXnA=;
        b=CwSrjFSPbhiVswBRdLlUBn7B/2GYesL4krcywLMl5a18y6p//xUNbO0SvyryQEqGdV
         y29tBAQi6/chQr72JKnhjFTmW9gttjOTgyoRPBK/tDBO4Dqz3wNPsVos2On4XiHYbxCW
         ZSHphDyjS8JQzt1LOzzPZS0DtQfnDy2cjZ87CxguHqYYoN5iIEtJRlQb1A8esXVH7PFY
         TI1VC95GHIXdDbxXWb6RfV8uPhP4EyPwmnBa24n7eaOHBNvdxkC6mIxly/KKXa3eVzSF
         WTg5mMwT/cmWckLvDjCelhSclXnBFl6Th6sRoXh+qKcyV+82gzPfheFUqXlWCKBZ00XI
         o4SA==
X-Gm-Message-State: APjAAAXHRguYbpKH/zmV7aoGVQDZmUBCuy5H0r2jPd2RhoxAwzOwD56G
        WAjmoIOPsJcNDd9IXCSGfG6D7Eg4puXmx9zS/VA=
X-Google-Smtp-Source: APXvYqxT9Ew0lOrb9R8fk94nzjDz8DT5vh9012Iq9slXFuwohedopVo8D4BVhibQba0Usn8X8gpTxix7KzsPRpHRXdY=
X-Received: by 2002:a02:b395:: with SMTP id p21mr28626183jan.52.1568056762576;
 Mon, 09 Sep 2019 12:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali> <20190909163543.GQ52127@atomide.com>
In-Reply-To: <20190909163543.GQ52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 14:19:10 -0500
Message-ID: <CAHCN7x+7aafrZTtDFqbYJFtrozi8jCmiFE8SyFSmEhyd_Xh6tQ@mail.gmail.com>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 9, 2019 at 11:35 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Pali Roh=C3=A1r <pali.rohar@gmail.com> [190909 13:41]:
> > On Monday 09 September 2019 08:37:09 Adam Ford wrote:
> > > I applied this on 5.3 and it is working.  I assume the same is true i=
n for-next.
>
> Hmm I noticed I stopped getting RNG data after several rmmod modprobe
> cycles, or several hd /dev/random reads. Anybody else seeing that?

On the Logic PD Torpedo, I was able to read from /dev/hwrng and
/dev/random 10x without issue
I have installed rng-tools and I have sshd running and some other
stuff that might get in the way if I do an rmmod too much, but I
removed and modprobed the omap-rng 3x and never saw an issue reading
either /dev/hwrng or /dev/random.

I have been meaning to test this on the AM3517 and haven't gotten to
it yet, but I assume you've only tested omap3630, is that true?

adam
>
> > > Do you want to submit a formal patch?  I  can mark it as 'tested-by'
> > > This really helps speed up the startup sequence on boards with sshd
> > > because it delays for nearly 80 seconds waiting for entropy without
> > > the hwrng.
> >
> > Hi! When applying a patch, could you please disable this rng for n900?
> >
> > In omap3-n900.dts for rng should be status =3D "disabled" (as Tony alre=
ady
> > wrote), similarly like for aes.
>
> Yeah I'll post a proper patch after -rc1.
>
> Regards,
>
> Tony
