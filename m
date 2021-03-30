Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B7F34DE49
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 04:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhC3CY0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 22:24:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:53040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhC3CYF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 22:24:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC0C761936;
        Tue, 30 Mar 2021 02:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617071045;
        bh=2QsKrkE+KUEBzyt9IvADAnwYyEmUVCHQ50KOfSPpxSQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IidkfNLSVfxTeSqAsua0YXvutcyQxgrh0f9v5XqcWd0mNszs5/ar3YviSVLEicSZn
         RXypdaZGb/ghspY/ZRxeOx8fdj8HOMevdHx/CuLu3KqFfSqPit1iZaL0A+DZU32tk3
         /i9OVM2AFknDssiHiyit2lEVeKt3UgLERXw1w/zsxCGBmz4CQ2WJ8pSaLmw43Z1qn1
         n7E5MsWBxfLr7wVuSfW7q2I/LrEKjijqfD4rFuhROEEIBXTI1vb0nCpB1+gpS0nwX/
         uu4uANAj0HUOCQfltGSKBfE0XLqei8v7f7/Qy3TAQiy+jeNQY36WyDHXVvuaSCchVK
         I7DDkWzBOwniw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329164222.26794-2-dariobin@libero.it>
References: <20210329164222.26794-1-dariobin@libero.it> <20210329164222.26794-2-dariobin@libero.it>
Subject: Re: [PATCH v3 1/4] clk: ti: fix typo in routine description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Date:   Mon, 29 Mar 2021 19:24:03 -0700
Message-ID: <161707104376.3012082.4345960040904177142@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-03-29 09:42:18)
> Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
