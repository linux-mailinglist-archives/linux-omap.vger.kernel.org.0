Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3433EADD63
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 18:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfIIQjB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 12:39:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39263 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfIIQjB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 12:39:01 -0400
Received: by mail-io1-f68.google.com with SMTP id d25so30237821iob.6;
        Mon, 09 Sep 2019 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+exDBKH+dNdNetnxtSgRIkoL8JdSpk5kKasTurEcRLY=;
        b=QXaFOCvCirix91oq1I3y9jyO7zmFYj1kibyfDKF5h6JjaKceZ3CMkszs6cXfFv/MW6
         rlA4etc7Xc+FkdMlpD3z3UImJktiFeNFtOssjSQJRvQ8uay1E7Nn0+igaWT20Ky8h1J7
         q8DMnzKoUF/NE2+S6BGk6w45LnM1SiSW67UzhfX5vhOdpGByN2YzUQrGFUpQG/rBe4A2
         ffj81xe4UMFBkPV1DSlCeAbuozurYMKgpZekdjP0NNCXHwS15EYDhQ8kU/9Il+JeAF3Y
         r4p/euuaUqJDvvwgzOQsyJVhrfLmPjsRRz3kZRO5o9p12hgi8Iu9UZfBJDFujJ6m93To
         uDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+exDBKH+dNdNetnxtSgRIkoL8JdSpk5kKasTurEcRLY=;
        b=HmSTcTG11v7aoVsBqFCBXHaXFq4qegN5FqeOxs21b9m95XDyXQPwaqPwoL6pOfGf1y
         cFdOl7YMPc0lkUFwS6LXJlbRDKWAbPmtzm/GXrClAVgMVUCLkUdul4aazBWgw8hLF/bC
         TBe/gMPKDesYeUrbftnxFt8+dcFxSBqfCupQJqRCJzxDZA2BthO3On3VQoVM5zZdjpxe
         /GdTV/tec3wKAsACtP9C+w8trS7OQ53CPUYJeQ3uyXnyzBqzZizirkWIEXO3noSvXuaa
         FOUD92f/zKezZIUUt+kfYRdV2NxHWzt4PKY4WUIN3jlfFwl+BbW6LUOdXr5w28FkswRg
         +nIg==
X-Gm-Message-State: APjAAAVxgx8QJ7jGJ9QSW447/L0eobdt/vAEW4FwMCgnehzw9AfPHUBk
        /8Fn0VhGxNBuGC6mZxz0j5HJF0muZeNFlxBkUOU=
X-Google-Smtp-Source: APXvYqzB5N65Dg7TWKyypDrotWGW9o3/gso0zSAc4Xb5afFY8ICmDS2eZQ/vuOUmdbEYlhs/LetR7ytw1TtkmwFUZ1o=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr575826iod.205.1568047138483;
 Mon, 09 Sep 2019 09:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
In-Reply-To: <20190909163236.GP52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 11:38:47 -0500
Message-ID: <CAHCN7xLyeSFCMn=qhmYa0ZsqsQheHDz8zyBz38giECK9wixbuw@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
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

On Mon, Sep 9, 2019 at 11:32 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * H. Nikolaus Schaller <hns@goldelico.com> [190909 14:57]:
> > Another question that came up by private mail from Andr=C3=A9 was if we
> > should better disable the turbo OPPs of omap34xx and 36xx by default
> > (status =3D "disabled";) because there are concerns about overheating
> > the chips and we have no thermal regulation like for omap4 & 5.

I thought there was a thermal sensor?

cpu_thermal: cpu_thermal {
        polling-delay-passive =3D <250>; /* milliseconds */
        polling-delay =3D <1000>; /* milliseconds */
        coefficients =3D <0 20000>;

                        /* sensor       ID */
        thermal-sensors =3D <&bandgap     0>;
};

Can this driver somehow notify the cpufreq that we've hit some limit?
I know it's not as accurate as one would like, but even for non-1GHz
versions, having it downclock would be a good thing when running at
extreme temps.

adam
> >
> > But this would mean that every board DTS would have to set it explicitl=
y
> > to "enabled".
>
> Yes I started thinking about that too. I think there is a requirement
> to do the scaling via the voltage processor for the higher modes.
> And there needs to be some way to automatically change to a lower
> OPP in some cases.
>
> For normal OPPs, using the twl regulator directly should be OK.
>
> For the higher modes, maybe we could pass the callback functions
> from arch/arm/mach-omap2/voltage.c for the twl regulator so the
> voltage processor hardware can handle them directly. Or add a
> separate regulator driver operating the voltages like Nishanth
> posted patches for earlier.
>
> Regards,
>
> Tony
