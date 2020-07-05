Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610D3214D29
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 16:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgGEOgR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 10:36:17 -0400
Received: from muru.com ([72.249.23.125]:60812 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbgGEOgR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Jul 2020 10:36:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 216B680F3;
        Sun,  5 Jul 2020 14:37:10 +0000 (UTC)
Date:   Sun, 5 Jul 2020 07:36:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Message-ID: <20200705143614.GR37466@atomide.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com>
 <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
 <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
 <20200705142653.GQ37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705142653.GQ37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200705 14:27]:
> * H. Nikolaus Schaller <hns@goldelico.com> [200705 13:48]:
> > > This patch makes the DSI error go away and omapdrm initialized:
> > > 
> > > diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> > > index e147121513e644..b9f54f62163879 100644
> > > --- a/arch/arm/boot/dts/omap5.dtsi
> > > +++ b/arch/arm/boot/dts/omap5.dtsi
> > > @@ -474,7 +474,7 @@ rfbi: encoder@0  {
> > >                                        };
> > >                                };
> > > 
> > > -                               target-module@5000 {
> > > +                               target-module@4000 {
> > >                                        compatible = "ti,sysc-omap2", "ti,sysc";
> > >                                        reg = <0x5000 0x4>,
> > >                                              <0x5010 0x4>,

Looks like you need to also change the reg offsets above
from 0x5000 something to 0x4000 something.

> Do you have loaded display-connector? That is needed starting
> with v5.7-rc1.

Where the display-connector is a new kernel module to load.

Regards,

Tony
