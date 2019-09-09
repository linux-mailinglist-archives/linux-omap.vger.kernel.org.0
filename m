Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 207AAADF38
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 21:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732705AbfIITNZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 15:13:25 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38726 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732594AbfIITNY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 15:13:24 -0400
Received: by mail-io1-f68.google.com with SMTP id k5so6128692iol.5;
        Mon, 09 Sep 2019 12:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VLbJxGohHfaGQxBUxT7MKeg7g91YDycpTiN6PkEm0v8=;
        b=Pl7DBJ9fPF2Ix/2UjwPOVxRJv5yKUNes0Q0JD0FOXh/cLBf/27ZZMnRne0Fs+j/R+Q
         7lV/aNU4l1s7V7l5B8DsjgWGtafltRxwfSAH6ma79QnJi1FEGvY5P6peeH8ha19HqrV4
         fbfZ0fIHQjaEEY42TzZap4DtEtVwUICbuK7CI9PKC6mOVuJs6ewGidJFkCQcWw4IJ4+s
         Ae6b7zZtL6AwuR6zHk8NzyJhe9jB2aIhWlz+JN2Ncmoz0zH7HO5pN4lpBqPAmPaLJgEF
         CtZAaeYv966lMcpEohKwyXET3z6Rdr9woK4HgKzZb5qjGjI7WLodnJd2WOhVEjmmnHo2
         1JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VLbJxGohHfaGQxBUxT7MKeg7g91YDycpTiN6PkEm0v8=;
        b=rcufrZsZTLs9gbCtgOgqSsptm4XLo3hdh785JbOrxE94xjbCUmsWbElLqUDcvYmbJQ
         6pmOKJwWLWCOgm5aNETByiMtJLfO+xjs8TZAOkwLF80lg3lRPuynlw0LdUdS/JBOpXMr
         m/6uilBs6mxZaQhSAzYT0m4TfNayTGhTmEmz/fnScoYQwlgasBf+o5wrLvzYAOVCSUcp
         g3/tKu+zpmvKQtO4y+uf6QMCZVN+ON2TOj6bz64idIQ23vwwe8nXgKZg3eX4qSOiTo0F
         IMNJDknT6CDN1K3qn0QIwmnRc3nzXf2uvCv4rMKk1g12/kKoq8aJrFxOZDlIxyXl1BOg
         TLoA==
X-Gm-Message-State: APjAAAXAhq6ZPeVW+vBWSdRjT3zHRadDi9H+4UTowMF7CrEDt7Hw+ukp
        oECNmV2sxO9maDVoF7ySXxDwTE87qWEbEzSOunM=
X-Google-Smtp-Source: APXvYqzKwG5Hw87/g9cHikKba+W//tYQ1m76H3+ua5V0I7APpFX595GVrht8Tls9NxvLRsZYx6fPf7niFB4UMjbID4A=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr27546226iof.58.1568056401769;
 Mon, 09 Sep 2019 12:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
 <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
In-Reply-To: <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 14:13:10 -0500
Message-ID: <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 9, 2019 at 1:11 PM H. Nikolaus Schaller <hns@goldelico.com> wro=
te:
>
>
> > Am 09.09.2019 um 18:54 schrieb H. Nikolaus Schaller <hns@goldelico.com>=
:
> >
> > Hi Tony,
> >
> >> Am 09.09.2019 um 18:32 schrieb Tony Lindgren <tony@atomide.com>:
> >>
> >> Hi,
> >>
> >> * H. Nikolaus Schaller <hns@goldelico.com> [190909 14:57]:
> >>> Another question that came up by private mail from Andr=C3=A9 was if =
we
> >>> should better disable the turbo OPPs of omap34xx and 36xx by default
> >>> (status =3D "disabled";) because there are concerns about overheating
> >>> the chips and we have no thermal regulation like for omap4 & 5.
> >>>
> >>> But this would mean that every board DTS would have to set it explici=
tly
> >>> to "enabled".
> >>
> >> Yes I started thinking about that too. I think there is a requirement
> >> to do the scaling via the voltage processor for the higher modes.
> >
> > It depends on how you read the little footnotes...
> >
> > Table 4-18. Processor Voltages Without SmartReflex:
> >
> >       =E2=80=A2 This table defines the safe VDD1 (vdd_mpu_iva) voltage =
ranges to be used before using the SmartReflex AVS feature for OPPs calibra=
tion.
> >       =E2=80=A2 Values are defined when SmartReflexTM feature is deacti=
vated. They can be lower when SmartReflexTM is activated.
> >       =E2=80=A2 OPP130 and OPP1G are not available above TJ of 90C.
> >       =E2=80=A2 (6)  OPP1G is a high performance operating point which =
has following requirements:
> >               =E2=80=A2 =E2=80=93  ABB LDO must be set to FBB (Forward =
Body Bias) mode when switching to this OPP. It requires having a 1 F capaci=
tor connected to cap_vdd_bb_mpu_iva.
> >               =E2=80=A2 =E2=80=93  AVS (Adaptive Voltage Scaling) power=
 technique must be used to achieve optimum operating voltage.
> >
> > So I read this as:
> >
> > * OPP130 and OPP1G should be guarded by 90=C2=B0C thermal framework
> > * OPP1G should also set the ABB LDO to FBB mode
> > * AVS does only reduce voltage levels (to save energy =3D heat =3D prob=
lem)
> > * only if we want "optimum operating voltage" (read as: "lowest possibl=
e voltage" =3D "highest energy saving") we must use AVS
> >
> > I.e. we do not necessarily need AVS or SmartReflex or help from the
> > twl4030 (except for changing the voltage).
> >
> >> And there needs to be some way to automatically change to a lower
> >> OPP in some cases.
> >
> > That should probably be done through the thermal framework like
> > on omap4 & omap5?
> >
> >>
> >> For normal OPPs, using the twl regulator directly should be OK.
> >
> > Maybe for the turbo OPPs as well.
> >
> >> For the higher modes, maybe we could pass the callback functions
> >> from arch/arm/mach-omap2/voltage.c for the twl regulator so the
> >> voltage processor hardware can handle them directly. Or add a
> >> separate regulator driver operating the voltages like Nishanth
> >> posted patches for earlier.
> >
> > So in my (limited) understanding it would suffice to set the ABB LDO
> > to FBB mode for OPP1G.
>
> Ok, we have to check if the ti,abb-v2 "LDO" driver
> drivers/regulator/ti-abb-regulator.c
> can handle that with a DT entry similar to:
>
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/omap5.dt=
si#L365

At least for the 3630, the ti-abb-regulator driver is the same driver,
but different structures based on v1, v2, or v3 are used based on
which compatible flag is used.

I tried enabling the vbb-supply in the device tree, but the driver
doesn't load it without .multi_regulator being true.

cpus {
/* OMAP3630/OMAP37xx variants OPP50 to OPP130 and OPP1G */
     cpu: cpu@0 {
          operating-points-v2 =3D <&cpu0_opp_table>;
          vbb-supply =3D <&abb_mpu_iva>;
          clock-latency =3D <300000>; /* From omap-cpufreq driver */
     };
};

I enabled that in the 3630 structure, but then the opp must list
voltage points for both regulators.
Looking at the entry for abb_mpu_iva, it appears to have voltages that
directly match the OPP table, so I made a duplicate entry:

 opp-microvolt =3D <1012500 1012500 1012500>,
                           <1012500 1012500 1012500>;

and similar for 600, 800 and 1000 similar to the way dra7.dtsi does
it, but then I got some nasty errors and crashes.

I started undoing the stuff, and I wanted to see if the abb_mpu_iva
regulator was even running, but I would get -22 errors when I went to
read the voltage.

# cat /sys/devices/platform/68000000.ocp/483072f0.regulator-abb-mpu/regulat=
or/regulator.5/microvolts
-22

If someone has any suggestions on how to test the abb_mpu_iva driver,
let me know.

>
> Needs a little time to add to a new version of the patch set.
>
> > And make sure that the TJ does not exceed 90=C2=B0C by reducing the cpu=
freq
> > through the thermal framework. But: the thermal sensors of the omap3
> > are quite odd (they seem to jump up by 10=C2=B0 after first use).

Can we just do a dummy read to get it out of the way?  ;-)

>
> I'll leave this out for the moment for future study.
Works for me, Baby steps.

Thanks for all your work.

adam
>
> BR and thanks,
> Nikolaus
>
