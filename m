Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C48199E57
	for <lists+linux-omap@lfdr.de>; Tue, 31 Mar 2020 20:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgCaSqx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Mar 2020 14:46:53 -0400
Received: from muru.com ([72.249.23.125]:33522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgCaSqx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 31 Mar 2020 14:46:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8E5C28108;
        Tue, 31 Mar 2020 18:47:37 +0000 (UTC)
Date:   Tue, 31 Mar 2020 11:46:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Caleb Robey <c-robey@ti.com>, linux-omap@vger.kernel.org,
        Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Drew Fustini <drew@beagleboard.org>
Subject: Re: [PATCH v2] ARM: dts: am5729: beaglebone-ai: adding device tree
Message-ID: <20200331184647.GF37466@atomide.com>
References: <20191120220559.18914-1-c-robey@ti.com>
 <41c73bc1-99ae-6797-5bb7-7acc0f6518c0@ti.com>
 <20191212170452.GV35479@atomide.com>
 <CAEf4M_C05Hwc_BEL6MaFNNEW0Cf2kc-LvMi9qdKxL7hVAFFDGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4M_C05Hwc_BEL6MaFNNEW0Cf2kc-LvMi9qdKxL7hVAFFDGQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <pdp7pdp7@gmail.com> [200331 18:39]:
> On Thu, Dec 12, 2019 at 6:06 PM Tony Lindgren <tony@atomide.com> wrote:
> > > On 21/11/2019 00:05, Caleb Robey wrote:
> > > > From: Jason Kridner <jdk@ti.com>
> > > >
> > > > BeagleBoard.org BeagleBone AI is an open source hardware single
> > > > board computer based on the Texas Instruments AM5729 SoC featuring
> > > > dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
> > > > signal processor (DSP), quad-core embedded vision engine (EVE),
> > > > Arm Cortex-M4 processors, dual programmable realtime unit
> > > > industrial control subsystems and more. The board features 1GB
> > > > DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
> > > > 1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
> > > > headers.
> > > >
> > > > For more information, refer to:
> > > > https://beaglebone.ai
> > > >
> > > > This patch introduces the BeagleBone AI device tree.
> > > >
> > > > Note that the device use the "ti,tpd12s016" component which is
> > > > software compatible with "ti,tpd12s015". Thus we only use the
> > > > latter driver.
> > >
> > > Ah. thanks. I see my comments resolved here.
> > > no more comments to net part from my side.
> >
> > Just FYI, Jason had one pending comment on the earlier version
> > about the compatible property to use.
> >
> > So I'm assuming there will be a new version posted, tagging
> > this one as read.
> 
> It came to my attention today when talking with Jason Kridner and
> Robert Nelson that we did not get the BeagleBone AI device tree
> upstream yet.
> 
> I am having trouble identifying what the pending comment was from the
> original patch series.
> 
> Was it related to this compatible string?
> 
> > +       compatible = "beagleboard.org,am5729-beagleboneai", "ti,am5728",

Yes I think Jason had some comment on the compatible string
to use.

Regards,

Tony
