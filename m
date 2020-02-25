Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99CF16EA4D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 16:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgBYPml convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 25 Feb 2020 10:42:41 -0500
Received: from muru.com ([72.249.23.125]:57456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgBYPml (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 10:42:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 88D5F810E;
        Tue, 25 Feb 2020 15:43:25 +0000 (UTC)
Date:   Tue, 25 Feb 2020 07:42:37 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225154237.GH37466@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200225022822.wh7omykthv7skojy@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [200225 02:29]:
> On Mon, Feb 24, 2020 at 04:10:11PM -0800, Tony Lindgren wrote:
> > BTW, I think there's also some refcount issue in general where
> > the omapdrm related modules cannot be unloaded any longer?
> 
> I wouldn't be too surprised. The dependencies are quite interesting
> at the moment with omapdss registering omapdrm and then omapdrm
> registers the drm_device, which references the encoders from
> omapdss. I think this is something to look at once Laurent's and
> my branch have been merged to avoid increasing the complexity.
> Technically it should be possible to link everything into one
> module.

Well the DSS is really DOSSI for Display Output SubSystem
Interconnect :) The devices on the interconnect are mostly
independent and ideally the toplevel dss driver would just
provide Linux generic resources to dispc and various output
drivers. So probably not a good idea to try to build it all
into a single module.

Regards,

Tony
