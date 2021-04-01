Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FF9350C13
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 03:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhDABsN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 21:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhDABrw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 31 Mar 2021 21:47:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E06006105A;
        Thu,  1 Apr 2021 01:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617241672;
        bh=G2yJZdijShzF6Eiq4JKJhqU3MQLiI4jRpJuwzIzshZ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AKswf+F8LN3LqcMldQgErtoNOnRl5HRmeuT6m5JJ2RlEejiC5x4NryC2d72ZSdNpW
         WkqIgNFZq8QlEU++4L55a9FVfCBRRNpZ3P4dgb7LgIPZgMHx+HC39KJsGNcWLJfEAP
         /50rDwXXy3MxlmVL0bwpwouIp9+H4wKvpLse2WmB2SbEw4cqOdxxaLmVFhQ1VoTCVO
         GVrvGnEss/3CQ65qnkw9cDAwo56Xn/xvGUX0dNazHWp1z/5fM3kjgskEnR8DM3OSKG
         rbIaE5ldq7kqQwtIqnWiK0SI1/mjRAvne9ep2pd0kcXdlN0AZaQa058z3fEbz2Fy/z
         PFQe25hMcGSxA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YGQNyGDkAbUXRYtA@atomide.com>
References: <20210329164222.26794-1-dariobin@libero.it> <161707108197.3012082.13148389244272034996@swboyd.mtv.corp.google.com> <YGQNyGDkAbUXRYtA@atomide.com>
Subject: Re: [PATCH v3 0/4] clk: ti: add am33xx spread spectrum clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>
Date:   Wed, 31 Mar 2021 18:47:50 -0700
Message-ID: <161724167065.2260335.15543151418752525635@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2021-03-30 22:51:04)
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
> > What is your merge strategy? Should all the patches go through clk tree?
> > Or you'll send via arm-soc?
>=20
> Probably best to just merge all via the clk tree as that's where most of
> the changes are.
>=20

Ok. If nobody reviews/acks the last patch in a few days I'll merge the
pile through clk tree.
