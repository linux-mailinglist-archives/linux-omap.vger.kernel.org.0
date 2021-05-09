Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D3A3776B6
	for <lists+linux-omap@lfdr.de>; Sun,  9 May 2021 15:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhEINHn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 May 2021 09:07:43 -0400
Received: from smtp-18-i2.italiaonline.it ([213.209.12.18]:51165 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229616AbhEINHm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 9 May 2021 09:07:42 -0400
Received: from oxapps-31-138.iol.local ([10.101.8.184])
        by smtp-18.iol.local with ESMTPA
        id fj8mlSlt1gCmjfj8mlX7w1; Sun, 09 May 2021 15:06:37 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1620565597; bh=LI1EWWQ3YXRDXMn9xnQOuvXpJUlF/VXkWjyGguHRlqQ=;
        h=From;
        b=MgSaZ5IGEUsby9GMmihGm1lkw5paHxrm5JpZLGyOYwcXjnEHtbkGkEFiuh3NcwX9u
         QbTDfqprZk6PAz8KPaxdkMZIq7u4vBTg0zxURa6i2TJy8xZJn8cuJe3gvLf0uMNQHX
         kgh/MjuCqAJwmzDCi+rT1Sf+hkpMhPY7fX25ezK5xg6dgMrlvInCYIGGVJp7bFGuKi
         8wqsRCkz3jtBgwH5h1A8A0bGA3GwXOIux/JFuiFBzK6H3YFFNlh/rkfLZL6HwyNq5f
         HaAglxVf9ZWZ7cyhjeck8npYabM6aXJC9HmC/nhGdTi28ZLPnwb2RxR9atXc/l4E7b
         NX5JOGYMMKeeA==
X-CNFS-Analysis: v=2.4 cv=X5uXlEfe c=1 sm=1 tr=0 ts=6097de5d cx=a_exe
 a=SkAuTGSu9wVn7tcq8ZjrZA==:117 a=VYA5D5F8Gk0A:10 a=IkcTkHD0fZMA:10
 a=4ehuGOvBq5EA:10 a=VwQbUJbxAAAA:8 a=inwdKGJjCKPWPO92qNgA:9 a=QEXdDO2ut3YA:10
 a=5yUOnwQy5QICz8m5uxDm:22 a=AjGcO6oz07-iQ99wixmX:22
Date:   Sun, 9 May 2021 15:06:36 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Message-ID: <1870803595.135812.1620565596917@mail1.libero.it>
In-Reply-To: <161724167065.2260335.15543151418752525635@swboyd.mtv.corp.google.com>
References: <20210329164222.26794-1-dariobin@libero.it>
 <161707108197.3012082.13148389244272034996@swboyd.mtv.corp.google.com>
 <YGQNyGDkAbUXRYtA@atomide.com>
 <161724167065.2260335.15543151418752525635@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 0/4] clk: ti: add am33xx spread spectrum clock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 95.244.94.151
X-Originating-Client: open-xchange-appsuite
x-libjamsun: 70Pb3JSJkMjw5JvbakU3Wh7D4w5S68w2
x-libjamv: dvoWA22thEM=
X-CMAE-Envelope: MS4xfIH95fOfdA6rNtVjj/ofgnk4DRxWUlcrXrOqNDwFhhDQr3MeNFf0hYJ4Dtm/vRGkCkXLvHriNKTexv5Xn0Nkst52KU+Wsr0wzDkgK8n1AzXn5U+Wog/9
 f85Nkzfl/SDDpnVbGch7pcxJX0g5UCorPxQtVW3zANy+j9vUCklfQeasIPUboJZq1REgR/ALtnT19X2UyX8ZAc5NUPKikfYdUG2zcaPqxOC+g2jl1A9+JBNh
 31va2+j2JDvjGmKos0ch+dLqCbQjtzdZWVUydBGOMVxFFFzOCHUqYp22jNYtTK0H6O3TfYZbfoA4qWcfpoJuQIDNKKejDGA/SEBjVh4MD6w4nDRl8ItckCZ8
 KpGMI0lw9t+yjdanalzMHnBCncYltMlJRWuhG2gl4oI2mfu40YsqYjsg7JEfOU1IcFmFD15cKq/3w7WY582t96tdxV0xBt4xN85+4S4LfbvOpBYX+dMelX+H
 wlsgGDQhUUwYwc44osQATdqQeYKBeGOrWsm/i4Q6Wg/dF0IY+qqL+vmx6nnCyLEM0UXXHgp+/15fl1GEGaF8ma67eoSv1miZeNjtWQ==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen, Hi Tony

> Il 01/04/2021 03:47 Stephen Boyd <sboyd@kernel.org> ha scritto:
>=20
> =20
> Quoting Tony Lindgren (2021-03-30 22:51:04)
> > * Stephen Boyd <sboyd@kernel.org> [210330 02:25]:
> > > Quoting Dario Binacchi (2021-03-29 09:42:17)
> > > >=20
> > > > As reported by the TI spruh73x RM, MPU and LCD modules support spre=
ad
> > > > spectrum clocking (SSC) on their output clocks. SSC is used to spre=
ad
> > > > the spectral peaking of the clock to reduce any electromagnetic
> > > > interference (EMI) that may be caused due to the clock=E2=80=99s fu=
ndamental
> > > > or any of its harmonics.
> > > > The series allows you to enable and adjust the spread spectrum cloc=
king
> > > > for all am33xx PLLs for which it is supported.
> > > >=20
> > >=20
> > > What is your merge strategy? Should all the patches go through clk tr=
ee?
> > > Or you'll send via arm-soc?
> >=20
> > Probably best to just merge all via the clk tree as that's where most o=
f
> > the changes are.
> >=20
>=20
> Ok. If nobody reviews/acks the last patch in a few days I'll merge the
> pile through clk tree.

It's been over a month since I submitted the patches. Meanwhile Tero Kristo=
 has=20
reviewed the most important patch of the series. However, I have not seen a=
ny=20
progress in the state of the series. Furthermore, I don't see the DTS patch=
es=20
in the clk tree. Am I missing something? Or do I have to do something? Sorr=
y=20
for the questions but I don't have much experience with patch merge strateg=
ies.

Thanks and regards,
Dario
