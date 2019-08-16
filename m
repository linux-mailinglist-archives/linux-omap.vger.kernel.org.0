Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20990175
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2019 14:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfHPMZk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 08:25:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42653 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfHPMZj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Aug 2019 08:25:39 -0400
Received: by mail-io1-f67.google.com with SMTP id e20so5761994iob.9
        for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2019 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3PWmiJbOtfqeFuBKYpEEykboS5Br8J3vlu8KRbTbQfQ=;
        b=PX+ujAj61Whx/jRrNJTWIIPdzvLM8kQW0j/BYAsU4byhQhPj5TIURy3ntNQmYCunoZ
         M4AS54esluzPYMes/7jHFWLzdESC6pucrNXCY+yezFCKYKAuqHmR72phmLwiKyZlKwhP
         jTCyDFZ52mrBYEMKYuNk6O9z0wjhdsaTDIPHJMTqhOTx+0sYlThQuQbjA1L8eWnZc+a5
         Oo8UCH36QRzy0UO/vK8jd2F4jFB8Lv3sDaPfx5Blg+zm3VI/uITSJKmLTudi6xi0eIgn
         wSoMfuBlkYDEpRdhKyMiTjebbRdDBCrBy1wCHnlUa+rX8jMuwMHF6I96kp9WTTbS2i7j
         tLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3PWmiJbOtfqeFuBKYpEEykboS5Br8J3vlu8KRbTbQfQ=;
        b=GS/8PCfSJtw/FBeGstVTVqsqJ3To2XVZ8MCRi8i2I+Mk/2bhbJzq/RxsUTAWhNRzWR
         c9AaWKYC+ZKQ10yl4BmEPLcnpJnQmAQWrYFrweGtSbZ3fVLyUzlwitK/u4bFMWIncwxq
         t0z86+xHuQvWzyPrKVhOiOhaIxv3rnKhELdaNp2QO3xjAIwUi6LfMrmwfKZ5I3WZ4Iz8
         GFBwfh+dqGfEJiP1v3mM76mSmYjCPy071ZyT/skezGl4IUTodqWZBZzbhCJISu26pPkh
         GQ7mwDv3J/CZXOCevU+mZ+OAkz1Sf2BsWuvAzrtZOJe2DJIlOiV62qdh5Nl9VKUzbcTi
         n51Q==
X-Gm-Message-State: APjAAAWbApilbHasH/gbNkuQc74ZxpMGoHDv2vgN2QLSzdRSyJUBhHm9
        YzHiazhj29VtGrOqKTT+9FNcy6TAcrfYX3PoKpc7DXnl
X-Google-Smtp-Source: APXvYqxF7xf9SM9a+VBFKonuHbZbZ5wYaBIIQWqJx8XYgzs6yI9ESxxDq5nmrUzqCRY2PGMgB+FcNtbP1j2UTtsrHTM=
X-Received: by 2002:a05:6638:c8:: with SMTP id w8mr4156175jao.52.1565958338661;
 Fri, 16 Aug 2019 05:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
 <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
In-Reply-To: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 16 Aug 2019 07:25:21 -0500
Message-ID: <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 15, 2019 at 5:16 PM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
> Hi,
>
> > Am 15.08.2019 um 17:41 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Wed, Jul 31, 2019 at 8:42 PM Andr=C3=A9 Roth <neolynx@gmail.com> wro=
te:
> >>
> >> Hi all,
> >>
> >> the current mainline kernel does not provide support for running
> >> omap36xx based boards at 1GHz for chips like DM3730 where this would b=
e
> >> supported. It has been discussed many times, I hope you do not mind me
> >> bringing this up again ;)
> >>
> >> I found some proposed patches by Nishanth Menon from TI [1] and a
> >> statement [2] that drivers for the Voltage processor and controllers a=
re
> >> needed to properly run those chips at 1GHz using Adaptive Voltage
> >> Scaling (AVS) and SmartReflex (SR).
> >>
> >> As there are drivers for VP and VC in the kernel, I tried to figure ou=
t
> >> how to enable them and found a PATCH 1/3 which enables SR in the TWL
> >> driver. However, the order in which PM, SR and TWL are initialized or
> >> probed did not match, which I was able to fix with PATCH 2/3. In the e=
nd
> >> calling omap_sr_enable in PATCH 3/3 finally enables SR and my board
> >> seems to run fine at 1GHz (not battery powered, full performance
> >> required).
> >>
> >
> > Question:
> >
> > Not all 36xx SoC's can do 1GHz.  I know there is a register that we
> > can read on the OMAP36 to determine its max speed, but I wasn't sure
> > how that would play into cpufreq or whatever is going to be driving
> > the dynamic voltage and frequency scaling.  Are going to have to
> > expect people who have the 1GHz version to use a custom device tree?
>
> I had discussed off-list with Andr=C3=A9 the idea that omap36xx.dtsi gets
> an additional 1GHz OPP.
>
> But there is some driver code that checks if the "speed binned bit"
> is not set for 1GHz and eliminates all OPPs above 800MHz by code.
>
> I tried to get such code into drivers/cpufreq/ti-cpufreq.c but
> gave up when I found that this is not used for the omap36xx.
>

I then wonder if we could add the 1G OPP to the device trable and make
it as 'disabled'
Something similar was done for the da850 (think omap-l138 or AM1808)
https://lore.kernel.org/patchwork/patch/1061044/

If the 3-patch series already submitted is accepted, having the
foundation for the 1GHz OPP shows them what they need to make it work.
I am really exited about what you are doing.

> > AFAICT, there is an updated opp-v2-ti table which has a 'supported'
> > entry which appears to read registers to determine which opp's are
> > available for the am33xx, but I don't think this applies to the
> > omap36.  Do we need something that like for this?
>
> Yes. I also noticed that there is an old style OPP format and a new
> style which allows to make the OPP list depend on conditions like am33xx.
> All described in Documentation/devicetree/bindings/cpufreq/ti-cpufreq.txt=
.
>
> To me it looks as if this opp-v2-ti table is what we need for omap36xx.dt=
si
> as well to manage the speed-binned bit of DM3730. To me it looks sufficie=
ntly
> similar to an "eFuse" bit. But I didn't look into the details of the
> opp-v2-ti format, because all that is a second step after getting 1GHz st=
able
> on 1GHz capable chips.

I looked into this once, but I couldn't figure out how to interpret
the "opp-supported-hw" entries.  If you keep me in the, loop, I'm more
than happen to help where I can and/or test when possible.

adam
>
> So:
> step 1: get 1GHz stable
> step 2: turn it off on 800MHz rated chips
>
> BR,
> Nikolaus
>
