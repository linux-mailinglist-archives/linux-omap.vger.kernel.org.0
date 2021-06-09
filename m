Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0523A08BC
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 02:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhFIAyZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 20:54:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231787AbhFIAyZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Jun 2021 20:54:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CD5E613AD;
        Wed,  9 Jun 2021 00:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199951;
        bh=+VJwg/+oPcdPmnwCFX5Tmz/yVlxPYk6m+Z2su9FLoVI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UfyTkFI84uD7e4F87PI1Ap/1eFomG7Q2AYgrjvy5T1Q+ee5CXgM0wfLM6qttB/df9
         f1yZtAuoms1upb82cTs2w/X0n4au+nERK/zDkgdYrQQ1TAdTBFEX/FY2xc9bI+ZK2L
         CZqyFn8CBWTDaw2ht5610GoTngrTkleL4MWBOkzqrbjX/p6PDA7G/zeGulBrIz37Xp
         K0yQYRLOyAzUk/UdvDcBzNDhiW+CMlQAT82lbg8v5r0yoxDXVA4d3rrQuwGYsBW05P
         8ktjgei5Ti+rca1cGmzJIbWz2cwgAUr9LqcCBB5iSEkwQ6fqyV78TPpW6Ug3BY+VW8
         VJxKYtfecHFwA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606202253.31649-6-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it> <20210606202253.31649-6-dariobin@libero.it>
Subject: Re: [RESEND PATCH v7 5/5] clk: ti: add am33xx/am43xx spread spectrum clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:52:29 -0700
Message-ID: <162319994979.1835121.15194981692038400158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-06-06 13:22:53)
> The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
> As reported by the TI spruh73x/spruhl7x RM, SSC is only supported for
> the DISP/LCD and MPU PLLs on am33xx/am43xx. SSC is not supported for
> DDR, PER, and CORE PLLs.
>=20
> Calculating the required values and setting the registers accordingly
> was taken from the set_mpu_spreadspectrum routine contained in the
> arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
>=20
> In locked condition, DPLL output clock =3D CLKINP *[M/N]. In case of
> SSC enabled, the reference manual explains that there is a restriction
> of range of M values. Since the omap2_dpll_round_rate routine attempts
> to select the minimum possible N, the value of M obtained is not
> guaranteed to be within the range required. With the new "ti,min-div"
> parameter it is possible to increase N and consequently M to satisfy the
> constraint imposed by SSC.
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Reviewed-by: Tero Kristo <kristo@kernel.org>
>=20
> ---

Applied to clk-next
