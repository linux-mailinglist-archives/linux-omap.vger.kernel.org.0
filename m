Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC6154C318
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jun 2022 10:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237581AbiFOIGt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 04:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbiFOIGs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 04:06:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBF31483B0;
        Wed, 15 Jun 2022 01:06:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AD91A80FE;
        Wed, 15 Jun 2022 08:01:58 +0000 (UTC)
Date:   Wed, 15 Jun 2022 11:06:42 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Subject: Re: Linux 5.18.x: sdhci issue
Message-ID: <YqmTEqJ2sQ4DMO2s@atomide.com>
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com>
 <CAK8P3a3JS3GWEA_A9oCyWX7msxHwFObnKi_1=U_FMPNOV=f6qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3JS3GWEA_A9oCyWX7msxHwFObnKi_1=U_FMPNOV=f6qg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [220531 11:38]:
> On Thu, May 5, 2022 at 7:02 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > > Hi Tony, all,
> > >
> > > During the kernel boot I see the following error. The device is still
> > > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > > issue?
> >
> > Thanks for reporting it, I was not aware of this one. Might be worth
> > bisecting. Adding linux-mmc and Ulf.
> >
> > Regards,
> >
> > Tony
> >
> > > [    3.734570] sdhci-omap 48060000.mmc: Got CD GPIO
> > > [    3.739989] INFO: trying to register non-static key.
> > > [    3.744991] The code is fine but needs lockdep annotation, or maybe
> > > [    3.751286] you didn't initialize this object before use?
> > > [    3.756707] turning off the locking correctness validator.
> > > [    3.762221] CPU: 0 PID: 8 Comm: kworker/u2:0 Not tainted 5.18.0-rc5 #1
> > > [    3.768787] Hardware name: Generic AM33XX (Flattened Device Tree)
> > > [    3.774913] Workqueue: events_unbound async_run_entry_fn
> > > [    3.780283]  unwind_backtrace from show_stack+0x10/0x14
> > > [    3.785555]  show_stack from dump_stack_lvl+0x58/0x70
> > > [    3.790643]  dump_stack_lvl from register_lock_class+0x4ec/0x55c
> > > [    3.796695]  register_lock_class from __lock_acquire+0x60/0x2bd4
> > > [    3.802738]  __lock_acquire from lock_acquire.part.0+0xb0/0x248
> > > [    3.808695]  lock_acquire.part.0 from _raw_spin_lock_irqsave+0x4c/0x68
> > > [    3.815265]  _raw_spin_lock_irqsave from sdhci_init+0x34/0xf4
> > > [    3.821051]  sdhci_init from sdhci_runtime_resume_host+0x3c/0x1bc
> > > [    3.827180]  sdhci_runtime_resume_host from
> > > sdhci_omap_runtime_resume+0x108/0x110
> > > [    3.834710]  sdhci_omap_runtime_resume from __rpm_callback+0x3c/0x148
> > > [    3.841197]  __rpm_callback from rpm_callback+0x50/0x54
> > > [    3.846453]  rpm_callback from rpm_resume+0x518/0x71c
> > > [    3.851534]  rpm_resume from __pm_runtime_resume+0x50/0x68
> > > [    3.857052]  __pm_runtime_resume from sdhci_omap_probe+0x1e4/0x7a8
> > > [    3.863270]  sdhci_omap_probe from platform_probe+0x58/0xbc
> > > [    3.868886]  platform_probe from really_probe.part.0+0x9c/0x290
> 
> The problem is that sdhci_omap_probe() calls pm_runtime_enable()
> before calling sdhci_setup_host(), so it's not in the correct state at this
> point. One could get rid of the warning by moving the spin_lock_init()
> from sdhci_setup_host() to sdhi_alloc_host(), but I suspect the problem
> is in the omap part, and it would still be wrong to do the resume first.

Yes that makes sense. We need to resume early to detect the hardware
capabilities, we already check the status on first resume for context
save so we can just expand that.

Yegor, care to try to the following patch and see if that works for you?

Regards,

Tony

8< --------------
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1441,7 +1441,8 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
-	sdhci_runtime_suspend_host(host);
+	if (omap_host->con != -EINVAL)
+		sdhci_runtime_suspend_host(host);
 
 	sdhci_omap_context_save(omap_host);
 
@@ -1458,10 +1459,10 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	if (omap_host->con != -EINVAL)
+	if (omap_host->con != -EINVAL) {
 		sdhci_omap_context_restore(omap_host);
-
-	sdhci_runtime_resume_host(host, 0);
+		sdhci_runtime_resume_host(host, 0);
+	}
 
 	return 0;
 }
