Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EFD28E857
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 23:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbgJNVXK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 17:23:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:50576 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgJNVXK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 17:23:10 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 12B99803073C;
        Wed, 14 Oct 2020 21:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id inYRWRerfTBc; Thu, 15 Oct 2020 00:23:05 +0300 (MSK)
Date:   Thu, 15 Oct 2020 00:22:59 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201014212259.ltckcgz2yrola7za@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 01:35:16PM -0500, Rob Herring wrote:
> On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> > >
> > > Hi Serge,
> > >
> > > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > >
> >
> > > DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> > which then registers the HCD device so the corresponding DT node is supposed
> > to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> > and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> > compatibility.
> >
> > >
> > > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > > >
> > > > Note we don't change the DWC USB3-compatible nodes names of
> > > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > > in-source comment says that the nodes name need to be preserved as
> > > > "^dwusb@.*" for some backward compatibility.
> > >
> >
> > > interesting, compatibility with what? Some debugfs files, perhaps? :-)
> >
> > Don't really know.) In my experience the worst type of such compatibility is
> > connected with some bootloader magic, which may add/remove/modify properties
> > to nodes with pre-defined names.
> 

> I seriously doubt anyone is using the APM machines with DT (even ACPI
> is somewhat doubtful). I say change them. Or remove the dts files and
> see what happens. Either way it can always be reverted.

Ok. I'll change them in v3.

-Sergey

> 
> Rob
