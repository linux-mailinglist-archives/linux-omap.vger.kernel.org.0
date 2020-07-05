Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F12214D19
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 16:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgGEO06 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 10:26:58 -0400
Received: from muru.com ([72.249.23.125]:60792 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgGEO06 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Jul 2020 10:26:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BE17E80F3;
        Sun,  5 Jul 2020 14:27:49 +0000 (UTC)
Date:   Sun, 5 Jul 2020 07:26:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Message-ID: <20200705142653.GQ37466@atomide.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com>
 <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
 <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200705 13:48]:
> > This patch makes the DSI error go away and omapdrm initialized:
> > 
> > diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> > index e147121513e644..b9f54f62163879 100644
> > --- a/arch/arm/boot/dts/omap5.dtsi
> > +++ b/arch/arm/boot/dts/omap5.dtsi
> > @@ -474,7 +474,7 @@ rfbi: encoder@0  {
> >                                        };
> >                                };
> > 
> > -                               target-module@5000 {
> > +                               target-module@4000 {
> >                                        compatible = "ti,sysc-omap2", "ti,sysc";
> >                                        reg = <0x5000 0x4>,
> >                                              <0x5010 0x4>,
> > @@ -490,7 +490,7 @@ SYSC_OMAP2_SOFTRESET |
> >                                        ti,syss-mask = <1>;
> >                                        #address-cells = <1>;
> >                                        #size-cells = <1>;
> > -                                       ranges = <0 0x5000 0x1000>;
> > +                                       ranges = <0 0x4000 0x1000>;
> > 
> >                                        dsi1: encoder@0 {
> >                                                compatible = "ti,omap5-dsi";

Oops sorry about that one. The l3 entries I've had to manually add
while l4 has been generated form the hardware for most part.

This one was caused by commit 5a507162f096 ("ARM: dts: Configure
interconnect target module for omap5 dsi1").

> > But I still have no display:
> > 
> > [   17.537515] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 2
> > [   18.558950] omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
> > 
> > So there is more to fix.
> 
> A little more info:
> 
> on v5.7 I see:
> 
> [   13.850883] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdss])
> [   13.885714] omapdss_dss 58000000.dss: bound 58040000.encoder (ops hdmi5_component_ops [omapdss])
> 
> while on v5.6:
> 
> [   14.997890] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dsi_vc_flush_receive_data [omapdss])
> [   15.007726] omapdss_dss 58000000.dss: bound 58004000.encoder (ops dsi_vc_flush_receive_data [omapdss])
> [   15.026118] omapdss_dss 58000000.dss: bound 58040000.encoder (ops dsi_vc_flush_receive_data [omapdss])
> 
> So the dsi1 encoder isn't properly bound.

Yeah sounds like something is still wrong.

Do you have loaded display-connector? That is needed starting
with v5.7-rc1.

Regards,

Tony
