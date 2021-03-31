Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD233350502
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhCaQtB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 12:49:01 -0400
Received: from smtp-34-i2.italiaonline.it ([213.209.12.34]:38195 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234119AbhCaQsk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 31 Mar 2021 12:48:40 -0400
Received: from oxapps-30-132.iol.local ([10.101.8.178])
        by smtp-34.iol.local with ESMTPA
        id Re1ElwntK5WrZRe1ElgaZ8; Wed, 31 Mar 2021 18:48:38 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617209318; bh=Of8HOIFaFMIakwrrvMX5k+cnZfAxOALZ7VG6BH9w3tM=;
        h=From;
        b=UFpNZMB0o878+Sdcv+0gOWek0RvnjpiOZNiokvvhnZ/9YTzLzgjs3pqSmc8modp0V
         zW6X0vtmIFnUBMNwQqlcfWHNkspL+4ee9UEm9Un+vxzWtQNTMfAxiG6JdxdcW0VBVW
         5cswqdqBqcgqMJGMiVD33/rMn+sPbtmNE3HWAah1f2Z+Qm5sHA3sGiDolNaG/hNY2t
         V9RY8DRQDgoIWX2nIEmieiAg1Qy/alLN0MfMtUtbxuMUzNcyj+WMVP9ycyTmi9bugZ
         ixtp6Dnn1lLlfdeO7zaC0r6xJLPcL/uHW/olo1ME9h0urT6jL3xnCizOv8uPFyWb1c
         ruvOAZcDL3W4Q==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=6064a7e6 cx=a_exe
 a=iUxb6lXnTT1s429i9ALYXg==:117 a=UPWQtH3J-JgA:10 a=IkcTkHD0fZMA:10
 a=_gZzKa99_6AA:10 a=2KMo9-giAAAA:8 a=VwQbUJbxAAAA:8 a=3UXsuAmxLgeg-JLg2n4A:9
 a=QEXdDO2ut3YA:10 a=jpCfQFe7a20IPbtE3JEv:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=AjGcO6oz07-iQ99wixmX:22
Date:   Wed, 31 Mar 2021 18:48:36 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tony Lindgren <tony@atomide.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Message-ID: <1766999502.215268.1617209316614@mail1.libero.it>
In-Reply-To: <YGQNyGDkAbUXRYtA@atomide.com>
References: <20210329164222.26794-1-dariobin@libero.it>
 <161707108197.3012082.13148389244272034996@swboyd.mtv.corp.google.com>
 <YGQNyGDkAbUXRYtA@atomide.com>
Subject: Re: [PATCH v3 0/4] clk: ti: add am33xx spread spectrum clock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 87.20.116.197
X-Originating-Client: open-xchange-appsuite
x-libjamsun: hnVdgKDLVYJ/y6bXwAkWv/iDAPJj0RoS
x-libjamv: XJO1Mu8mf/8=
X-CMAE-Envelope: MS4xfN81xeT9ObTSWwajh635DSRU2jTmBrUkcigubVWEJ+IwPVQ/Ygt8kqQAW+qK1LeT6WpbBNhHjtJW9N04ieC1Xn+TSsMO9W+DiFCEpy05BwRKdWJOY5kn
 /1ZdTc6fYO/qGQbp38/2XqT+23lHsNHm+oK2DN049bR2uyxOYlF/JL0gld5FekTaMXoF/ud1QHlVjL2h7RoDwwkRxPQ3ZKl/V2pdgT1TwxK0oBk3pEc9IJug
 H7ah7Oman9zOExhb22W8Y/4Wdw1lpP5K96fXiHOZOJ3uNeBad87R9lqiiEMGKOdDhHbmMwMzbM2BsUbR/9P2CC8syI+fcNI0B6dRM+PhRZPDJ2Ov2KnKuVjr
 yFDYHFZ2CLPxefmYcsOgNCY2tHf3sDSFF4kySmzJwpzUO3DFLL8vTyYyv3wsp2WXxKCZWitKNck5XJTgcM/3jb+S+n4w+DKfiCMgpU6MmZzRM/AFI4/IuXSM
 8K0OMztguybu0+e74lT50zwKSgZSdAIzuFGTJSS2dOeLd2ysatueJ1YpxeapZRXAI7LZsaFeWvy65JxV9L7o7VAqye5rVFKfzYyHjg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Il 31/03/2021 07:51 Tony Lindgren <tony@atomide.com> ha scritto:
>=20
> =20
> * Stephen Boyd <sboyd@kernel.org> [210330 02:25]:
> > Quoting Dario Binacchi (2021-03-29 09:42:17)
> > >=20
> > > As reported by the TI spruh73x RM, MPU and LCD modules support spread
> > > spectrum clocking (SSC) on their output clocks. SSC is used to spread
> > > the spectral peaking of the clock to reduce any electromagnetic
> > > interference (EMI) that may be caused due to the clock=E2=80=99s fund=
amental
> > > or any of its harmonics.
> > > The series allows you to enable and adjust the spread spectrum clocki=
ng
> > > for all am33xx PLLs for which it is supported.
> > >=20
> >=20
> > What is your merge strategy? Should all the patches go through clk tree=
?
> > Or you'll send via arm-soc?
>=20
> Probably best to just merge all via the clk tree as that's where most of
> the changes are.
>=20

This means that I no longer have to send patches to TI / OMAP maintainers, =
commiters=20
and fixers, as well as at linux-omap@vger.kernel.org ?
Even if the a1e980789b06 ("am335x-spread-spectrum) clk: ti: add am33xx spre=
ad spectrum clock support")=20
patch is basically related to the AM33xx/AM43xx SOCs?

Thanks and regards,
Dario

> Regards,
>=20
> Tony
