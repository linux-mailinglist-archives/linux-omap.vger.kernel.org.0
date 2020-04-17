Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40A21AE0D0
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgDQPOu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:14:50 -0400
Received: from muru.com ([72.249.23.125]:49904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728272AbgDQPOu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:14:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E075B8047;
        Fri, 17 Apr 2020 15:15:37 +0000 (UTC)
Date:   Fri, 17 Apr 2020 08:14:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200417151447.GM37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
 <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
 <20200416184638.GI37466@atomide.com>
 <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
 <20200417164340.3d9043d1@aktux>
 <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
 <20200417150721.GL37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417150721.GL37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200417 15:08]:
> Maybe the PM runtime usecounts get unbalanced somewhere in the
> driver where we end up with driver permanently in disabled state?

Or it could be that with omap_hdq.c no longer blocking SoC
deeper idle states, omap_hdq.c now loses context if you have
omap3 off mode enabled during idle?

If so, this can easily be fixed by adding a cpu_pm notifier
along the lines of what we already have for few drivers:

$ git grep -e CLUSTER_PM_ENTER -e CLUSTER_PM_EXIT

Regards,

Tony
