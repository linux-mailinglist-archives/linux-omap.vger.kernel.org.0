Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8995711FC2
	for <lists+linux-omap@lfdr.de>; Fri, 26 May 2023 08:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjEZGVN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 May 2023 02:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbjEZGVM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 May 2023 02:21:12 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C01813D
        for <linux-omap@vger.kernel.org>; Thu, 25 May 2023 23:21:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 42DAB8107;
        Fri, 26 May 2023 06:21:10 +0000 (UTC)
Date:   Fri, 26 May 2023 09:21:09 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
        linux-omap@vger.kernel.org, Letux-kernel@openphoenux.org
Subject: Re: OMAP4/5 AESS on v6.4
Message-ID: <20230526062109.GC14287@atomide.com>
References: <FFF13275-327A-4E3C-95E5-88B6A376F582@goldelico.com>
 <20230525045340.GA14287@atomide.com>
 <85922330-D19F-474A-9F23-F12CCAC68491@goldelico.com>
 <20230526050917.GB14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526050917.GB14287@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [230526 05:09]:
> * H. Nikolaus Schaller <hns@goldelico.com> [230525 08:34]:
> > > Am 25.05.2023 um 06:53 schrieb Tony Lindgren <tony@atomide.com>:
> > > You could also check some driver registers for
> > > context lost status in the driver as the context lost registers are outside
> > > the driver IO range. And after that, using reset framework for context lost
> > > status could be done, maybe by adding support to drivers/soc/ti/omap_prm.c.
> > 
> > Ok. I'll look into that.
> 
> So reset_control_status() could maybe return -EIO error if context was lost.
> Or maybe something like reset_control_context_lost() could be implemented.
> Needs to be discussed on the related mailing lists of course. Then omap_prm.c
> just needs the context lost registers mapped, and consumer drivers can check
> context lost status from the reset framework.

Oh looking at the dts files, we're not passing the register offset to the
prm reset controller instance. So the binding #reset-cells = <2> would be needed
where the first one is reset controller offset and second one is the bit in the
context register. Seems doable though if we want to make reset framework
support hardware triggered reset status.

Regards,

Tony
