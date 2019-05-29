Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F7E2D764
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2019 10:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfE2IKn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 May 2019 04:10:43 -0400
Received: from muru.com ([72.249.23.125]:51648 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfE2IKm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 May 2019 04:10:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 851638027;
        Wed, 29 May 2019 08:11:01 +0000 (UTC)
Date:   Wed, 29 May 2019 01:10:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190529081038.GP5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190529 07:06]:
> On 28/05/2019 13:18, Tony Lindgren wrote:
> 
> > > My board is x15 rev A3, attached to AM5 EVM. I've also attached my kernel
> > > config.
> > 
> > Strange that this is not affecting other x15? I think timer12 would
> > be blocked on HS devices though?
> 
> Seems that the kernel config affects. omap2plus_defconfig boots ok.

OK, this line in your oops:

Unable to handle kernel paging request at virtual address 5a5a5a5a

Probably means we hit some slab poison with DEBUG_SLAB set.
Looks like your config boots fine with DEBUG_SLAB disabled
for me.

As this only happens for timer12, I wonder if we're again
hitting some uncompress issue with corrupted dtb. Changing
u-boot ftdaddr higher up might possibly make it go away.
Or else there's a bug elsewhere :)

Regards,

Tony


