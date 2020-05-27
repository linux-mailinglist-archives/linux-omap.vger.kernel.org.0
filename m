Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628171E367B
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 05:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgE0DY2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 23:24:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DY1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 23:24:27 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D755207D8;
        Wed, 27 May 2020 03:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590549867;
        bh=xYPHnnrRhsLn9sZ3SSA7OE+hqxopPK2JBfv9aPHeWkI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PGF1YVS4wQfBEfV15V+/C9Y1daqRDUjiJkgo7AzcH/bo178mTn/gp7X2IEBPI1lNT
         zXQpBgz4ZCMmE3wFntUau9MAc3jItylF6xud96ly5L4BRBSn5ELrdGuYjpc0kXFZcV
         d1rTPyNnXOlu3DtsEwEeDQ8KArx2n9zlO+pl+ne4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200417073523.42520-1-yanaijie@huawei.com>
References: <20200417073523.42520-1-yanaijie@huawei.com>
Subject: Re: [PATCH] clk: ti: dra7: remove two unused symbols
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
To:     Jason Yan <yanaijie@huawei.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        mturquette@baylibre.com, t-kristo@ti.com, tony@atomide.com
Date:   Tue, 26 May 2020 20:24:26 -0700
Message-ID: <159054986673.88029.8385566623273988523@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Jason Yan (2020-04-17 00:35:23)
> Fix the following gcc warning:
>=20
> drivers/clk/ti/clk-7xx.c:320:43: warning: \u2018dra7_gpu_sys_clk_data\u20=
19
> defined but not used [-Wunused-const-variable=3D]
>  static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data
> __initconst =3D {
>                                            ^~~~~~~~~~~~~~~~~~~~~
> drivers/clk/ti/clk-7xx.c:315:27: warning: \u2018dra7_gpu_sys_clk_parents\=
u2019
> defined but not used [-Wunused-const-variable=3D]
>  static const char * const dra7_gpu_sys_clk_parents[] __initconst =3D {
>                            ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---

Applied to clk-next
