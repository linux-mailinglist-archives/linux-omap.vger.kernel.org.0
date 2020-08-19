Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AF12494BC
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 07:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHSF6R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 01:58:17 -0400
Received: from muru.com ([72.249.23.125]:40854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgHSF6Q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Aug 2020 01:58:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2E6CD810D;
        Wed, 19 Aug 2020 05:58:15 +0000 (UTC)
Date:   Wed, 19 Aug 2020 08:58:44 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [Letux-kernel] [PATCH] omap5: Fix DSI base address and clocks
Message-ID: <20200819055844.GT2994@atomide.com>
References: <20200818095100.25412-1-dave@ds0.me>
 <9081697A-02F9-42EA-9F22-F62381FA1C79@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9081697A-02F9-42EA-9F22-F62381FA1C79@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200818 09:58]:
> 
> > Am 18.08.2020 um 11:51 schrieb David Shah <dave@ds0.me>:
> > 
> > DSI was not probing due to base address off by 0x1000, and sys_clk
> > missing.
> > 
> > With this patch, the Pyra display works if HDMI is disabled in the
> > device tree.
> 
> For me it also works if HDMI is not disabled.
> So IMHO this comment is misleading.
> 
> Otherwise,
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

Thanks pushed out into fixes. Looks like I missed removing the
HDMI disabled comment part but seems like that's not critical
and don't want to redo the branch after pushing out.

Regards,

Tony
