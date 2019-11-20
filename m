Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2807710324F
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2019 04:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKTDsY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 22:48:24 -0500
Received: from muru.com ([72.249.23.125]:43010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbfKTDsY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Nov 2019 22:48:24 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 46949809B;
        Wed, 20 Nov 2019 03:49:00 +0000 (UTC)
Date:   Tue, 19 Nov 2019 19:48:20 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191120034820.GR35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
 <20191119150643.GI35479@atomide.com>
 <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191119 15:56]:
> Afaik, Weston and X both handle page flips and/or dirtying the fb, so they
> should work. Are there applications that do not work, and cannot be made to
> work, except the few SGX test apps?

I'm not sure sure yet what all it affects, I'll do some more tests on it.

Regards,

Tony
