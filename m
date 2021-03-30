Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4698734DE42
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 04:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhC3CXV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 22:23:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230122AbhC3CXT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 22:23:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FB8F61989;
        Tue, 30 Mar 2021 02:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617070999;
        bh=Cohu/2cxN+tEHFYMMs+yo/4uX8ZIfwZVuwWi3CEctjg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IfCM2kN5SV3cPW8NVJ54qVpbJoOyswsjKsIhS7lPXUc/n5ey7mz7MoB5QnZMX1d3l
         eAU0p3Dq9SfLssaHRwZVqkXGLdZs7JfFjJZP3XNXhnABbg+RHIjEdmkg8QrUyPhhN9
         /KcBV1qFle2j1AhKLonOTkWjyPE6T2yZPpGHLSYWo9EBkxoQgwL7oOdAUzFts5G9Oi
         dSSJ3KWYIblRtXZT/phK+Th9tN1NisJQGHQB6dbdvE61M8DDrobM+2Oi9p7o9c1Maz
         un9w602H3kZZPHH2iRWL5Ygy59QJOEfZhWTNPjhfxxEhbWNJuBEdB+cJdskId9YbIJ
         LH9ubvQ2ab6yA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210318172627.12173-2-dariobin@libero.it>
References: <20210318172627.12173-1-dariobin@libero.it> <20210318172627.12173-2-dariobin@libero.it>
Subject: Re: [PATCH v2 1/4] clk: ti: fix typo in routine description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Date:   Mon, 29 Mar 2021 19:23:17 -0700
Message-ID: <161707099768.3012082.16934007943600501374@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-03-18 10:26:23)
> Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
