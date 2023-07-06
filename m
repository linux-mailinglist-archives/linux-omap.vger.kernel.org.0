Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA5B749491
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jul 2023 06:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbjGFEIN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Jul 2023 00:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjGFEIE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Jul 2023 00:08:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3FA671FC3
        for <linux-omap@vger.kernel.org>; Wed,  5 Jul 2023 21:07:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8926A807E;
        Thu,  6 Jul 2023 04:07:56 +0000 (UTC)
Date:   Thu, 6 Jul 2023 07:07:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "guomengqi (A)" <guomengqi3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        haojian.zhuang@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Message-ID: <20230706040755.GB5089@atomide.com>
References: <20230703081716.15810-1-guomengqi3@huawei.com>
 <CACRpkdaW5j0mRbwv7rvAKiwBBe_bArqCKRv+UPCPxwX8GJ3Qkg@mail.gmail.com>
 <9a490082-bc30-8a7e-2d19-fcd212771a4b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a490082-bc30-8a7e-2d19-fcd212771a4b@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* guomengqi (A) <guomengqi3@huawei.com> [230706 03:21]:
> 在 2023/7/4 17:18, Linus Walleij 写道:
> > On Mon, Jul 3, 2023 at 10:24 AM Guo Mengqi <guomengqi3@huawei.com> wrote:
> > 
> > > In a reliability test which repeatedly load and remove a module,
> > > I found some kmalloc-256 memory leaks in pinctrl-single.
> > > 
> > > pcs_dt_node_to_map() will recognize a dt_node and
> > > make a mapping for it. Along the way some pinctrl functions and groups
> > > are registered in pinctrl-single controller. These functions/groups are
> > > registered once and not removed during the system lifetime.
> > > 
> > > When the client module loads again, pcs_dt_node_to_map() fail to consider
> > > this situation, create the same set of resources, and does not release or
> > > use them.
> > > 
> > > To fix this, add a check at the start of pcs_parse_one_pinctrl_entry/
> > > pcs_parse_bits_in_pinctrl_entry. If the target is found,
> > > then all the resource allocation and parsing work can be skipped,
> > > just set the mapping with existing function/group information.
> > > 
> > > Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree
> > > based pinctrl driver")
> > > 
> > > Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
> > Good catch!
> > 
> > I expect Tony to review the patch in-depth.
> 
> Thank you :)

Thanks for looking into it. I wonder if we can rely on naming for
pinmux_func_name_to_selector() though. Can things change in a way where
we need to release everything and reparse? Mostly wondering what happens
with DT overlays?

> > > -static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
> > > +int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
> > >                                          const char *function)
> > >   {
> > >          const struct pinmux_ops *ops = pctldev->desc->pmxops;
> > It appears you need to add EXPORT_SYMBOL_GPL() for this function
> > so the module can build. (This is why the build robot complains.)
> Yes, it happens when config=M. I will send a v2 patch later to fix this.

That change might be worth doing in any case if there is need for it.

Regards,

Tony
