Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9ED4720B6
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 06:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhLMFrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 00:47:48 -0500
Received: from muru.com ([72.249.23.125]:37844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhLMFrs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 00:47:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A01F0809F;
        Mon, 13 Dec 2021 05:48:29 +0000 (UTC)
Date:   Mon, 13 Dec 2021 07:47:45 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <Ybbegfbnl8+5Xqc5@atomide.com>
References: <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz>
 <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
 <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Merlijn Wajer <merlijn@wizzup.org> [211211 11:07]:
> On 11/12/2021 07:57, Tony Lindgren wrote:
> > Just to see if this relates to the omap_hsmmc.c driver, maybe try this with
> > v5.16-rc1 also with a patch that changes omap3.dtsi ti,omap3-hsmmc compatibles
> > with ti,omap3-sdhci compatibles.
> 
> I tried this just now on v5.16-rc4 with the following change [1] (and a
> few reverts for off mode) and I don't think it helped get rid of the
> error, I see the following. [2] Maybe it does help narrow the specific
> error down if it happens with both hsmmc and sdhci?

OK so it's not omap_hsmmc vs sdhci-omap issue. So does setting the thermal
driver to status = "disabled" make the issue disappear?

Regards,

Tony
