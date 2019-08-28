Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4F9A0972
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfH1SaM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:30:12 -0400
Received: from muru.com ([72.249.23.125]:58970 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbfH1SaM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:30:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3292F80C5;
        Wed, 28 Aug 2019 18:30:40 +0000 (UTC)
Date:   Wed, 28 Aug 2019 11:30:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Kishore Kadiyala <kishore.kadiyala@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Balaji T K <balajitk@ti.com>,
        Benoit Cousson <b-cousson@ti.com>,
        Paul Walmsley <paul@pwsan.com>,
        Nikolaus Schaller <hns@goldelico.com>
Subject: Re: [PATCH] ARM: OMAP2+: Delete an unnecessary kfree() call in
 omap_hsmmc_pdata_init()
Message-ID: <20190828183007.GD52127@atomide.com>
References: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
 <20190826162050.GX52127@atomide.com>
 <20190827181457.GA16333@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827181457.GA16333@lenoch>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ladislav Michl <ladis@linux-mips.org> [190827 18:15]:
> On Mon, Aug 26, 2019 at 09:20:50AM -0700, Tony Lindgren wrote:
> > * Markus Elfring <Markus.Elfring@web.de> [190826 06:31]:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Mon, 26 Aug 2019 15:05:31 +0200
> > > 
> > > A null pointer would be passed to a call of the function "kfree" directly
> > > after a call of the function "kzalloc" failed at one place.
> > > Remove this superfluous function call.
> > > 
> > > This issue was detected by using the Coccinelle software.
> > 
> > Applying into omap-for-v5.4/soc thanks.
> 
> Is it really wise touching almost dead code? Last user is pandora board, so
> +Cc: Nikolaus Schaller <hns@goldelico.com>

Yeah would be good to finally get rid of that old code.
Anyways, I'll keep the $subject patch to cut down on
coccinelle produced issue.

Regards,

Tony
