Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AB14F790F
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 10:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242744AbiDGIG5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Thu, 7 Apr 2022 04:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242882AbiDGIGb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 04:06:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76DE01AECA5;
        Thu,  7 Apr 2022 01:04:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 52E458125;
        Thu,  7 Apr 2022 08:01:37 +0000 (UTC)
Date:   Thu, 7 Apr 2022 11:03:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <Yk6a7meIO+fV5J1D@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220407075356.lmqnax35cewiwh4k@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20220407075356.lmqnax35cewiwh4k@houat>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Maxime Ripard <maxime@cerno.tech> [220407 07:51]:
> I haven't been able to find an omap3 board or a qemu target that could
> help me debug this, but I fixed a few issues already that could fix omap
> as well.
> 
> Could you test today's
> https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes
> 
> And let me know if it works?

Yes sorry I've been meaning to try your fixes but had some file system
issues on my build box after a power cut while updating the system. All
good now though, I should be able to give it a try this afternoon.

Regards,

Tony

