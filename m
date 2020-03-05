Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB46517ACDA
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 18:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgCERNw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 12:13:52 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:47070 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgCERNt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 12:13:49 -0500
Received: by mail-il1-f194.google.com with SMTP id e8so5662496ilc.13
        for <linux-omap@vger.kernel.org>; Thu, 05 Mar 2020 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FS4R3XdKNKqksXAkSGxfE956u5o+GTwAAUfUbvJGI5o=;
        b=R1nuhal7Ww/igcjeSDFNiWFqjwpJ2oJit4TzwJ0WmNUaJYhvvgSOcM/gkdKXZJ1eQt
         I3E3dLoveLDppH5Yy/1blyjAb1elEFD8FJTK8SQiiYrWcnlHSEdnmwMNzVMRea1TxZTc
         efWkIEgFojS3v5hceyCETjTzQfNsu7YrYdFad6F8v7dojL++48t1gPi9/Gs69qqpno0a
         3ciWTlRcsf7rmObRh2EspqwQWir21hwgjw97oADJAHX2TWXTwWjrwOr2JcNclJW2Y5HM
         rqCg1RTUJ8L3vIJ9fBMc2BABDbIsHSHMMaSJLAmiiZws/OLrekOdAABaDeh9aqm+79nJ
         htJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FS4R3XdKNKqksXAkSGxfE956u5o+GTwAAUfUbvJGI5o=;
        b=qwRkHajronJetWA+BjN6Q8IxGx2aIVsbFTALQgpRGT21EN1V6lo6H1HQTcW7wOW3Qk
         qtlBTpeBSUrEMqUIXdY/RfbxTgfOf7EO7rpoM0VXFF3HKW6QEOfOhFK503TnplXDlCRh
         XuHzFhvFSA9PBGbyCDTnqVeSxw33bZN8Zumvr+5OwBesA/8XeYOjUXghPAvYZthEcDm2
         Vb89MzvPGEpHblVVWImGhlv+4RUTqyakWa1YITQmPjkKxRnAQXlAFO4XdvJvcnkv8X/O
         gUowYziz3Z3pfcYQIhaj0mFkTW64m+Ibm1LECZlTk4+EE5F5sJCyyiAUcJQgLgUhS+5g
         QCJg==
X-Gm-Message-State: ANhLgQ1hb1KYVyP1jTHd+rvDiNxhc9WBfaW41yWB7RXFzLXweW37ebQe
        kculYKRbWd4foqucKiJ3KtBN6akQqbGOW1MH9hbjOQ==
X-Google-Smtp-Source: ADFU+vsE5B1aanvNjhLaqA8qBKnlNs8vjrtAH6us83zYG1xhHnIne6VVbdGFL1pZ5nl0ySQph8+T3qadr5rpHsaxMN0=
X-Received: by 2002:a92:9f1a:: with SMTP id u26mr9202759ili.72.1583428428435;
 Thu, 05 Mar 2020 09:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20200221101936.16833-1-t-kristo@ti.com> <20200221101936.16833-15-t-kristo@ti.com>
 <20200304223300.GB2799@xps15> <df8ae0a4-968d-c0f8-940d-78d848816e11@ti.com>
In-Reply-To: <df8ae0a4-968d-c0f8-940d-78d848816e11@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 5 Mar 2020 10:13:37 -0700
Message-ID: <CANLsYkz5JrYnEGFEuEJzTpfyP--kRyYW2AZc9GEnYKC1FXfgUA@mail.gmail.com>
Subject: Re: [PATCHv7 14/15] remoteproc/omap: Add watchdog functionality for
 remote processors
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 4 Mar 2020 at 17:20, Suman Anna <s-anna@ti.com> wrote:
>
> On 3/4/20 4:33 PM, Mathieu Poirier wrote:
> > On Fri, Feb 21, 2020 at 12:19:35PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> Remote processors can be stuck in a loop, and may not be recoverable
> >> if they do not have a built-in watchdog. The watchdog implementation
> >> for OMAP remote processors uses external gptimers that can be used
> >> to interrupt both the Linux host as well as the remote processor.
> >>
> >> Each remote processor is responsible for refreshing the timer during
> >> normal behavior - during OS task scheduling or entering the idle loop
> >> properly. During a watchdog condition (executing a tight loop causing
> >> no scheduling), the host processor gets interrupts and schedules a
> >> recovery for the corresponding remote processor. The remote processor
> >> may also get interrupted to be able to print a back trace.
> >>
> >> A menuconfig option has also been added to enable/disable the Watchdog
> >> functionality, with the default as disabled.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >> v7:
> >>   - minor kerneldoc updates
> >>
> >>  drivers/remoteproc/Kconfig           |  12 +++
> >>  drivers/remoteproc/omap_remoteproc.c | 153 ++++++++++++++++++++++++---
> >>  2 files changed, 153 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index b52abc2268cc..5f33358eb2f1 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -52,6 +52,18 @@ config OMAP_REMOTEPROC
> >>        It's safe to say N here if you're not interested in multimedia
> >>        offloading or just want a bare minimum kernel.
> >>
> >> +config OMAP_REMOTEPROC_WATCHDOG
> >> +    bool "OMAP remoteproc watchdog timer"
> >> +    depends on OMAP_REMOTEPROC
> >> +    default n
> >> +    help
> >> +      Say Y here to enable watchdog timer for remote processors.
> >> +
> >> +      This option controls the watchdog functionality for the remote
> >> +      processors in OMAP. Dedicated OMAP DMTimers are used by the remote
> >> +      processors and triggers the timer interrupt upon a watchdog
> >> +      detection.
> >> +
> >>  config WKUP_M3_RPROC
> >>      tristate "AMx3xx Wakeup M3 remoteproc support"
> >>      depends on SOC_AM33XX || SOC_AM43XX
> >> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >> index 7dcb5da0d940..bae01a9f8afc 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.c
> >> +++ b/drivers/remoteproc/omap_remoteproc.c
> >> @@ -24,6 +24,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/dma-mapping.h>
> >> +#include <linux/interrupt.h>
> >>  #include <linux/remoteproc.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/omap-iommu.h>
> >> @@ -72,10 +73,12 @@ struct omap_rproc_mem {
> >>   * struct omap_rproc_timer - data structure for a timer used by a omap rproc
> >>   * @odt: timer pointer
> >>   * @timer_ops: OMAP dmtimer ops for @odt timer
> >> + * @irq: timer irq
> >>   */
> >>  struct omap_rproc_timer {
> >>      struct omap_dm_timer *odt;
> >>      const struct omap_dm_timer_ops *timer_ops;
> >> +    int irq;
> >>  };
> >>
> >>  /**
> >> @@ -86,6 +89,7 @@ struct omap_rproc_timer {
> >>   * @mem: internal memory regions data
> >>   * @num_mems: number of internal memory regions
> >>   * @num_timers: number of rproc timer(s)
> >> + * @num_wd_timers: number of rproc watchdog timers
> >>   * @timers: timer(s) info used by rproc
> >>   * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
> >>   * @need_resume: if true a resume is needed in the system resume callback
> >> @@ -102,6 +106,7 @@ struct omap_rproc {
> >>      struct omap_rproc_mem *mem;
> >>      int num_mems;
> >>      int num_timers;
> >> +    int num_wd_timers;
> >>      struct omap_rproc_timer *timers;
> >>      int autosuspend_delay;
> >>      bool need_resume;
> >> @@ -219,6 +224,79 @@ static inline int omap_rproc_release_timer(struct omap_rproc_timer *timer)
> >>      return timer->timer_ops->free(timer->odt);
> >>  }
> >>
> >> +/**
> >> + * omap_rproc_get_timer_irq() - get the irq for a timer
> >> + * @timer: handle to a OMAP rproc timer
> >> + *
> >> + * This function is used to get the irq associated with a watchdog timer. The
> >> + * function is called by the OMAP remoteproc driver to register a interrupt
> >> + * handler to handle watchdog events on the remote processor.
> >> + *
> >> + * Return: irq id on success, otherwise a failure as returned by DMTimer ops
> >> + */
> >> +static inline int omap_rproc_get_timer_irq(struct omap_rproc_timer *timer)
> >> +{
> >> +    return timer->timer_ops->get_irq(timer->odt);
> >> +}
> >> +
> >> +/**
> >> + * omap_rproc_ack_timer_irq() - acknowledge a timer irq
> >> + * @timer: handle to a OMAP rproc timer
> >> + *
> >> + * This function is used to clear the irq associated with a watchdog timer. The
> >> + * The function is called by the OMAP remoteproc upon a watchdog event on the
> >> + * remote processor to clear the interrupt status of the watchdog timer.
> >> + */
> >> +static inline void omap_rproc_ack_timer_irq(struct omap_rproc_timer *timer)
> >> +{
> >> +    timer->timer_ops->write_status(timer->odt, OMAP_TIMER_INT_OVERFLOW);
> >> +}
> >> +
> >> +/**
> >> + * omap_rproc_watchdog_isr() - Watchdog ISR handler for remoteproc device
> >> + * @irq: IRQ number associated with a watchdog timer
> >> + * @data: IRQ handler data
> >> + *
> >> + * This ISR routine executes the required necessary low-level code to
> >> + * acknowledge a watchdog timer interrupt. There can be multiple watchdog
> >> + * timers associated with a rproc (like IPUs which have 2 watchdog timers,
> >> + * one per Cortex M3/M4 core), so a lookup has to be performed to identify
> >> + * the timer to acknowledge its interrupt.
> >> + *
> >> + * The function also invokes rproc_report_crash to report the watchdog event
> >> + * to the remoteproc driver core, to trigger a recovery.
> >> + *
> >> + * Return: IRQ_HANDLED on success, otherwise IRQ_NONE
> >> + */
> >> +static irqreturn_t omap_rproc_watchdog_isr(int irq, void *data)
> >> +{
> >> +    struct rproc *rproc = data;
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    struct device *dev = rproc->dev.parent;
> >> +    struct omap_rproc_timer *timers = oproc->timers;
> >> +    struct omap_rproc_timer *wd_timer = NULL;
> >> +    int num_timers = oproc->num_timers + oproc->num_wd_timers;
> >> +    int i;
> >> +
> >> +    for (i = oproc->num_timers; i < num_timers; i++) {
> >> +            if (timers[i].irq > 0 && irq == timers[i].irq) {
> >> +                    wd_timer = &timers[i];
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (!wd_timer) {
> >> +            dev_err(dev, "invalid timer\n");
> >> +            return IRQ_NONE;
> >> +    }
> >> +
> >> +    omap_rproc_ack_timer_irq(wd_timer);
> >> +
> >> +    rproc_report_crash(rproc, RPROC_WATCHDOG);
> >> +
> >> +    return IRQ_HANDLED;
> >> +}
> >> +
> >>  /**
> >>   * omap_rproc_enable_timers() - enable the timers for a remoteproc
> >>   * @rproc: handle of a remote processor
> >> @@ -242,19 +320,26 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
> >>      struct omap_rproc_timer *timers = oproc->timers;
> >>      struct device *dev = rproc->dev.parent;
> >>      struct device_node *np = NULL;
> >> +    int num_timers = oproc->num_timers + oproc->num_wd_timers;
> >>
> >> -    if (!oproc->num_timers)
> >> +    if (!num_timers)
> >>              return 0;
> >>
> >>      if (!configure)
> >>              goto start_timers;
> >>
> >> -    for (i = 0; i < oproc->num_timers; i++) {
> >> -            np = of_parse_phandle(dev->of_node, "ti,timers", i);
> >> +    for (i = 0; i < num_timers; i++) {
> >> +            if (i < oproc->num_timers)
> >> +                    np = of_parse_phandle(dev->of_node, "ti,timers", i);
> >> +            else
> >> +                    np = of_parse_phandle(dev->of_node,
> >> +                                          "ti,watchdog-timers",
> >> +                                          (i - oproc->num_timers));
> >>              if (!np) {
> >>                      ret = -ENXIO;
> >>                      dev_err(dev, "device node lookup for timer at index %d failed: %d\n",
> >> -                            i, ret);
> >> +                            i < oproc->num_timers ? i :
> >> +                            i - oproc->num_timers, ret);
> >>                      goto free_timers;
> >>              }
> >>
> >> @@ -277,12 +362,14 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
> >>              if (!timer_ops || !timer_ops->request_by_node ||
> >>                  !timer_ops->set_source || !timer_ops->set_load ||
> >>                  !timer_ops->free || !timer_ops->start ||
> >> -                !timer_ops->stop) {
> >> +                !timer_ops->stop || !timer_ops->get_irq ||
> >> +                !timer_ops->write_status) {
> >>                      ret = -EINVAL;
> >>                      dev_err(dev, "device does not have required timer ops\n");
> >>                      goto put_node;
> >>              }
> >>
> >> +            timers[i].irq = -1;
> >>              timers[i].timer_ops = timer_ops;
> >>              ret = omap_rproc_request_timer(dev, np, &timers[i]);
> >>              if (ret) {
> >> @@ -291,10 +378,33 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
> >>                      goto put_node;
> >>              }
> >>              of_node_put(np);
> >> +
> >> +            if (i >= oproc->num_timers) {
> >
> > We already have num_wd_timers and oproc->timers is allocated via
> > devm_kcalloc()...  I think the code would be much easier to ready and maintain
> > if watchdog timers where held in their own array.
>
> The only special thing about watchdog timers is that we register for an
> interrupt, and that's what this condition is doing, but otherwise almost
> all the operations are identical and need to be performed on all the
> timers. So, you would have to use two for loops everywhere if you
> separate them out. So. I still think this keeps the code dealing with
> timers simpler.

From my point of view the tedious dance of checking for
oproc->num_timers is enough to keep things separate.  But that is just
my personal opinion, feel free to keep things as is if think your
implementation is better.

>
> >
> >> +                    timers[i].irq = omap_rproc_get_timer_irq(&timers[i]);
> >> +                    if (timers[i].irq < 0) {
> >> +                            dev_err(dev, "get_irq for timer %p failed: %d\n",
> >> +                                    np, timers[i].irq);
> >> +                            ret = -EBUSY;
> >> +                            goto free_timers;
> >> +                    }
> >> +
> >> +                    ret = request_irq(timers[i].irq,
> >> +                                      omap_rproc_watchdog_isr, IRQF_SHARED,
> >> +                                      "rproc-wdt", rproc);
> >> +                    if (ret) {
> >> +                            dev_err(dev, "error requesting irq for timer %p\n",
> >> +                                    np);
> >> +                            omap_rproc_release_timer(&timers[i]);
> >> +                            timers[i].odt = NULL;
> >> +                            timers[i].timer_ops = NULL;
> >> +                            timers[i].irq = -1;
> >> +                            goto free_timers;
> >> +                    }
> >> +            }
> >>      }
> >>
> >>  start_timers:
> >> -    for (i = 0; i < oproc->num_timers; i++) {
> >> +    for (i = 0; i < num_timers; i++) {
> >>              ret = omap_rproc_start_timer(&timers[i]);
> >>              if (ret) {
> >>                      dev_err(dev, "start timer %p failed failed: %d\n", np,
> >> @@ -316,9 +426,12 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
> >>              of_node_put(np);
> >>  free_timers:
> >>      while (i--) {
> >> +            if (i >= oproc->num_timers)
> >> +                    free_irq(timers[i].irq, rproc);
> >>              omap_rproc_release_timer(&timers[i]);
> >>              timers[i].odt = NULL;
> >>              timers[i].timer_ops = NULL;
> >> +            timers[i].irq = -1;
> >>      }
> >>
> >>      return ret;
> >> @@ -341,16 +454,20 @@ static int omap_rproc_disable_timers(struct rproc *rproc, bool configure)
> >>      int i;
> >>      struct omap_rproc *oproc = rproc->priv;
> >>      struct omap_rproc_timer *timers = oproc->timers;
> >> +    int num_timers = oproc->num_timers + oproc->num_wd_timers;
> >>
> >> -    if (!oproc->num_timers)
> >> +    if (!num_timers)
> >>              return 0;
> >>
> >> -    for (i = 0; i < oproc->num_timers; i++) {
> >> +    for (i = 0; i < num_timers; i++) {
> >>              omap_rproc_stop_timer(&timers[i]);
> >>              if (configure) {
> >> +                    if (i >= oproc->num_timers)
> >> +                            free_irq(timers[i].irq, rproc);
> >>                      omap_rproc_release_timer(&timers[i]);
> >>                      timers[i].odt = NULL;
> >>                      timers[i].timer_ops = NULL;
> >> +                    timers[i].irq = -1;
> >>              }
> >>      }
> >>
> >> @@ -1097,6 +1214,7 @@ static int omap_rproc_probe(struct platform_device *pdev)
> >>      struct omap_rproc *oproc;
> >>      struct rproc *rproc;
> >>      const char *firmware;
> >> +    int num_timers;
> >>      int ret;
> >>      struct reset_control *reset;
> >>
> >> @@ -1149,8 +1267,19 @@ static int omap_rproc_probe(struct platform_device *pdev)
> >>              oproc->num_timers = 0;
> >>      }
> >>
> >> -    if (oproc->num_timers) {
> >> -            oproc->timers = devm_kcalloc(&pdev->dev, oproc->num_timers,
> >> +#ifdef CONFIG_OMAP_REMOTEPROC_WATCHDOG
> >> +    oproc->num_wd_timers =
> >> +            of_count_phandle_with_args(np, "ti,watchdog-timers", NULL);
> >> +    if (oproc->num_wd_timers <= 0) {
> >> +            dev_dbg(&pdev->dev, "device does not have watchdog timers, status = %d\n",
> >> +                    oproc->num_wd_timers);
> >> +            oproc->num_wd_timers = 0;
> >> +    }
> >> +#endif
> >
> > Please turn this into a function with the implementation conditional on the
> > #ifdef.
> >
>
> We can probably move the entire timer parse and logic into a separate
> function.

Agreed - thanks,
Mathieu

>
> regards
> Suman
>
> >> +
> >> +    if (oproc->num_timers || oproc->num_wd_timers) {
> >> +            num_timers = oproc->num_timers + oproc->num_wd_timers;
> >> +            oproc->timers = devm_kcalloc(&pdev->dev, num_timers,
> >>                                           sizeof(*oproc->timers),
> >>                                           GFP_KERNEL);
> >>              if (!oproc->timers) {
> >> @@ -1158,8 +1287,8 @@ static int omap_rproc_probe(struct platform_device *pdev)
> >>                      goto free_rproc;
> >>              }
> >>
> >> -            dev_dbg(&pdev->dev, "device has %d tick timers\n",
> >> -                    oproc->num_timers);
> >> +            dev_dbg(&pdev->dev, "device has %d tick timers and %d watchdog timers\n",
> >> +                    oproc->num_timers, oproc->num_wd_timers);
> >>      }
> >>
> >>      init_completion(&oproc->pm_comp);
> >> --
> >> 2.17.1
> >>
> >> --
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
