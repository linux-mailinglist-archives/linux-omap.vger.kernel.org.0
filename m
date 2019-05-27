Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931B22B31D
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 13:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfE0LV0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 07:21:26 -0400
Received: from muru.com ([72.249.23.125]:51104 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbfE0LV0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 07:21:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E292C80F3;
        Mon, 27 May 2019 11:21:44 +0000 (UTC)
Date:   Mon, 27 May 2019 04:21:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190527112122.GJ5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190527 10:51]:
> Hi,
> 
> On 23/05/2019 23:07, Sebastian Reichel wrote:
> > Hi,
> > 
> > Here is another round of the DSI command mode panel patchset
> > integrating the feedback from PATCHv5. The patches are based
> > on v5.2-rc1 tag. It does not contain the patches required for
> > OMAP3 support (it needs a workaround for a hardware bug) and
> > for automatic display rotation. They should get their own series,
> > once after everything has been moved to DRM panel API. I think
> > DRM panel conversion should happen _after_ this series, since
> > otherwise there is a high risk of bricking DSI support completely.
> > I already started a WIP branch for converting DSI to the DRM panel
> > API on top of this patchset.
> 
> Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I haven't
> been able to test yet. I'll pick the series up in any case, and I'll test it
> when I get the kernel booting.

Great good to have these merged finally :)

Hmm I wonder if some x15 models are affected by the SoC variant
changes queued in my fixes branch?

Regards,

Tony
