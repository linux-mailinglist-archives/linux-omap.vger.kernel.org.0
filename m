Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089501D054D
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 05:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgEMDQO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 23:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDQO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 23:16:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B63E220714;
        Wed, 13 May 2020 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589339773;
        bh=TaG0vS5dNMz8Etjtf9+VwXVgTfZ7tYsvcXDt9cqX02A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B8Zi4y+zlBwjI2XcJPX3M3q8QDZFthkStUO/nWrTbSxMrmxR254UG2DZIbiAoL2JV
         q2XeF3oOP+mKhbKGkVWdg8cuvcpT3frk1PEyopw2nmSGdO2Ggds+1CoU5L3N8RMRYR
         jflVuBL7+RrujUbM1LJcakTKD6i3hMm094kQaTdY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424124725.9895-1-t-kristo@ti.com>
References: <20200424124725.9895-1-t-kristo@ti.com>
Subject: Re: [PATCH 1/1] clk: ti: clkctrl: Fix Bad of_node_put within clkctrl_get_name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 12 May 2020 20:16:12 -0700
Message-ID: <158933977295.215346.11971491814949812164@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-24 05:47:25)
> clkctrl_get_name incorrectly calls of_node_put when it is not really
> doing of_node_get. This causes a boot time warning later on:
>=20
> [    0.000000] OF: ERROR: Bad of_node_put() on /ocp/interconnect@4a000000=
/segmen
> t@0/target-module@5000/cm_core_aon@0/ipu-cm@500/ipu1-clkctrl@20
>=20
> Fix by dropping the of_node_put from the function.
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-fixes
