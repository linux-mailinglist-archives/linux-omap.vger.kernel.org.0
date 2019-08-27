Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8F19F228
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 20:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbfH0SPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 14:15:03 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:39296 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbfH0SPD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 14:15:03 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992798AbfH0SPAV-MII (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org> + 2 others);
        Tue, 27 Aug 2019 20:15:00 +0200
Date:   Tue, 27 Aug 2019 20:14:57 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Tony Lindgren <tony@atomide.com>
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
Message-ID: <20190827181457.GA16333@lenoch>
References: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
 <20190826162050.GX52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826162050.GX52127@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Aug 26, 2019 at 09:20:50AM -0700, Tony Lindgren wrote:
> * Markus Elfring <Markus.Elfring@web.de> [190826 06:31]:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 26 Aug 2019 15:05:31 +0200
> > 
> > A null pointer would be passed to a call of the function "kfree" directly
> > after a call of the function "kzalloc" failed at one place.
> > Remove this superfluous function call.
> > 
> > This issue was detected by using the Coccinelle software.
> 
> Applying into omap-for-v5.4/soc thanks.

Is it really wise touching almost dead code? Last user is pandora board, so
+Cc: Nikolaus Schaller <hns@goldelico.com>
