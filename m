Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E242CEF88
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 15:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbgLDONw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 09:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgLDONv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 09:13:51 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D63FC0613D1
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 06:13:11 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id ec16so2801772qvb.0
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/CuB4BUPPPCElSU6OIx1o5GVLjukOlTtexvAkstTGU=;
        b=g9IWBkSMSoS4pwQrE51FJj5gMMAIaHgHTOYFZxYZGkOjnGSFGxn8KEYiWiaEuVSHOh
         OLoC/oj8hIutmf/jhULbwAWidABZ4+DI4r0pplFM6F0s1dxi6miRLnZAy38sq8nlzJKy
         B/K6JrOnR66pUDlkzkkprQh7GfcYT0CiCZQ7kHMohqyUuQwXfCdroV/yJFxAZoFaLF4+
         Z6KH2lyQ73/cnl87WxsRamDqr4ZjmmJOeoXklNA9GcWlnKxOQ1QKlfRfE7D/oacq/PMi
         zHw0LM6nJAB+82rcjOwClYjz7Lkeu3Nk1GSwY7r7HL/iDJyIaoFlmRSaq67IJzlt1mMM
         4l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/CuB4BUPPPCElSU6OIx1o5GVLjukOlTtexvAkstTGU=;
        b=fIkL2B1q42Jnk24MsDNfnmas33e8F/ZlzauHKXQdnAVFBpmxTgffupVTsiYMApoand
         1LY6qC8HaKTL54Bu1wzzMBp5rNtxElr3RjO1znU2oHX+0H6sBsPCReEeH02Y6KbK8wjZ
         Pau9waVb5+gh4/xQCtNZZJ5gVvDjRRv6yXY46+vZxydzrHLgClJyxJxvxoggApUNtL0h
         vEkUVNfXTHNa5H2p74wzGn9UaLIpQzOLpdwpKCnP6x6cYAXroyNkOGFLWKxewsNkFWm3
         3WEdHD0kj1Lwx7HI1d6aXxlGglytJPZcJYt7d0OodMpFY18ji8XRjlKDRr92XNbKJmUv
         QCXg==
X-Gm-Message-State: AOAM533Ss2TthIFO30lKPOCu6zdOAm7FFQWw4kk8m+sfQA0z0baGLXVy
        l1321QF8dTHdpU9Hoc5kCezofBwLpdumyBqpMq85Pg==
X-Google-Smtp-Source: ABdhPJyfnhToL5E7AIjrA0jneKS3Xn97Wvyk2lkYwunE//sU5PTTzmlP8Bu5Vnj8dvyG9jQJOu6xU+WDcK7y/ALcZyc=
X-Received: by 2002:a0c:be02:: with SMTP id k2mr5496215qvg.49.1607091190459;
 Fri, 04 Dec 2020 06:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-5-grzegorz.jaszczyk@linaro.org> <20201203182134.GA1392978@xps15>
In-Reply-To: <20201203182134.GA1392978@xps15>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 4 Dec 2020 15:12:59 +0100
Message-ID: <CAMxfBF6W_MQ40V1CdL079p9V0R33ivVh_JutnzWVfBWRA5dGgQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] remoteproc/pru: Add pru-specific debugfs support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On Thu, 3 Dec 2020 at 19:21, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> On Thu, Nov 19, 2020 at 03:08:48PM +0100, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The remoteproc core creates certain standard debugfs entries,
> > that does not give a whole lot of useful information for the
> > PRUs. The PRU remoteproc driver is enhanced to add additional
> > debugfs entries for PRU. These will be auto-cleaned up when
> > the parent rproc debug directory is removed.
> >
> > The enhanced debugfs support adds two new entries: 'regs' and
> > 'single_step'. The 'regs' dumps out the useful CTRL sub-module
> > registers as well as each of the 32 GPREGs and CT_REGs registers.
> > The GPREGs and CT_REGs though are printed only when the PRU is
> > halted and accessible as per the IP design.
> >
> > The 'single_step' utilizes the single-step execution of the PRU
> > cores. Writing a non-zero value performs a single step, and a
> > zero value restores the PRU to execute in the same mode as the
> > mode before the first single step. (note: if the PRU is halted
> > because of a halt instruction, then no change occurs).
> >
> > Logic for setting the PC and jumping over a halt instruction shall
> > be added in the future.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  drivers/remoteproc/pru_rproc.c | 137 +++++++++++++++++++++++++++++++++
> >  1 file changed, 137 insertions(+)
> >
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index c68c3d6bfddd..d5f04d77ad54 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -11,6 +11,7 @@
> >   */
> >
> >  #include <linux/bitops.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > @@ -25,6 +26,13 @@
> >  /* PRU_ICSS_PRU_CTRL registers */
> >  #define PRU_CTRL_CTRL                0x0000
> >  #define PRU_CTRL_STS         0x0004
> > +#define PRU_CTRL_WAKEUP_EN   0x0008
> > +#define PRU_CTRL_CYCLE               0x000C
> > +#define PRU_CTRL_STALL               0x0010
> > +#define PRU_CTRL_CTBIR0              0x0020
> > +#define PRU_CTRL_CTBIR1              0x0024
> > +#define PRU_CTRL_CTPPR0              0x0028
> > +#define PRU_CTRL_CTPPR1              0x002C
> >
> >  /* CTRL register bit-fields */
> >  #define CTRL_CTRL_SOFT_RST_N BIT(0)
> > @@ -34,6 +42,10 @@
> >  #define CTRL_CTRL_SINGLE_STEP        BIT(8)
> >  #define CTRL_CTRL_RUNSTATE   BIT(15)
> >
> > +/* PRU_ICSS_PRU_DEBUG registers */
> > +#define PRU_DEBUG_GPREG(x)   (0x0000 + (x) * 4)
> > +#define PRU_DEBUG_CT_REG(x)  (0x0080 + (x) * 4)
> > +
> >  /* PRU Core IRAM address masks */
> >  #define PRU_IRAM_ADDR_MASK   0x3ffff
> >  #define PRU0_IRAM_ADDR_MASK  0x34000
> > @@ -73,6 +85,8 @@ enum pru_iomem {
> >   * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> >   * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
> >   * @pru_interrupt_map_sz: pru_interrupt_map size
> > + * @dbg_single_step: debug state variable to set PRU into single step mode
> > + * @dbg_continuous: debug state variable to restore PRU execution mode
> >   * @evt_count: number of mapped events
> >   */
> >  struct pru_rproc {
> > @@ -85,6 +99,8 @@ struct pru_rproc {
> >       int *mapped_irq;
> >       struct pru_irq_rsc *pru_interrupt_map;
> >       size_t pru_interrupt_map_sz;
> > +     u32 dbg_single_step;
> > +     u32 dbg_continuous;
> >       u8 evt_count;
> >  };
> >
> > @@ -99,6 +115,125 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
> >       writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
> >  }
> >
> > +static inline u32 pru_debug_read_reg(struct pru_rproc *pru, unsigned int reg)
> > +{
> > +     return readl_relaxed(pru->mem_regions[PRU_IOMEM_DEBUG].va + reg);
> > +}
> > +
> > +static int regs_show(struct seq_file *s, void *data)
> > +{
> > +     struct rproc *rproc = s->private;
> > +     struct pru_rproc *pru = rproc->priv;
> > +     int i, nregs = 32;
> > +     u32 pru_sts;
> > +     int pru_is_running;
> > +
> > +     seq_puts(s, "============== Control Registers ==============\n");
> > +     seq_printf(s, "CTRL      := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CTRL));
> > +     pru_sts = pru_control_read_reg(pru, PRU_CTRL_STS);
> > +     seq_printf(s, "STS (PC)  := 0x%08x (0x%08x)\n", pru_sts, pru_sts << 2);
> > +     seq_printf(s, "WAKEUP_EN := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_WAKEUP_EN));
> > +     seq_printf(s, "CYCLE     := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CYCLE));
> > +     seq_printf(s, "STALL     := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_STALL));
> > +     seq_printf(s, "CTBIR0    := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CTBIR0));
> > +     seq_printf(s, "CTBIR1    := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CTBIR1));
> > +     seq_printf(s, "CTPPR0    := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CTPPR0));
> > +     seq_printf(s, "CTPPR1    := 0x%08x\n",
> > +                pru_control_read_reg(pru, PRU_CTRL_CTPPR1));
> > +
> > +     seq_puts(s, "=============== Debug Registers ===============\n");
> > +     pru_is_running = pru_control_read_reg(pru, PRU_CTRL_CTRL) &
> > +                             CTRL_CTRL_RUNSTATE;
> > +     if (pru_is_running) {
> > +             seq_puts(s, "PRU is executing, cannot print/access debug registers.\n");
> > +             return 0;
> > +     }
> > +
> > +     for (i = 0; i < nregs; i++) {
> > +             seq_printf(s, "GPREG%-2d := 0x%08x\tCT_REG%-2d := 0x%08x\n",
> > +                        i, pru_debug_read_reg(pru, PRU_DEBUG_GPREG(i)),
> > +                        i, pru_debug_read_reg(pru, PRU_DEBUG_CT_REG(i)));
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> Here there is an extra line but below for DEFINE_SIMPLE_ATTRIBUTE() there isn't.
> Please pick a heuristic and stick with it.

Sure, I will remove the extra line and therefore make it consistent.

>
> With that:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thank you,
Grzegorz


>
> > +DEFINE_SHOW_ATTRIBUTE(regs);
> > +
> > +/*
> > + * Control PRU single-step mode
> > + *
> > + * This is a debug helper function used for controlling the single-step
> > + * mode of the PRU. The PRU Debug registers are not accessible when the
> > + * PRU is in RUNNING state.
> > + *
> > + * Writing a non-zero value sets the PRU into single-step mode irrespective
> > + * of its previous state. The PRU mode is saved only on the first set into
> > + * a single-step mode. Writing a zero value will restore the PRU into its
> > + * original mode.
> > + */
> > +static int pru_rproc_debug_ss_set(void *data, u64 val)
> > +{
> > +     struct rproc *rproc = data;
> > +     struct pru_rproc *pru = rproc->priv;
> > +     u32 reg_val;
> > +
> > +     val = val ? 1 : 0;
> > +     if (!val && !pru->dbg_single_step)
> > +             return 0;
> > +
> > +     reg_val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
> > +
> > +     if (val && !pru->dbg_single_step)
> > +             pru->dbg_continuous = reg_val;
> > +
> > +     if (val)
> > +             reg_val |= CTRL_CTRL_SINGLE_STEP | CTRL_CTRL_EN;
> > +     else
> > +             reg_val = pru->dbg_continuous;
> > +
> > +     pru->dbg_single_step = val;
> > +     pru_control_write_reg(pru, PRU_CTRL_CTRL, reg_val);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pru_rproc_debug_ss_get(void *data, u64 *val)
> > +{
> > +     struct rproc *rproc = data;
> > +     struct pru_rproc *pru = rproc->priv;
> > +
> > +     *val = pru->dbg_single_step;
> > +
> > +     return 0;
> > +}
> > +DEFINE_SIMPLE_ATTRIBUTE(pru_rproc_debug_ss_fops, pru_rproc_debug_ss_get,
> > +                     pru_rproc_debug_ss_set, "%llu\n");
> > +
> > +/*
> > + * Create PRU-specific debugfs entries
> > + *
> > + * The entries are created only if the parent remoteproc debugfs directory
> > + * exists, and will be cleaned up by the remoteproc core.
> > + */
> > +static void pru_rproc_create_debug_entries(struct rproc *rproc)
> > +{
> > +     if (!rproc->dbg_dir)
> > +             return;
> > +
> > +     debugfs_create_file("regs", 0400, rproc->dbg_dir,
> > +                         rproc, &regs_fops);
> > +     debugfs_create_file("single_step", 0600, rproc->dbg_dir,
> > +                         rproc, &pru_rproc_debug_ss_fops);
> > +}
> > +
> >  static void pru_dispose_irq_mapping(struct pru_rproc *pru)
> >  {
> >       while (pru->evt_count--) {
> > @@ -573,6 +708,8 @@ static int pru_rproc_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > +     pru_rproc_create_debug_entries(rproc);
> > +
> >       dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
> >
> >       return 0;
> > --
> > 2.29.0
> >
