Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE867C21AA
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 15:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbfI3NRc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 09:17:32 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38687 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NRc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 09:17:32 -0400
Received: by mail-io1-f68.google.com with SMTP id u8so38134942iom.5;
        Mon, 30 Sep 2019 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/dUf5sswmxG7Ik/ZA9Ti5eP9jBNRHm04sZ9l+3RMOo=;
        b=Esb1LBcSYBp2272bx6tPmIdg+7O+lOUBZIve4xk07BQ6EpDD0IVLJIo0NvNTIw1We/
         Ydz990SQ5portgdR+F07y5GSo0PAnEkcWccq4aIX5CxfPDUEb1NUAuYnkvGlQP3pa+f/
         0GUD/T2+WcjdFk5o9Zpjj6PIigsAJG1QK8RKnbkf2RC38Jwi6DxhJc2G4KnLtOLlyPBI
         1sKKSnwzw5g5ixijtSosb/WLmXJhNYFiruCmKgg7JW5cVlfMM5oY2TClqk8/OUSzjgFh
         qOPMWovm8M/QaBbreNBuT0HxT6wnIzZke7pZlsR4K04WgSK7sA5lO1w3sGskDKtq0C3q
         PS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/dUf5sswmxG7Ik/ZA9Ti5eP9jBNRHm04sZ9l+3RMOo=;
        b=nDs96JaIah+rH+HTnTCa8mIVViBGnSKHE313zVpuuLZ4WctFD9bzwNwdVcRYUkeKkx
         YZYYB4mzfOvZvKD1Tyn0jsRTKig1XjpeEJnyxnojHgD/7lnlg21MGVnBb4s+R5lX6QBQ
         0NaFjaiMWpQ5l7YQ5VE6dAlF4aBZ5IarMne7ZC2O8fFEpHQzPwV99KOQJoZ51ASu0Rd/
         qYPoiZ4oXd6gi/wSZlxOChqFE4ZXBZES9OB81VULZtGGU1zLpoHfZ59iy0crzv7qrKp6
         t56ctoujGiIW8GAfiBMgU0zrM15xNnk+4ASPh2xEGfHQ3ztox4preih8R5SS/acTfcVe
         esrQ==
X-Gm-Message-State: APjAAAVIILKS/3MXXMPiqx/JfcAWdUVVpAVC6MvsFPa3o6OWmbhatR9a
        9M3WKy1jVUqHesRQaOdZgTzq/a22pFR0aeWzQRs=
X-Google-Smtp-Source: APXvYqwT3YGrT/2PUSDdP5kKaoIcZoqNzFy1xP2HiH0fBqRhwszzsg+/afvXrWMIDg3g/eYX+8GK6r9kr+6LuiByW8Y=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr1089913iod.205.1569849450788;
 Mon, 30 Sep 2019 06:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
 <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
In-Reply-To: <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Sep 2019 08:17:18 -0500
Message-ID: <CAHCN7xKKNpQwWZkg-JBncp9=VOcLJFEkcvST=rZqv-i9+5_Q2g@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 30, 2019 at 7:48 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> On 30/09/2019 15:41, Adam Ford wrote:
> > On Mon, Sep 30, 2019 at 3:53 AM Tero Kristo <t-kristo@ti.com> wrote:
> >>
> >> On 30/09/2019 09:45, Tomi Valkeinen wrote:
> >>> Hi,
> >>>
> >>> On 27/09/2019 18:47, Tomi Valkeinen wrote:
> >>>> On 27/09/2019 18:37, Tero Kristo wrote:
> >>>>
> >>>>> If you can provide details about what clock framework / driver does
> >>>>> wrong (sample clk_set_xyz call sequence, expected results via
> >>>>> clk_get_xyz, and what fails), I can take a look at it. Just reporting
> >>>>> arbitrary display driver issues I won't be able to debug at all (I
> >>>>> don't have access to any of the displays, nor do I want to waste time
> >>>>> debugging them without absolutely no knowledge whatsoever.)
> >>>>
> >>>> I used your hack patches to allow changing rates via debugfs. And set
> >>>> dss1_alwon_fck_3430es2 to 27000000 or 27870967. The end result was
> >>>> that DSS gets some very high clock from dss1_alwon_fck_3430es2, as the
> >>>> frame rate jumps to many hundreds fps.
> >>>>
> >>>> So, these numbers are not real, but to give the idea what I saw.
> >>>> Running first with 50 MHz, I can see, say, 40 fps. Then I set the
> >>>> clock to 30 MHz, and fps dropped to, say, 30fps, as expected with
> >>>> lower clock. Then I set the clock to 27MHz (or the other one),
> >>>> expecting a bit lower fps, but instead I saw hundreds of fps.
> >>>>
> >>>> I don't know if there's any other way to observe the wrong clock rate
> >>>> but have the dss enabled and running kmstest or similar. I can help
> >>>> you set that up next week, should be trivial. You don't need a display
> >>>> for that.
> >>>
> >>> Here's how to reproduce. I have the attached patches. Three of them are
> >>> the clk-debug ones, and one of mine to make it easy to test without a
> >>> display, and without underflow flood halting the device. There are on
> >>> top of v5.3. Kernel config also attached.
> >>>
> >>> kmstest is from kms++ project (https://github.com/tomba/kmsxx). It
> >>> should be straightforward to compile, but kmstest binary is also
> >>> included in TI's rootfs.
> >>
> >> Ok, I ignored all your test code and just fiddled with my trusty clk
> >> debugfs patches. I don't like debugging with test code I have no
> >> experience with. :)
> >>
> >> Anyways, it seems the dpll4_m4_ck max divider value is wrong, it only
> >> accepts values upto 16 at least on my board. The setting for this in DT
> >> is 32, and it is most likely SoC specific what happens if you write an
> >> invalid value to the divider.
> >>
> >> The best action here is probably to drop the max-div value for this
> >> clock to 16. Can someone check this with their display setup and see
> >> what happens? Attached patch should do the trick.
> >
> > I tried your attached patch on my dm3730 and that seems to make it
> > somewhat better in that it doesn't hang anymore, so that leads me to
> > believe that your comment about the divider being only valid on the
> > omap36 may not be true. I do think it solves the hanging issue that i
> > was seeing, but I now see a new one now which is dumping a backtrace.
> >
> > It looks like it's unhappy that its trying to get one frequency and
> > getting something different instead.
> >
> > [   10.014099] WARNING: CPU: 0 PID: 111 at
> > drivers/gpu/drm/omapdrm/dss/dss.c:655 dss_set_fck_rate+0x70/0x90
> > [omapdss]
> > [   10.014129] clk rate mismatch: 27870968 != 27000000
>
> I believe this one is for Tomi to comment, his driver does some magic
> compares for the requested vs. actual received clock rates. If I am not
> mistaken, we are only modifying an integer divider here, and thus it is
> physically impossible to get accurate 27MHz rate to display.

I didn't expect exactly 27MHz,but the back trace is what concerns me more.

However, looking at
# cat clk/dpll4_ck/clk_rate
864000000

It seems like 864000000 / 32 would be 27 MHz, but instead we're
dividing it by 31 yielding 27870968.  I don't know the clocking
architecture, so I don't know what your patch actually did or how the
divide by 16 limit worked into this.  If lck cannot divide by 32, it
would be nice to see if it could divide by 27 to get to 32MHz.  From
there, the pck could then divide by 4 yielding 9MHz.

adam

>
> -Tero
>
> >
> > See attached log for the full dump.
> >
> > Either way, I think you've identified the main issue.  I just think we
> > may have uncovered another one in the process.
> >
> > For what it's worth, the video looks good.  :-)
> >
> > adam
> >>
> >> -Tero
> >>
> >> --
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
