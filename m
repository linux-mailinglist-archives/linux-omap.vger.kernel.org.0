Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7F13A08AC
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 02:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhFIAyJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 20:54:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232182AbhFIAyD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Jun 2021 20:54:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 007556124B;
        Wed,  9 Jun 2021 00:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199930;
        bh=0oHqI9JX3sI5i/BbkrJhyWIKqnlIM2T15gNJ3RvWUTM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LwGLKPvB1tqmcAH+JgQO8OlPpsat90M9y4o4nToKxy8pZwdlzUnMzqvXQD7VRoNku
         0Q29K1Qai7kJDmeUDprT6uM3DSIkWghSzBWRBwCRbZNnTn6sggIj8uxdJn1hTdaM3J
         lCBD8itm7KF4YsRsiQhyut6YA1Aw3ZQSs9vH3yCZ2imeXx841BvvCKITXath/PHzhO
         +PwcLrPPAa7ktvfrBORbPZt8HUTgosUJCfDRIhXXJKVdsHsSoLpt+af7vY/w+2CfZ5
         5UU/ZB9LiF1maze4SpuZEo8w+UtHAlm3ZJKsM9eFmwGpY1Zj+erDbBuwTkWbUsl3sK
         hTAe1vo5kEMXg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606202253.31649-2-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it> <20210606202253.31649-2-dariobin@libero.it>
Subject: Re: [RESEND PATCH v7 1/5] clk: ti: fix typo in routine description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:52:08 -0700
Message-ID: <162319992871.1835121.11509097623459788351@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-06-06 13:22:49)
> Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>=20
> ---

Applied to clk-next
