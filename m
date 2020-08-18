Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1406C2481AB
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 11:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHRJQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 05:16:20 -0400
Received: from muru.com ([72.249.23.125]:40736 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgHRJQU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Aug 2020 05:16:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A286D810D;
        Tue, 18 Aug 2020 09:16:18 +0000 (UTC)
Date:   Tue, 18 Aug 2020 12:16:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Shah <dave@ds0.me>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [Letux-kernel] module_mipi_dsi_driver panel with omapdrm?
Message-ID: <20200818091645.GP2994@atomide.com>
References: <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
 <20200801232259.hitcfosiq6f2i57y@earth.universe>
 <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
 <20200805112831.akufm5wxkwqehiff@earth.universe>
 <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
 <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
 <7ef4e081c1a0db81fd98f9e94afc6228a9b68703.camel@ds0.me>
 <1ec9febeb685c7fa866b14b0a4c2a5026f0a3461.camel@ds0.me>
 <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
 <83C454BF-F443-4C8F-904E-D6745A01A296@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83C454BF-F443-4C8F-904E-D6745A01A296@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200816 11:25]:
> Hi David,
> 
> > Am 06.08.2020 um 20:44 schrieb David Shah <dave@ds0.me>:
> > 
> > Following a bit of testing, the DSI issues are fixed by 
> > https://github.com/daveshah1/pyra-kernel-devel/commit/3161275854a0f2cd44a55b8eb039bd201f894486
> > (I will prepare a proper patch set shortly). This makes the display
> > work with HDMI disabled.
> 
> yes, it makes the LCD work (tested so far on 5.8-rc7).
> But even with HDMI enabled.

David, can you please send the above commit as a proper fix to
linux-omap and dts mailing lists so I can apply it into fixes?

Regards,

Tony
