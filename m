Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EC055E277
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbiF0NyG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 09:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbiF0NyF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 09:54:05 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9276C643F
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 06:54:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 634648106;
        Mon, 27 Jun 2022 13:48:49 +0000 (UTC)
Date:   Mon, 27 Jun 2022 16:53:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Grazvydas Ignotas <notasas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Stefan Leichter <sle85276@gmx.de>, Grond <grond66@riseup.net>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
Message-ID: <Yrm2dl9EtIb5IYhi@atomide.com>
References: <Yrl92RILZwhQOP+e@atomide.com>
 <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [220627 11:36]:
> Hi Tony,
> 
> > Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > Hi Grazvydas,
> > 
> > Arnd noticed that pandora audio is using machine_is_omap3_pandora() check
> > that never succeeds for devicetree booting machines. Looks like this has
> > been broken at some point many years ago with the devicetree conversion.
> > 
> > Does anybody have an interest in fixing this driver?
> 
> we already have fixes by Stefan Leichter and Grond here (incl. removing any call to machine_is_omap3_pandora):
> 
> 	https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/sound-soc

OK :)

> But I don't know who can volunteer to run this series through the upstreaming discussions
> and do regression tests (AFAIR the Pandora of Grond is broken and he has no replacement).

Probably best that Stefan and Grond do it :) Not sure what the minimal fix
for the mainline kernel might be to get things at least try to probe.

Regards,

Tony
