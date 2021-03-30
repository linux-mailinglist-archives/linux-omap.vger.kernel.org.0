Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8700734DE52
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 04:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhC3CY7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 22:24:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:53210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231293AbhC3CYo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 22:24:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B4E86196C;
        Tue, 30 Mar 2021 02:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617071083;
        bh=fBhHzGvP1lCCHePW0Kd7FME8VLq+s8l29XStBYpzrOE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=er7ozKxVqEUtuvokDCQ5f8bWZt3hUwtPVyAJgC6VBHWVUsdqTT0pqSUYUqyBAhNrm
         tEI9kNyMvPSMqAgC90LTUyhNXAMYQZvoU5h8tOccDZKfQNpPy1rPknxlHIna8gSP/3
         EMX4gWkA3A+8SPK2DowjUfwG97+/kOPVMYZ2GvcB/tEOccZoO3I5NUidwCWxOrW4Zf
         WkDU1GEq0Nvi9gfRrKIQCoJP5W3k61zc4KKPAgYzT2r/ruUeQzy516AyqrxwyKHphV
         CNOVW1+N4zALOeLr3sZAJi4sz4JSmFVGP7pz8YWvB5oXIKtWlMmilJA1r/yG7GpDW+
         yvrVToK+GXFIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329164222.26794-1-dariobin@libero.it>
References: <20210329164222.26794-1-dariobin@libero.it>
Subject: Re: [PATCH v3 0/4] clk: ti: add am33xx spread spectrum clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Date:   Mon, 29 Mar 2021 19:24:41 -0700
Message-ID: <161707108197.3012082.13148389244272034996@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-03-29 09:42:17)
>=20
> As reported by the TI spruh73x RM, MPU and LCD modules support spread
> spectrum clocking (SSC) on their output clocks. SSC is used to spread
> the spectral peaking of the clock to reduce any electromagnetic
> interference (EMI) that may be caused due to the clock=E2=80=99s fundamen=
tal
> or any of its harmonics.
> The series allows you to enable and adjust the spread spectrum clocking
> for all am33xx PLLs for which it is supported.
>=20

What is your merge strategy? Should all the patches go through clk tree?
Or you'll send via arm-soc?
