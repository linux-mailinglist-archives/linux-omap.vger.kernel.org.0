Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811B413B3E6
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 22:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgANVAo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 16:00:44 -0500
Received: from muru.com ([72.249.23.125]:51004 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgANVAn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jan 2020 16:00:43 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7D4FE816C;
        Tue, 14 Jan 2020 21:01:24 +0000 (UTC)
Date:   Tue, 14 Jan 2020 13:00:39 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
Message-ID: <20200114210039.GT5885@atomide.com>
References: <20200114150937.18304-1-tony@atomide.com>
 <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com>
 <20200114164613.GR5885@atomide.com>
 <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com>
 <20200114171634.GS5885@atomide.com>
 <632E66D6-47EF-44CF-BF02-B0F5A215D904@goldelico.com>
 <ACB71118-B121-4CF7-934D-A88654366E8F@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ACB71118-B121-4CF7-934D-A88654366E8F@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200114 18:40]:
> I have checked our tree and it is already built into a separate module with
> 
> sound/soc/ti/aess/omap-aess-core.c:	{ .compatible = "ti,omap4-aess", },
> 
> So
> 
> > target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
> > 	...
> > 	aess: aess {
> > 		compatible = "ti,omap4-aess";
> > 		status = "disabled";
> > 	};
> > };
> 
> would be what we will need.

OK good to hear.

Regards,

Tony
