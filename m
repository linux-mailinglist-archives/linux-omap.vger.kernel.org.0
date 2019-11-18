Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E026100EF8
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 23:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfKRWwO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Mon, 18 Nov 2019 17:52:14 -0500
Received: from muru.com ([72.249.23.125]:42802 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfKRWwO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 17:52:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CF67D80BF;
        Mon, 18 Nov 2019 22:52:49 +0000 (UTC)
Date:   Mon, 18 Nov 2019 14:52:09 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191118225209.GF35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
 <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
 <20191118150301.vvnsmztfxo76ghwe@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20191118150301.vvnsmztfxo76ghwe@earth.universe>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sebastian.reichel@collabora.com> [191118 15:03]:
> On Mon, Nov 18, 2019 at 03:37:12PM +0100, H. Nikolaus Schaller wrote:
> > > Am 18.11.2019 um 15:33 schrieb Sebastian Reichel <sebastian.reichel@collabora.com>:
> > > On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
> > >> On 17/11/2019 04:39, Sebastian Reichel wrote:
> > >>> The standard binding for DSI requires, that the channel number
> > >>> of the panel is encoded in DT. This adds the channel number in
> > >>> all OMAP3-5 boards, in preparation for using common infrastructure.
> > >>> 
> > >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > >>> ---
> > >>>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
> > >>>  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
> > >>>  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
> > >>>  arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
> > >>>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
> > >>>  arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
> > >>>  arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
> > >>>  7 files changed, 26 insertions(+), 5 deletions(-)
> > >> 
> > >> Is this required only in the .txt, or also by the driver? This does break
> > >> backward compatibility with the dtbs, and there's always someone who won't
> > >> like it.
> > > 
> > > I add a compatible string for the Droid 4 panel in addition to the
> > > generic one, which is not really required and just a precaution in
> > > case we need some quirks in the future.
> > > 
> > > But I had to add the DSI channel to DT, which is required to follow
> > > the standard DSI bindings. We cannot use the generic infrastructure
> > > without this change. Technically it should have been there all the
> > > time, it is only working because it is currently hardcoded to 0 in
> > > the panel driver.
> > 
> > Is it possible to change it to default to channel <0> if reg is not
> > specified?
> 
> Currently nodes without reg property are skipped by of_mipi_dsi_device_add()
> and of_mipi_dsi_device_add() fails if reg node is missing. Technically
> it should be possible to default to channel 0 there. That affects all
> platforms, though. Considering the small amount of boards affected, I think
> its better to just fix the DT. Also the fixed DT does not make problems
> with older kernels and can be backported.

You might be able to do a local fixup at driver probe time using
of_add_property(). See for example pcs_quirk_missing_pinctrl_cells()
I added earlier because of similar issues.

Regards,

Tony
