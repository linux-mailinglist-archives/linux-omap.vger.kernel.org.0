Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4E2ADD4C
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 18:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfIIQdC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 12:33:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37443 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfIIQdC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 12:33:02 -0400
Received: by mail-io1-f65.google.com with SMTP id r4so30177503iop.4;
        Mon, 09 Sep 2019 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0UmsvLs/2eIfg2/+ESznBzRlQtw0y/Ei+1HR2smKXII=;
        b=RiFY26XHoQJ+56hj2k/hwTsxJBiDZf8O52M3He5D6sUtzsf6VyagMd9w8Fs7a/1/Sl
         uZBh1+3KrSLVijBrE3Yn6MqK06IcFtUxX4Fw8judpVt5a3NPY4JofVQcwseBku1+pI5I
         Q/B3k8TQiElxCoOHkVr31XH5/rekFRp0S74lZU9Ne5kukn6L8MNs1havKhjED4YMSziE
         WGV2S1Fz3xSprLGR3E79H7SuqCzyheZVOTycrJO2QNlcNgFI2EWATi9uPDKJYaJxMnzu
         UKd9bUxgGX/MEj3pHCY6bIoUD0YfVrcaV0W1ik/OEha6hNdaLn8SzGO+pnkcDcFL+xkp
         WbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0UmsvLs/2eIfg2/+ESznBzRlQtw0y/Ei+1HR2smKXII=;
        b=IHQG6J5iYPwrnqeP5g8GlfIPA95Wp1ze4BNKhLGny6z80VjYvw4pQzW82X2+vbtnbu
         Q9lr8YWHlddeyNUocLj1sIAAaGuCHUc+uenHgod0kh39A+LVSZ4CYDLcqH69kTLWUaqK
         RXg01mJkKAU65MZX5IDwu3FWd2PY7aFXFzRaLzxGeOs7JuEssV4G8YWiEOws9ofKpzVG
         KiFm7FOjlhCa2lHco4NzTIPWC/IZNZe6NMARdXwjjh70Ap5AePG4ASq5I4h2BEL4aH0B
         F8pTqhCeWOc5tm6ehiS/0PuHg3EXz3r1nvMF22UV5Abpp8S19QMmLnP1GLydki/GnVKR
         +adw==
X-Gm-Message-State: APjAAAUih23eZBfCWu9qTZUEO2DPOdbhdzRULpdOQwhmz7A2v46/VBNF
        RzlZnQhU3vXhCLYffLPeUtbpexT8XCP42Yds9N2vJ89zNic=
X-Google-Smtp-Source: APXvYqwLUGTzFQAUND6CMnF9TGgo/1ayc0PHwdHtIyzv4ZPX93KhW2j0Sdpl5i29bTOCqr7qaMiy27YMnW/0IgC/9/E=
X-Received: by 2002:a02:b395:: with SMTP id p21mr27817471jan.52.1568046779492;
 Mon, 09 Sep 2019 09:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
 <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <CAHCN7xJe+sBVZHfXN0ZEaepxAR8RGuMTVGA4GMR5Nqn5LG2TeA@mail.gmail.com>
In-Reply-To: <CAHCN7xJe+sBVZHfXN0ZEaepxAR8RGuMTVGA4GMR5Nqn5LG2TeA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 11:32:47 -0500
Message-ID: <CAHCN7xLEcjKL96i_Z=Za78xjn7+Se4btBAktoF-kdLTgq5vJwA@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 9, 2019 at 11:20 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Sep 9, 2019 at 9:57 AM H. Nikolaus Schaller <hns@goldelico.com> w=
rote:
> >
> > Hi Adam,
> >
> > > Am 09.09.2019 um 16:26 schrieb Adam Ford <aford173@gmail.com>:
> > >
> > > On Sat, Sep 7, 2019 at 2:38 AM H. Nikolaus Schaller <hns@goldelico.co=
m> wrote:
> > >>
> > >> Hi Adam,
> > >>
> > >>> Am 02.09.2019 um 23:10 schrieb Adam Ford <aford173@gmail.com>:
> > >>>
> > >>> On Mon, Sep 2, 2019 at 10:46 AM H. Nikolaus Schaller <hns@goldelico=
.com> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> But my tests show that decoding works now. So you already might gi=
ve it a try.
> > >>>
> > >>> I am traveling all this week, but I have an omap3530, DM3730
> > >>> (omap3630), and an AM3517 that I use for testing.
> > >>
> > >> now as the omap3430 and omap3630 opp-v2 tables are installed,
> > >> we could add am35x7 as well.
> > >>
> > >> What needs to be done:
> > >>
> > >> 1. add OPP-v2 table to am3517.dtsi
> > >>
> > >> for example copy skeleton from omap36xx.dtsi
> > >>
> > >> and define reasonable clock speeds. I would think about
> > >> 150 MHz, 300 MHz, 600MHz.
> > >
> > > This might be more of a question for TI, but  can we match the 3430
> > > list of frequencies?
> > >
> > > Something like:
> > >    125000  1200000
> > >    250000  1200000
> > >    500000  1200000
> > >    550000  1200000
> > >    600000  1200000
> >
> > And another question: is it more derived from omap3430 or omap3630?
> >
> > >
> > >
> > >>
> > >> Debatable is if we need a clock-latency definition.
> > >>
> > >> 2. change all voltages to 1.2V
> > >>
> > >>                        opp-microvolt =3D <1200000 1200000 1200000>;
> > >>
> > >> There is no point to specify 3 voltages <target min max> here since =
we
> > >> will never need a min and a max value.
> > >>
> > >>                        opp-microvolt =3D <1200000>;
> > >>
> > >> should also be ok (AFAIK, parser handles single-value records).
> > >>
> > >> 3. AFAIK there is no speed binned eFuse...
> > >>
> > >> But the ti-cpufreq driver always wants to read some eFuse register.
> > >>
> > >> So please check if you can read 0x4800244C and 0x4830A204
> > >> like on omap36xx and if they produce stable values (and not
> > >> random noise).
> > >
> > > For the AM3517,
> > >
> > > 0x4800244C =3D 0000 0cc0
> >
> > If it behaves like an dm3730 (Table 1-6) this would be read as 800/600M=
Hz
> > and some reserved code in bit 7:6.
> >
> > If it behaves like an omap3530 (Table 1-6) this would bean 600MHz but r=
eserved
> > value for IVA Frequency.
> >
> >
> > > 0x4830A204 =3D 1b86 802f
> >
> > would be decoded (Table 1-7) as "AM/DM37x ES1.1"
> >
> > omap35xx would have a different code (Table 1-9). Most similar is "OMAP=
35x ES2.0" with 0x1B7A E02F
> >
> > So this seems to answer that the am3517 is indeed a derivative of the a=
m/dm37xx.
> >
> > Therefore the only OPPs would be OPP50 (300 MHz) and OPP100 (600 MHz).
> >
> > Only tests or TI internal documentations could show if the am3517 still
> > runs stable at newly invented "OPP25" (150MHz).
> >
> > >
> > > The AM3517 shows these are valid addresses and I read them multiple
> > > times and they yielded the same results even after power cycling.
> > >
> > >
> > >>
> > >> If yes, we simply assume that am3517 is similar enough to omap3630,
> > >> ignore that there is no eFuse, but read the register anyways and
> > >> then ignore the bit if it is 0 or 1.
> > >>
> > >> This means that all OPPs can get
> > >>
> > >>                        opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > >>
> > >> There could also be a default handler if this property is missing,
> > >> but I have not researched this.
> > >>
> > > Like this?
> > >
> > > opp1-125000000 {
> > >     opp-hz =3D /bits/ 64 <125000000>;
> > >     opp-microvolt =3D <1200000>;
> > >     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > > };
> > >
> > > opp2-250000000 {
> > >     opp-hz =3D /bits/ 64 <250000000>;
> > >     opp-microvolt =3D <1200000>;
> > >    opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > >     opp-suspend;
> > > };
> > >
> > > opp3-500000000 {
> > >     opp-hz =3D /bits/ 64 <500000000>;
> > >     opp-microvolt =3D <1200000>;
> > >     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > > };
> > >
> > > opp4-550000000 {
> > >     opp-hz =3D /bits/ 64 <550000000>;
> > >     opp-microvolt =3D <1200000>;
> > >     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > > };
> > >
> > > opp5-600000000 {
> > >     opp-hz =3D /bits/ 64 <600000000>;
> > >     opp-microvolt =3D <1200000>;
> > >     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> > > };
> >
> > Yes.
> >
> > >
> > > What does opp-suspend do?  I noticed it in the 34xx.dtsi
> >
> > Good question. I think it is the OPP to be chosen before suspend:
> >
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/opp/opp.tx=
t
> > says
> >
> > - opp-suspend: Marks the OPP to be used during device suspend. Only one=
 OPP in
> >   the table should have this.
> >
> > But that doesn't mean the drivers make use of this marker.
> >
> > This makes me also wonder if we should tag the OPP1G and OPP6 as "turbo=
-mode"...
> >
> > Another question that came up by private mail from Andr=C3=A9 was if we
> > should better disable the turbo OPPs of omap34xx and 36xx by default
> > (status =3D "disabled";) because there are concerns about overheating
> > the chips and we have no thermal regulation like for omap4 & 5.
> >
> > But this would mean that every board DTS would have to set it explicitl=
y
> > to "enabled".
> >
> > And another concern is if the 1GHz OPP doesn't also need to switch the
> > ABB bias LDO to a different mode. This is not done by the ti-cpufreq dr=
iver.
> > Maybe it is done by some driver in mach-omap but I have not searched fo=
r.
>
> ti-omap5-opp-supply.txt shows
>
> Required Properties for Device Node:
> - vdd-supply: phandle to regulator controlling VDD supply
> - vbb-supply: phandle to regulator controlling Body Bias supply
>       (Usually Adaptive Body Bias regulator)
>
> Looking at the ti-cpufreq.c driver, it appears as if there is both a
> vdd and a vbb listed in the table (line 302).  AFAICT, we should be
> able to just set it up pointing VDD to the PMIC and VBB at the ABB
> unless I am missing something.
>
> Currently, I have the follwing in my device tree:
>
> /* Reroute power feeding the CPU to come from the external PMIC */
> &reg_arm
> {
>      vin-supply =3D <&sw1a_reg>;
> };
>
> &reg_soc
> {
>       vin-supply =3D <&sw1c_reg>;
> };
>
Ignore that.  (wrong board)
Correction,

cpus {
     cpu@0 {
          cpu0-supply =3D <&vcc>;
     };
};

I had too many boards.
> Is this still correct with the new cpufreq driver?   I am wondering if
> we need VDD and VBB references under the cpu entry.  The
> ti-omap5-opp-supply ready me also reads:
>
> /* Device Node (CPU)  */
> cpus {
>      cpu0: cpu@0 {
>           device_type =3D "cpu";
>
> ...
>
>           vdd-supply =3D <&vcc>;
>           vbb-supply =3D <&abb_mpu>;
>      };
> };
>
> This isn't in the ti-cpufreq.txt, however it might actually be
> utilized based on a quick skim of the driver.
>
> adam
> >
> > So the concern is that we will run the turbo modes outside of the TI sp=
ecs
> > while before applying the patch set this would be a lesser problem (OPP=
130
> > should also be thermally limited to 90=C2=B0C).
> >
> > I.e. users of 1GHz capable boards will not only see 25% more speed but
> > suddenly higher SoC temperatures than the years before.
> >
> > >
> > >> 4. add compatible to ti-cpufreq
> > >> and share the register offsets, bit masks etc. with omap3630:
> > >>
> > >>        { .compatible =3D "ti,am33xx", .data =3D &am3x_soc_data, },
> > >>        { .compatible =3D "ti,am3517", .data =3D &omap36xx_soc_data, =
},
> > >>        { .compatible =3D "ti,am43", .data =3D &am4x_soc_data, },
> > >>        { .compatible =3D "ti,dra7", .data =3D &dra7_soc_data },
> > >>        { .compatible =3D "ti,omap3430", .data =3D &omap34xx_soc_data=
, },
> > >>        { .compatible =3D "ti,omap3630", .data =3D &omap36xx_soc_data=
, },
> > >>
> > >> 5. configure for CONFIG_ARM_TI_CPUFREQ=3Dy
> > >>
> > >> This should IMHO suffice.
> > >
> > > If you're OK with what I am proposing, I'll run some tests and submit
> > > a patch.  I won't promise to fully understand what's happening.  :-)
> >
> > Same for me :)
> >
> > BR and thanks,
> > Nikolaus
> >
