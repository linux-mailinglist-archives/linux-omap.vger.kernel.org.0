Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF9290D91
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 08:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfHQG4T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 02:56:19 -0400
Received: from muru.com ([72.249.23.125]:58060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfHQG4T (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 17 Aug 2019 02:56:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 29B10812D;
        Sat, 17 Aug 2019 06:56:46 +0000 (UTC)
Date:   Fri, 16 Aug 2019 23:56:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] ARM: dts: Configure sgx for omap5
Message-ID: <20190817065615.GI52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <20190814131408.57162-5-tony@atomide.com>
 <20190815182348.8A1BA2063F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815182348.8A1BA2063F@mail.kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190815 18:24]:
> Quoting Tony Lindgren (2019-08-14 06:14:06)
> > diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > @@ -1146,6 +1146,20 @@
> >                 };
> >         };
> >  
> > +       gpu_cm: gpu_cm@1500 {
> 
> Node names shouldn't have underscores. Maybe clock-controller?

OK yeah clock-controller sounds good to me.

Thanks,

Tony
