Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060D84EDED4
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 18:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239966AbiCaQcS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 12:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbiCaQcR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 12:32:17 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B768E18F21E
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 09:30:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E1BDD80DB;
        Thu, 31 Mar 2022 16:28:18 +0000 (UTC)
Date:   Thu, 31 Mar 2022 19:30:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix regression for smc calls for vmap stack
Message-ID: <YkXXImoeFDpV+w+y@atomide.com>
References: <20220331144225.56553-1-tony@atomide.com>
 <CAK8P3a2-ik1e+DZV5g9hera8qzpBOURPLrPHPst3UKhwLKEOMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2-ik1e+DZV5g9hera8qzpBOURPLrPHPst3UKhwLKEOMg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [220331 15:25]:
> On Thu, Mar 31, 2022 at 4:42 PM Tony Lindgren <tony@atomide.com> wrote:
> > diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
> > --- a/arch/arm/mach-omap2/omap-secure.c
> > +++ b/arch/arm/mach-omap2/omap-secure.c
> > @@ -59,8 +59,8 @@ static void __init omap_optee_init_check(void)
> >  u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
> >                                                          u32 arg3, u32 arg4)
> >  {
> > +       static u32 param[5];
> >         u32 ret;
> > -       u32 param[5];
> 
> I think for this one, you do need to use a DEFINE_PER_CPU() to make it
> work when multiple cores run into the function concurrently. This is entered
> on OMAP44xx from irq_notifier() with cmd==CPU_CLUSTER_PM_ENTER
> and from start_secondary(). I suspect that one can show these never happen
> on more than one CPU at a time, but I have not been able to prove that
> myself.

Yeah makes sense. Will post v2.

Regards,

Tony
