Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8DC3193B2
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 21:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhBKT56 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 14:57:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:39002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231522AbhBKT5J (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 14:57:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7667464E4A;
        Thu, 11 Feb 2021 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073388;
        bh=R8gEeiLr426CYLzURDCRqcEMK1+bA3S0WSrG4RFHZGw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YSNhHKwGkJIwcDNpq+tSP5F7ksXzF23ZTleou0tM2wFHpK3hMl2aiMkcNy1UrMhHg
         I93AgzyiJ4yNekdLpVV3dqDQUA714+sy3mILEd8g7AuV+Irc+DhSOgRyZJndeo1K4M
         RN4cNLilOeMMRyfxkZxrKaB1bNfe7d9J/RAd0Z3KWYCsmrASev8QEy0bTG3zYPqL6R
         4OL2OsTWw7kvIXy1EJfmWl4dt4a61plt2qT18mPvuvx3oEuS/iiBFCsgAb3TGpEkne
         5Gm7My5BkaHtS9g7r/TVzAgK4d9GnDIGLnF6sus4Pr6k3jOs9EygBFnfFCIS6Y/pwm
         pCX6Woww9r1PQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-11-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-11-lee.jones@linaro.org>
Subject: Re: [PATCH 10/21] clk: ti: dpll44xx: Fix some potential doc-rot
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:56:27 -0800
Message-ID: <161307338738.1254594.9117567475671987906@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:29)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/ti/dpll44xx.c:114: warning: Function parameter or member 'hw=
' not described in 'omap4_dpll_regm4xen_recalc'
>  drivers/clk/ti/dpll44xx.c:114: warning: Function parameter or member 'pa=
rent_rate' not described in 'omap4_dpll_regm4xen_recalc'
>  drivers/clk/ti/dpll44xx.c:114: warning: Excess function parameter 'clk' =
description in 'omap4_dpll_regm4xen_recalc'
>  drivers/clk/ti/dpll44xx.c:150: warning: Function parameter or member 'hw=
' not described in 'omap4_dpll_regm4xen_round_rate'
>  drivers/clk/ti/dpll44xx.c:150: warning: Function parameter or member 'pa=
rent_rate' not described in 'omap4_dpll_regm4xen_round_rate'
>  drivers/clk/ti/dpll44xx.c:150: warning: Excess function parameter 'clk' =
description in 'omap4_dpll_regm4xen_round_rate'
>=20
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
