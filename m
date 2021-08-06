Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EF33E237D
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 08:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243434AbhHFGtq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 02:49:46 -0400
Received: from muru.com ([72.249.23.125]:36930 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243432AbhHFGti (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 02:49:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C2E488061;
        Fri,  6 Aug 2021 06:49:41 +0000 (UTC)
Date:   Fri, 6 Aug 2021 09:49:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] arm: omap2: Drop MACH_OMAP3517EVM entry
Message-ID: <YQzbcLAU0aAvYhjY@atomide.com>
References: <20210613125105.786984-1-pbrobinson@gmail.com>
 <YP/Epx04Za2wiSlt@atomide.com>
 <CALeDE9OC+OAuGaNM+iEO44bg+QAdjTE3NQkSdLLZUb-OXeo4Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALeDE9OC+OAuGaNM+iEO44bg+QAdjTE3NQkSdLLZUb-OXeo4Xg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Robinson <pbrobinson@gmail.com> [210805 15:05]:
> Hi Tony,
> 
> > * Peter Robinson <pbrobinson@gmail.com> [210613 15:51]:
> > > The MACH_OMAP3517EVM was added back in commit 549f95ed2016 due to
> > > being used by the ASoC driver, but this driver was dropped in
> > > commit 2c2596f3ab25 as the audio for this board had been moved to
> > > a simple-audio-card configuration so MACH_OMAP3517EVM is now
> > > properly unuused and can be dropped.
> >
> > Applying into omap-for-v5.15/soc thanks.
> 
> Was that all 3 of the series or just this one patch, I only see the
> one for your 5.15 PR.

Oops, sorry about that, and thanks for checking. I'm applying patches
currently with a combination of my old tagged email approach, and
switching over to applying using b4. Looks like I did not use b4
here and missed the rest of the series.

The missing patches are now applied into omap-for-v5.15/soc.

Regards,

Tony
