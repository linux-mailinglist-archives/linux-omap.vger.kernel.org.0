Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0B5E03A0
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 14:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388944AbfJVMNM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 08:13:12 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42464 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388106AbfJVMNM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 08:13:12 -0400
Received: by mail-io1-f65.google.com with SMTP id i26so10760096iog.9;
        Tue, 22 Oct 2019 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7VUSL4glh9tdmGltrbXAxLhst/cC64H17TVs7Wd2ISI=;
        b=KNj120IAsn18ftYPNYtGAMO522hDC71q+lnhMtWOYXoXlDsQo9QgcVuidnJk/ml7tr
         UbqrQwC1U8wazJ7pHfzxOF7LsixYPLXxRE9/JTcNA33V/m2jTWO+KAELTbrPE8q0D6HW
         S9+0vi0V/9gTXRujRZeQ8kuvFFrKCsEWVB5YHsGdr//QG36RtI8w7Ivuc3u3oSfL7y0U
         07cTguxrdcpKQNMzG+oFAzr+Ziun2e0ahAEXELyZvsQxszVck3Pxet4kl1tSkrZdOCHp
         z0Jy+6K1Gkapib2IaHiK6EzZNdk0P8i9rV92PT0J1kYTE863bAcw/RHuDUMxThwvDmiy
         imCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7VUSL4glh9tdmGltrbXAxLhst/cC64H17TVs7Wd2ISI=;
        b=AHDOiZeYzU4MPkOHoXOO0vH/+DIHujzqaI8diCJGXU4j0MsjLjd/pa4ycqUeNzKgeP
         saHkRriQTVpqOcKobXdUI6nkDvuYLxDhKYaUSAI0hN9OSQX6iNQJZcyA/Hczcod19V5H
         WmlbzSjGeQ16xOFnGq2c3M1NndvbeYW0sy8OGE+sN634XkJJcBZKBbLsClTZLs6V8TL4
         jQwNwCT8y0vICEs0Njv6eOSGz7O6LYZQ/xi3UWHObOAKjDgGAQurWQDdAOvV76ra7+bX
         SKYeTJ0jA5j7Xt8qxgHo4u09L/UphqL8v5Df99LBhsLqYy1iyis2S/52vV6kEPf8bOhH
         O05Q==
X-Gm-Message-State: APjAAAX+Il5atyqjZDHhNPeGO++AoQ1OJipAEPaaVpS/Ra6odzXPzqUa
        b/XixEDpYwC93152KBqfa3IN1HceH6VHssd9rw0=
X-Google-Smtp-Source: APXvYqz9BuIKcbppibeFWeJbwe4oRUtRoe+yhYAEZFYke6YfzSl3wycLo6ueyYsgQWQ8Is+1lpwo08JP+zHbKn3n89w=
X-Received: by 2002:a02:92c9:: with SMTP id c9mr3507699jah.0.1571746391225;
 Tue, 22 Oct 2019 05:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali> <20190909163543.GQ52127@atomide.com>
In-Reply-To: <20190909163543.GQ52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 22 Oct 2019 07:13:00 -0500
Message-ID: <CAHCN7xJjMNOLT5oPn8CArApM5b2ksPon8eALq=gUi0ZqoLjGHQ@mail.gmail.com>
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

Tony,

I am just following up on this.  Without the HWRNG there are some
tools and daemons like sshd which wait a long time at startup.  The
patch you sent really helps speed up the startup time in these cases.
At least in my case, it shaves 80 seconds off by eliminating the
delays.

Do you think you'll have time to post a more formal patch?  If not, I
can do it.  I just don't know which mailing list is the more
appropriate.  I was able to verity your patch on a DM3730 and OMAP3530

Thanks,

adam


>
> Regards,
>
> Tony
