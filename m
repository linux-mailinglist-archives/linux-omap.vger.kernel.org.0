Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355691AD127
	for <lists+linux-omap@lfdr.de>; Thu, 16 Apr 2020 22:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731289AbgDPUdN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Apr 2020 16:33:13 -0400
Received: from muru.com ([72.249.23.125]:49852 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728696AbgDPUdN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Apr 2020 16:33:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2F067804F;
        Thu, 16 Apr 2020 20:34:00 +0000 (UTC)
Date:   Thu, 16 Apr 2020 13:33:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200416203309.GK37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
 <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
 <20200416184638.GI37466@atomide.com>
 <20200416220449.17068b21@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416220449.17068b21@aktux>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200416 20:05]:
> On Thu, 16 Apr 2020 11:46:38 -0700
> Tony Lindgren <tony@atomide.com> wrote:
> > If that helps, likely we have a missing pm_runtime_get_sync()
> > somewhere in the driver.
> > 
> I have not tested yet with v5.7-rc1 (it is compiling right now),
> but I have not seen any problems with init=/bin/bash on v5.6
> and only a minimal set of modules loaded on gta04. I have seen that
> 42 for IDLEST

Yeah I think you did test this change on gta04 earlier based
on the Tested-by from you :)

> So might be something a bit more weird.

OK please let us know what you find out.

Regards,

Tony
