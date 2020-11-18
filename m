Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0742B8058
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 16:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgKRPY3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Nov 2020 10:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgKRPY3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Nov 2020 10:24:29 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3990BC061A48
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 07:24:29 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id u4so2084960qkk.10
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fle8ClFYzcj6GfpSzRipzzKtCibAbBbslIkjI+AUvgc=;
        b=uFCwaMaOuYdqw4Gmvzziuv+cKJXjaWg+O30XofsrjlUpVEpkZW6eXtVOYXJIynnQ1Q
         lH6wGhVB+H9ilEm/2BsZxlhmxx8JCk0wtEnlpa6sZanxnDYCh5sNCRaSR1m2JypbuFGO
         RwvuZpBx+ywJju9RId62y0nzsDyfYz3ojOGbVYBhYhDMsca49SzQsq6A9cC6E9+KC/v9
         0Y9k2nBPY28I0+zCrZw6O5DGwkXQ+Cew5MwfiU0DqdgFd30bL3RX178qX3zurevOVVAY
         Qia6lv5MAF/o6fhmOA/Xw2zCiw39PzwOjNher+Z/286Agz7meYvrjvTulHbjzL7Pvry7
         t0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fle8ClFYzcj6GfpSzRipzzKtCibAbBbslIkjI+AUvgc=;
        b=E6jYopce2rfrbPb2GSqLOEKW9hDGLWPDc2aI7g8kdcOiASCYRNQMDRzal7/NT+eh1H
         duB1kyyp0RtKhMmXWLEN1AMJOEHoDNje0xnKcMoAghVqwFy6wk6cQ5quF7XDkgZvPiBa
         YUcDRVhBIcROF7BirlSBpL4DE8utePk4iNx8YHpTyjGYdXnyBZ/DG2Ap6GGwx74lnuDc
         Tb4Bm8ysjtszEXLyAxX2Oxytb4VhQCZ1qWQAf5j7GKo4m+xQKqi8HuM3uIW1vobfSKdX
         Vg5FBWrwySIPF7wR9jngqoNv+KZAcdckIT8G/N2zIXu3sfOL3eyttQTl7GHcrHxy2cHf
         d2AA==
X-Gm-Message-State: AOAM532zXZxk0edJmOaF/JKmWqmuGRhVvfAc+64fpQYEgOi0RDUaqBsh
        XY0T17p5Lq/T2C4ynM7mvvEiMyVrXIhKI6dDFToB7g==
X-Google-Smtp-Source: ABdhPJw8gl/nvg3ZUtxwIZOKLIFYuEwxoN044AJNe0ORQz0AOrqZagvnjB/wXJ8KYl560v6qKtiAftgU43W9Ttqb5W8=
X-Received: by 2002:ae9:ed89:: with SMTP id c131mr5019963qkg.421.1605713068425;
 Wed, 18 Nov 2020 07:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
 <20201114084613.13503-6-grzegorz.jaszczyk@linaro.org> <0ae5656f-20d7-95dc-f88a-7125edfbfb75@ti.com>
In-Reply-To: <0ae5656f-20d7-95dc-f88a-7125edfbfb75@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 18 Nov 2020 16:24:16 +0100
Message-ID: <CAMxfBF5ewCm_XTFoOdbsODD1pWkOS0Rz2ag5zRZscsYj_NmnQw@mail.gmail.com>
Subject: Re: [PATCH 5/6] remoteproc/pru: Add support for various PRU cores on
 K3 AM65x SoCs
To:     Suman Anna <s-anna@ti.com>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On Tue, 17 Nov 2020 at 21:09, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 11/14/20 2:46 AM, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The K3 AM65x family of SoCs have the next generation of the PRU-ICSS
> > processor subsystem, commonly referred to as ICSSG. Each ICSSG processor
> > subsystem on AM65x SR1.0 contains two primary PRU cores and two new
> > auxiliary PRU cores called RTUs. The AM65x SR2.0 SoCs have a revised
> > ICSSG IP that is based off the subsequent IP revision used on J721E
> > SoCs. This IP instance has two new custom auxiliary PRU cores called
> > Transmit PRUs (Tx_PRUs) in addition to the existing PRUs and RTUs.
> >
> > Each RTU and Tx_PRU cores have their own dedicated IRAM (smaller than
> > a PRU), Control and debug feature sets, but is different in terms of
> > sub-modules integrated around it and does not have the full capabilities
> > associated with a PRU core. The RTU core is typically used to aid a
> > PRU core in accelerating data transfers, while the Tx_PRU cores is
> > normally used to control the TX L2 FIFO if enabled in Ethernet
> > applications. Both can also be used to run independent applications.
> > The RTU and Tx_PRU cores though share the same Data RAMs as the PRU
> > cores, so the memories have to be partitioned carefully between different
> > applications. The new cores also support a new sub-module called Task
> > Manager to support two different context thread executions.
> >
> > Enhance the existing PRU remoteproc driver to support these new PRU, RTU
> > and Tx PRU cores by using specific compatibles. The initial names for the
> > firmware images for each PRU core are retrieved from DT nodes, and can
> > be adjusted through sysfs if required.
> >
> > The PRU remoteproc driver has to be specifically modified to use a
> > custom memcpy function within its ELF loader implementation for these
> > new cores in order to overcome a limitation with copying data into each
> > of the core's IRAM memories. These memory ports support only 4-byte
> > writes, and any sub-word order byte writes clear out the remaining
> > bytes other than the bytes being written within the containing word.
> > The default ARM64 memcpy also cannot be used as it throws an exception
> > when the preferred 8-byte copy operation is attempted. This choice is
> > made by using a state flag that is set only on K3 SoCs.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  drivers/remoteproc/pru_rproc.c | 141 ++++++++++++++++++++++++++++++---
> >  1 file changed, 132 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index 33806ddcbd5d..04c9f07799e2 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -46,9 +46,13 @@
> >  #define PRU_DEBUG_GPREG(x)   (0x0000 + (x) * 4)
> >  #define PRU_DEBUG_CT_REG(x)  (0x0080 + (x) * 4)
> >
> > -/* PRU Core IRAM address masks */
> > +/* PRU/RTU/Tx_PRU Core IRAM address masks */
> >  #define PRU0_IRAM_ADDR_MASK  0x34000
> >  #define PRU1_IRAM_ADDR_MASK  0x38000
> > +#define RTU0_IRAM_ADDR_MASK  0x4000
> > +#define RTU1_IRAM_ADDR_MASK  0x6000
> > +#define TX_PRU0_IRAM_ADDR_MASK       0xa000
> > +#define TX_PRU1_IRAM_ADDR_MASK       0xc000
> >
> >  /* PRU device addresses for various type of PRU RAMs */
> >  #define PRU_IRAM_DA  0       /* Instruction RAM */
> > @@ -73,12 +77,38 @@ enum pru_iomem {
> >       PRU_IOMEM_MAX,
> >  };
> >
> > +/**
> > + * enum pru_type - PRU core type identifier
> > + *
> > + * @PRU_TYPE_PRU: Programmable Real-time Unit
> > + * @PRU_TYPE_RTU: Auxiliary Programmable Real-Time Unit
> > + * @PRU_TYPE_TX_PRU: Transmit Programmable Real-Time Unit
> > + * @PRU_TYPE_MAX: just keep this one at the end
> > + */
> > +enum pru_type {
> > +     PRU_TYPE_PRU = 0,
> > +     PRU_TYPE_RTU,
> > +     PRU_TYPE_TX_PRU,
> > +     PRU_TYPE_MAX,
> > +};
> > +
> > +/**
> > + * struct pru_private_data - device data for a PRU core
> > + * @type: type of the PRU core (PRU, RTU, Tx_PRU)
> > + * @is_k3: flag used to identify the need for special load & event handling
> > + */
> > +struct pru_private_data {
> > +     enum pru_type type;
> > +     unsigned int is_k3 : 1;
> > +};
> > +
> >  /**
> >   * struct pru_rproc - PRU remoteproc structure
> >   * @id: id of the PRU core within the PRUSS
> >   * @dev: PRU core device pointer
> >   * @pruss: back-reference to parent PRUSS structure
> >   * @rproc: remoteproc pointer for this PRU core
> > + * @data: PRU core specific data
> >   * @mem_regions: data for each of the PRU memory regions
> >   * @fw_name: name of firmware image used during loading
> >   * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> > @@ -93,6 +123,7 @@ struct pru_rproc {
> >       struct device *dev;
> >       struct pruss *pruss;
> >       struct rproc *rproc;
> > +     const struct pru_private_data *data;
> >       struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
> >       const char *fw_name;
> >       int *mapped_irq;
> > @@ -318,11 +349,12 @@ static int pru_rproc_start(struct rproc *rproc)
> >  {
> >       struct device *dev = &rproc->dev;
> >       struct pru_rproc *pru = rproc->priv;
> > +     const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
> >       u32 val;
> >       int ret;
> >
> > -     dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
> > -             pru->id, (rproc->bootaddr >> 2));
> > +     dev_dbg(dev, "starting %s%d: entry-point = 0x%llx\n",
> > +             names[pru->data->type], pru->id, (rproc->bootaddr >> 2));
> >
> >       ret = pru_handle_intrmap(rproc);
> >       /*
> > @@ -344,9 +376,10 @@ static int pru_rproc_stop(struct rproc *rproc)
> >  {
> >       struct device *dev = &rproc->dev;
> >       struct pru_rproc *pru = rproc->priv;
> > +     const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
> >       u32 val;
> >
> > -     dev_dbg(dev, "stopping PRU%d\n", pru->id);
> > +     dev_dbg(dev, "stopping %s%d\n", names[pru->data->type], pru->id);
> >
> >       val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
> >       val &= ~CTRL_CTRL_EN;
> > @@ -458,9 +491,53 @@ static struct rproc_ops pru_rproc_ops = {
> >       .da_to_va       = pru_rproc_da_to_va,
> >  };
> >
> > +/*
> > + * Custom memory copy implementation for ICSSG PRU/RTU Cores
>
> Please update this to add Tx_PRU as well to the list here and in the below
> description.

Sure.

>
> > + *
> > + * The ICSSG PRU/RTU cores have a memory copying issue with IRAM memories, that
> > + * is not seen on previous generation SoCs. The data is reflected properly in
> > + * the IRAM memories only for integer (4-byte) copies. Any unaligned copies
> > + * result in all the other pre-existing bytes zeroed out within that 4-byte
> > + * boundary, thereby resulting in wrong text/code in the IRAMs. Also, the
> > + * IRAM memory port interface does not allow any 8-byte copies (as commonly
> > + * used by ARM64 memcpy implementation) and throws an exception. The DRAM
> > + * memory ports do not show this behavior. Use this custom copying function
> > + * to properly load the PRU/RTU firmware images on all memories for simplicity.
>
> This last line is obsolete now that we use regular memcpy for Data RAM copies.

Yes you are right. I will remove the last sentence.

Thank you,
Grzegorz
