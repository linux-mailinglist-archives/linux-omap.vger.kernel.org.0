Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C831AE080
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgDQPH0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:07:26 -0400
Received: from muru.com ([72.249.23.125]:49880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728114AbgDQPH0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:07:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6BBBB8047;
        Fri, 17 Apr 2020 15:08:12 +0000 (UTC)
Date:   Fri, 17 Apr 2020 08:07:21 -0700
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
Message-ID: <20200417150721.GL37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
 <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
 <20200416184638.GI37466@atomide.com>
 <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
 <20200417164340.3d9043d1@aktux>
 <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200417 14:53]:
> 
> > Am 17.04.2020 um 16:43 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > 
> > On Fri, 17 Apr 2020 16:22:47 +0200
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > 
> >>> Am 16.04.2020 um 20:46 schrieb Tony Lindgren <tony@atomide.com>:
> >>> Care to check if changing pm_runtime_set_autosuspend_delay value
> >>> to -1 in probe makes the issue go away? Or change it manually
> >>> to -1 via sysfs.
> >>> 
> >>> If that helps, likely we have a missing pm_runtime_get_sync()
> >>> somewhere in the driver.  
> >> 
> >> Yes, it does! It suffices to set it to -1 for one readout.
> >> Aything else I can test?

You could sprinkle dev_info(dev, "%s\n", __func__) to the
omap_hdq_runtime_suspend() and omap_hdq_runtime_resume()
functions.

> > How does it depend on loaded drivers?
> > Is it really mainline kernel + config + devicetree or something else?
> 
> Well, I can revert the patch on the same
> kernel (5.6 or 5.7-rc1) + config + devicetree + user-space
> and the problem is gone.
> 
> This means that something is different between the old and the new
> version which makes the hdq access delayed and failing. Of course I
> don't know the reason for it and what does influence it.
> 
> > 
> > Can you reproduce the problem with init=/bin/bash
> > and then mount sysfs and modprobe omap_hdq?
> 
> I am not sure how quickly I can test such a setup.
> 
> > Regarding pm_runtime stuff I thought I have the worst case scenario.
> 
> What may make a difference is the sequence in which drivers are loaded.

Well to me it seems that we have PM runtime handling properly
implemented for all the functions in w1_bus_master omap_w1_master,
so we should not have any consumers calling into the driver
bypassing PM runtime.

Maybe the PM runtime usecounts get unbalanced somewhere in the
driver where we end up with driver permanently in disabled state?

Regards,

Tony
