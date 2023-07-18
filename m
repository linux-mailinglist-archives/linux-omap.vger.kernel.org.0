Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BC6757335
	for <lists+linux-omap@lfdr.de>; Tue, 18 Jul 2023 07:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjGRFa3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Jul 2023 01:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjGRFaH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Jul 2023 01:30:07 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D733D172A
        for <linux-omap@vger.kernel.org>; Mon, 17 Jul 2023 22:29:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6696380AE;
        Tue, 18 Jul 2023 05:29:21 +0000 (UTC)
Date:   Tue, 18 Jul 2023 08:29:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "guomengqi (A)" <guomengqi3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        haojian.zhuang@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Message-ID: <20230718052920.GG5194@atomide.com>
References: <20230703081716.15810-1-guomengqi3@huawei.com>
 <CACRpkdaW5j0mRbwv7rvAKiwBBe_bArqCKRv+UPCPxwX8GJ3Qkg@mail.gmail.com>
 <9a490082-bc30-8a7e-2d19-fcd212771a4b@huawei.com>
 <20230706040755.GB5089@atomide.com>
 <7b9d0af0-6990-9696-0dc2-acef2543b2a8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b9d0af0-6990-9696-0dc2-acef2543b2a8@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* guomengqi (A) <guomengqi3@huawei.com> [230712 10:00]:
> 在 2023/7/6 12:07, Tony Lindgren 写道:
> > Thanks for looking into it. I wonder if we can rely on naming for
> > pinmux_func_name_to_selector() though. Can things change in a way where
> > we need to release everything and reparse? Mostly wondering what happens
> > with DT overlays?
> 
> Let me confirm, you mean when the pin controller dtsi changed at runtime,
> some functions and groups can change silently while the dt-node name remains
> same, so the old data needs to be released and reparsed, right?
> 
> I don't know much about DT overlays. I can look deeper into revelant codes,
> maybe do some experiments too.
> 
> My guess now is DT overlay will first remove the old parsed nodes, then
> create new ones. If so, the modification to pcs_dt_node_to_map() in this
> patch is not affected.

OK yeah good to check it to confirm.

Regards,

Tony
