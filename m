Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD71A4D6D55
	for <lists+linux-omap@lfdr.de>; Sat, 12 Mar 2022 08:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiCLHxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Mar 2022 02:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiCLHxp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Mar 2022 02:53:45 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3FED876679;
        Fri, 11 Mar 2022 23:52:39 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A5F9380B3;
        Sat, 12 Mar 2022 07:51:08 +0000 (UTC)
Date:   Sat, 12 Mar 2022 09:52:36 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Drop TI compatibility clocks
Message-ID: <YixRREMd+t1tbbwC@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com>
 <20220311033617.5712AC340EE@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311033617.5712AC340EE@smtp.kernel.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [220311 03:34]:
> Quoting Tony Lindgren (2022-02-03 00:56:15)
> > Hi all,
> > 
> > In order to prepare the TI clocks for fixing lots of devicetree warnings,
> > let's first drop the now unused compatibility clocks.
> > 
> > The dra7 changes depend on my still pending omap-for-v5.17/fixes-not-urgent
> > pull request that did not make it for v5.17-rc series so far.
> > 
> 
> What should I do with this one though?

Well the dependencies are now merged to the mainline kernel, so you could
merge in commit 31aa7056bbec, then apply this series if otherwise OK.

Commit 31aa7056bbec is based on the old v5.16-rc1. It would bring few other
fixes from mainline too if pulled on a v5.17-rc1 based branch:

31aa7056bbec ("ARM: dts: Don't use legacy clock defines for dra7 clkctrl")
9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the legacy section")
23885389dbbb ("ARM: dts: Fix timer regression for beagleboard revision c")
29a5e8496b3a ("ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt")
34596ba380b0 ("ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of")
80c469a0a037 ("ARM: OMAP2+: hwmod: Add of_node_put() before break")

Regards,

Tony
