Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8563C1F5A
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jul 2021 08:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhGIGdw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jul 2021 02:33:52 -0400
Received: from muru.com ([72.249.23.125]:39238 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhGIGdw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Jul 2021 02:33:52 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5E2BC80AF;
        Fri,  9 Jul 2021 06:31:22 +0000 (UTC)
Date:   Fri, 9 Jul 2021 09:31:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        lgirdwood@gmail.com, linux-omap@vger.kernel.org, hns@goldelico.com
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <YOftKVAsRaxtEY8n@atomide.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Péter Ujfalusi <peter.ujfalusi@gmail.com> [210708 18:44]:
> Hi Mark, Tony,
> 
> On 07/07/2021 20:32, Mark Brown wrote:
> > On Mon, Jul 05, 2021 at 10:42:44PM +0300, Peter Ujfalusi wrote:
> > 
> >> Mark, Tony:
> >> The ASoC and dts patches can go via separate tree I felt that it is better if
> >> they are together, at least initially.
> > 
> > I'm happy to take both through ASoC?  The patches look fine to me.
> 
> Tony prefers if I leave the TRM documented (but not working) Smart-idle
> mode intact in DT for the McASP and add some quirk via
> drivers/bus/ti-sysc.c.
> Tony, can you confirm it?

Yes let's keep the smart-idle in dts if it's documented in the TRM. And
let's just add a line to drivers/bus/ti-sysc.c for a McASP quirk.

> The ASoC patches are not affected by this, it is just that we need to
> block SIDLE mode in a different way than how I did it in the last patch.
> 
> I'll take a look on how to implement the needed quirk for the McASP
> module, then I can send the dts+ti-sysc patch to linux-omap.

OK sounds good to me.

Regards,

Tony
