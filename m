Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70147AEEE0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 17:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730107AbfIJPsm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 11:48:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35013 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729802AbfIJPsl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 11:48:41 -0400
Received: by mail-io1-f65.google.com with SMTP id f4so37895271ion.2;
        Tue, 10 Sep 2019 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=coLUn/mFfKhtEGTZkfKU7iKSONi2SChdAx43tZsS4uk=;
        b=okO7qHCmIYGdIBDffowQ8Wck3DnmwENwiHbs8BFei3qdB7cleA0izNjAMyKE2F7+ef
         wtmYj5wqOoXNY0lHRjg92QCpCFjXB2/0JUrhu6PR8cBkoiE51XWVpfLfqECQ90lNNcO1
         Q/WD65oXGV9FQBMNEOOEgnk+vaPsuJ7oq95iEELrpo3/BtsaKCYITkhhqxUVRCLvxCtg
         UxwoBknPo+HoYtYnbnyJfa5cbrMp+vNdrdjtZ/W6g2bBYgWxdtskZeJyZylvf0Rp+QvX
         x3b1Yuaow7UlwiWtHw5E7iczZuMN0tTZAxA+3+iR3M+lHhxQH5p08KYR9wqt3wDoyqn5
         +t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=coLUn/mFfKhtEGTZkfKU7iKSONi2SChdAx43tZsS4uk=;
        b=QObwHCamkCWnyo9jvI50Pw7J9x1ryfmbm+BoPG+8sYfNm6p3s8VCpivPHHQqaMMaAo
         CtDn5n6S8iE/whxsigve8O/TyudPa8qVMGaaAoFlIqPD+gwTmCWdQvYfj0+h86VYLZ9p
         I4aOwlLHU2qPAsDqNTkcR29cuIh6DZlQ8jREow5xS4+9pymKrX5fgq15Q616Aq102slI
         trAfhgTHk7W8uJETLqP1xNE23VH2f7BYoy9t41pnPq/Mwrd7vAFiYrn4y7yBdZoeSGer
         hBPluTlnEkh+nPPQGJjDa+AOwaA1/E6VnGiWlB4FThPsJ82lyHG08vKFoBnFF5b8VZYH
         CSKA==
X-Gm-Message-State: APjAAAWQVA+JMOjOfww7MSyJqnq9+rMiMSTsFE5AtxNutG6YaPyptnbu
        KOJvw7iz9KN/x+t0UffWiNNt1b4I3ekIjoynBv4=
X-Google-Smtp-Source: APXvYqyNK2KpMgOp5yFAwKzmIl05wi6Oom/MmgyrjpQIHsqWHE02/1onqF5gDO4XoszLJOEPF4gT+Ma3ZxxXzdKWHOo=
X-Received: by 2002:a5e:de47:: with SMTP id e7mr899998ioq.127.1568130520830;
 Tue, 10 Sep 2019 08:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali> <20190909163543.GQ52127@atomide.com>
In-Reply-To: <20190909163543.GQ52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 10:48:29 -0500
Message-ID: <CAHCN7x+t-OVRE7pVM4V87_YMWpgO+_Vashfn1s5msoqC5eiwTg@mail.gmail.com>
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

FYI,

By putting your node into omap34xx.dtsi and omap36xx.dtsi along with
the following, I can get the RNG to work on an OMAP3530 and a DM3730.


diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
index 5e9d1afcd422..73f351e6d132 100644
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -259,7 +259,7 @@
                         <&i2c1_ick>, <&uart2_ick>, <&uart1_ick>, <&gpt11_i=
ck>,
                         <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
                         <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>, <&icr_=
ick>,
-                        <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
+                        <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
<&rng_ick>,
                         <&mspro_fck>;
        };
 };

I tried doing the same for am3517, but it doesn't appear to work.  In
fact, the board hangs at boot with no splat, so I assume that some
clock isn't running and causing a hang.  Figure 4-50 in the AM3517 TRM
shows the security_l4_iclk2, so I wonder if the HW mods for AES, SHA,
etc are doing something to enable this clock.  Those HWmods are
disabled on AM3517.  I tried turning on the hwmods for them before
without success, but I'll try it again.

adam
>
> Regards,
>
> Tony
