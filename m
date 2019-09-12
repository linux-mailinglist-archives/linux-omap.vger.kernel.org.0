Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D92CB15CE
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 23:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfILVTq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 17:19:46 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35388 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbfILVTq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 17:19:46 -0400
Received: by mail-io1-f67.google.com with SMTP id f4so57589575ion.2;
        Thu, 12 Sep 2019 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KDWzvEyLbt9ZRVjv6CRHED1zaomyVFgELFus5HhFxZ4=;
        b=NxMjtdoKwc2ETZ8LOSWH4eaN8RgdzDbjUUNhTG0lzrwK3fhb5ydT85icFiqTW+FlqR
         wZBY5AvVlDnpnsYYee3ZebIh6NYh+ywWt8T3gjVXwJOriGoIkFJvUqkWqqlAId6JbjKd
         MXC4HimyysqUw12MUNkKWfz9CFlyXYvAO7boMAO0D9uUXJESJEYtQrjwI03CEbmSxSMm
         v1xnpKnFG9ygIKc2Vf0ziEVGM6SJthc7SygjEjXCPdpdTxwlNULtWwZ2p1KT+EkEnATV
         QaS0P5NcDksXZ/vwHOalJdlhtoOhwRxgL2FB4aOQ5MrEe5qRpSp1XeV48jcTPRJieZK/
         LIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KDWzvEyLbt9ZRVjv6CRHED1zaomyVFgELFus5HhFxZ4=;
        b=YTevQUqUstOUHh9NjDviD89SVHD8vVYNZKirlI9ZH0Hub1TArJvlF/g1gqbqWqRRHD
         LGZHhmbfmXZpZBLLoxfHmtz3ka83WTAb6q10bEdfRexKFXSTQxJj3dluKGescpX66jIL
         BA7kpWEO7WJF2GRORfoxipmhQPk2Wg+/OZtPsq/XmmoZoMiHy5bqU9Oey183c5CPNiGF
         eAO0KhK5UtH8+FhGrrn3YgbghmdT+bR7qsl92gVG+VzQPUZpZLxxCIaEvSUlymwDxXRT
         X3hgHJLNI8XmOUD4XjpOQx0Q50oz6to02Yja1jAeWl7rww0xFlIuG6Bv7zuLfrAnV7Xj
         V7lg==
X-Gm-Message-State: APjAAAX+ueu7ncALZc+DnZKGZ09GUkNQ+g7SOUnpI+WhKChFICeJ5FtE
        ltJw65xhNltxqZQHugKLlpKmAJaFBN0k5yqSwR4=
X-Google-Smtp-Source: APXvYqwid3aXWXb3en8UiljRTQelavVsuQOhtfOZqlYOagjIlNk64X1MraslJZwHfAH9tCKWeT04bleAb+nL2MNFISs=
X-Received: by 2002:a5e:dc47:: with SMTP id s7mr5335220iop.228.1568323184899;
 Thu, 12 Sep 2019 14:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
In-Reply-To: <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 12 Sep 2019 16:19:33 -0500
Message-ID: <CAHCN7xKjwkJHysSkNymF=sw6KuS=FqbapuRFZODuj6E_hmRG1A@mail.gmail.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 12, 2019 at 4:12 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 12/09/2019 20:30, Adam Ford wrote:
> > The thermal sensor in the omap3 family isn't accurate, but it's
> > better than nothing.  The various OPP's enabled for the omap3630
> > support up to OPP1G, however the datasheet for the DM3730 states
> > that OPP130 and OPP1G are not available above TJ of 90C.
> >
> > This patch configures the thermal throttling to limit the
> > operating points of the omap3630 to Only OPP50 and OPP100 if
> > the thermal sensor reads a value above 90C.
>
> Out of curiosity, what are the OPP50 and OPP100 mentioned above? and
> what does mean "OPP130 and OPP1G are not available above TJ of 90C"?
>
OPP130 is the 800 MHz and OPP1G is 1GHz operating point.
The 90C is the max junction temperature.  When the temperature exceeds
90C, the processor is not designed to operate at 800+ MHz.  The
statement itself is a direct quote from the public datasheet for the
dm3730, Table 4-19.

The datasheet is: http://www.ti.com/lit/ds/symlink/dm3730.pdf

The operating points were updated in [1], but they haven't yet been
fully applied yet, but during the discussion, the question came about
regarding how to limit the speed at high temp, so that's why this
patch was done.

[1] - https://patchwork.kernel.org/patch/11141643/


adam

> I don't see the connection between these OPP names and the definition in
> the DT.
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36=
xx.dtsi
> > index 4bb4f534afe2..58b9d347019f 100644
> > --- a/arch/arm/boot/dts/omap36xx.dtsi
> > +++ b/arch/arm/boot/dts/omap36xx.dtsi
> > @@ -25,6 +25,7 @@
> >
> >                       vbb-supply =3D <&abb_mpu_iva>;
> >                       clock-latency =3D <300000>; /* From omap-cpufreq =
driver */
> > +                     #cooling-cells =3D <2>;
> >               };
> >       };
> >
> > @@ -195,6 +196,31 @@
> >       };
> >  };
> >
> > +&cpu_thermal {
> > +     cpu_trips: trips {
> > +             /* OPP130 and OPP1G are not available above TJ of 90C. */
> > +             cpu_alert0: cpu_alert {
> > +                     temperature =3D <90000>; /* millicelsius */
> > +                     hysteresis =3D <2000>; /* millicelsius */
> > +                     type =3D "passive";
> > +             };
> > +
> > +             cpu_crit: cpu_crit {
> > +                     temperature =3D <125000>; /* millicelsius */
> > +                     hysteresis =3D <2000>; /* millicelsius */
> > +                     type =3D "critical";
> > +             };
> > +     };
> > +
> > +     cpu_cooling_maps: cooling-maps {
> > +             map0 {
> > +                     trip =3D <&cpu_alert0>;
> > +                     /* Only allow OPP50 and OPP100 */
> > +                     cooling-device =3D <&cpu 0 1>;
> > +             };
> > +     };
> > +};
> > +
> >  /* OMAP3630 needs dss_96m_fck for VENC */
> >  &venc {
> >       clocks =3D <&dss_tv_fck>, <&dss_96m_fck>;
> >
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
