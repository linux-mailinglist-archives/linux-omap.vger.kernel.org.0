Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3ED2CEF8E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 15:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388282AbgLDOOd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 09:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388063AbgLDOOd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 09:14:33 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DC5C061A52
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 06:13:52 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id b9so3976374qtr.2
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 06:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sK7iC3pdruGB+NH9jJEsrdEZQJVSx3akg5QYc/kykf8=;
        b=TuuFLk5SmR1Ofdfz9zFXqawLiaFM51K7eErmVcMU2rJbHRuv7CxMZEHFWwuyMAStcr
         JotE26lV1nqsUFLV1h9mDxH2Fntp2QL/FKuLVDWYbb/czeWgFLNANj6g4UgCwF7Wvwf8
         XQFWc7zKggOm0xKfst+zTE6OKsvMB3qGdZXWXyGDX2pEjcDB37OzcQBxlNRY8lySgg8S
         JmxU/6u7vZ3B5RwAF6almFsFZUjKTBBbSyxXjDBKtyLsfF4ZNV0vqMQw6ahP8lXvLLWo
         tskj50P4Ak8qrbeCNk5YtNhXa4Y2g4VAIDtCI1zyjuRO0tTyxiUZLU0TYhOA0OiDHh2r
         Ln7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sK7iC3pdruGB+NH9jJEsrdEZQJVSx3akg5QYc/kykf8=;
        b=sNX/OlXbUQ89vHt4hZKEp8ybBeYvw72w3Jp4w9+oV8bYxO29FXEVyxQaEvZpGJBk3w
         jAoG53+hylmSPgTcm4vwOAKBHfu8x3hkF8KKwKJp1blcbyNHq1MbhBhaiFaMbN6DiIKv
         02fqirbiY9wutA5WAIbe8UfMi3ce0PnliEN1kbwZeSZcuLew16hoiXGcZBjpJucDUtFc
         Pz44we0e8HgJdrvaj6pcnR+DTKMnG1Ftvnk6uIRbHiUTMGzmD0CR57i4C9LUXxTgxlFI
         dm3azfiGi69vLpRQ8I7nWmgw6RvPj0RqZSMdESaGCn+TxnC5YRc4Qlk3g+SY6d1pk28R
         4y8w==
X-Gm-Message-State: AOAM5332PKRUbuftzA0TffMSGNMa0gJZVZHiLeP2UM9XgbI3TNXBfMBn
        oLRTB3UqIN40kADcBjMyLG71Yt0fiqwXdhv9/Z3oTg==
X-Google-Smtp-Source: ABdhPJyYnGGzPuqi/RBEqecB1A8ZYGlI/toiO59TIHwnY69vEmwtWvWlOB1m1tkrS9poy02A0YyuH2C0i/nVEpAuYjg=
X-Received: by 2002:ac8:6b9a:: with SMTP id z26mr9621657qts.200.1607091231410;
 Fri, 04 Dec 2020 06:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-6-grzegorz.jaszczyk@linaro.org> <20201203185118.GB1392978@xps15>
In-Reply-To: <20201203185118.GB1392978@xps15>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 4 Dec 2020 15:13:40 +0100
Message-ID: <CAMxfBF5jt8UuYqsEAUdmHbS-vJvW3RM4SEj97+D2PYq1Zgty3Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] remoteproc/pru: Add support for various PRU cores
 on K3 AM65x SoCs
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

On Thu, 3 Dec 2020 at 19:51, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> On Thu, Nov 19, 2020 at 03:08:49PM +0100, Grzegorz Jaszczyk wrote:
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
> > v1->v2:
> > - Update documentation of pru_rproc_memcpy() according to Suman
> >   comments.
> > - Update documentation of is_k3 flag.
> > ---
> >  drivers/remoteproc/pru_rproc.c | 140 ++++++++++++++++++++++++++++++---
> >  1 file changed, 131 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index d5f04d77ad54..48c1c51e0d42 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -46,10 +46,14 @@
> >  #define PRU_DEBUG_GPREG(x)   (0x0000 + (x) * 4)
> >  #define PRU_DEBUG_CT_REG(x)  (0x0080 + (x) * 4)
> >
> > -/* PRU Core IRAM address masks */
> > +/* PRU/RTU/Tx_PRU Core IRAM address masks */
> >  #define PRU_IRAM_ADDR_MASK   0x3ffff
> >  #define PRU0_IRAM_ADDR_MASK  0x34000
> >  #define PRU1_IRAM_ADDR_MASK  0x38000
> > +#define RTU0_IRAM_ADDR_MASK  0x4000
> > +#define RTU1_IRAM_ADDR_MASK  0x6000
> > +#define TX_PRU0_IRAM_ADDR_MASK       0xa000
> > +#define TX_PRU1_IRAM_ADDR_MASK       0xc000
> >
> >  /* PRU device addresses for various type of PRU RAMs */
> >  #define PRU_IRAM_DA  0       /* Instruction RAM */
> > @@ -74,12 +78,38 @@ enum pru_iomem {
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
> > + * @is_k3: flag used to identify the need for special load handling
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
> > @@ -94,6 +124,7 @@ struct pru_rproc {
> >       struct device *dev;
> >       struct pruss *pruss;
> >       struct rproc *rproc;
> > +     const struct pru_private_data *data;
> >       struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
> >       const char *fw_name;
> >       int *mapped_irq;
> > @@ -319,11 +350,12 @@ static int pru_rproc_start(struct rproc *rproc)
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
> > @@ -345,9 +377,10 @@ static int pru_rproc_stop(struct rproc *rproc)
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
> > @@ -459,9 +492,52 @@ static struct rproc_ops pru_rproc_ops = {
> >       .da_to_va       = pru_rproc_da_to_va,
> >  };
> >
> > +/*
> > + * Custom memory copy implementation for ICSSG PRU/RTU/Tx_PRU Cores
> > + *
> > + * The ICSSG PRU/RTU/Tx_PRU cores have a memory copying issue with IRAM
> > + * memories, that is not seen on previous generation SoCs. The data is reflected
> > + * properly in the IRAM memories only for integer (4-byte) copies. Any unaligned
> > + * copies result in all the other pre-existing bytes zeroed out within that
> > + * 4-byte boundary, thereby resulting in wrong text/code in the IRAMs. Also, the
> > + * IRAM memory port interface does not allow any 8-byte copies (as commonly used
> > + * by ARM64 memcpy implementation) and throws an exception. The DRAM memory
> > + * ports do not show this behavior.
> > + */
> > +static int pru_rproc_memcpy(void *dest, const void *src, size_t count)
> > +{
> > +     const int *s = src;
> > +     int *d = dest;
> > +     int size = count / 4;
> > +     int *tmp_src = NULL;
> > +
> > +     /*
> > +      * TODO: relax limitation of 4-byte aligned dest addresses and copy
> > +      * sizes
> > +      */
> > +     if ((long)dest % 4 || count % 4)
> > +             return -EINVAL;
> > +
> > +     /* src offsets in ELF firmware image can be non-aligned */
> > +     if ((long)src % 4) {
> > +             tmp_src = kmemdup(src, count, GFP_KERNEL);
> > +             if (!tmp_src)
> > +                     return -ENOMEM;
> > +             s = tmp_src;
> > +     }
> > +
> > +     while (size--)
> > +             *d++ = *s++;
>
> I would have expected *d and *s to be u32 * ...
>
> It doesn't matter much because the end result will be the same but it seems odd
> to me, especially when doing memory manipulations.

Ok, I will additionally use u32* for temp_src and size_t for size.

>
> Regardless:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thank you,
Grzegorz


>
> > +
> > +     kfree(tmp_src);
> > +
> > +     return 0;
> > +}
> > +
> >  static int
> >  pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +     struct pru_rproc *pru = rproc->priv;
> >       struct device *dev = &rproc->dev;
> >       struct elf32_hdr *ehdr;
> >       struct elf32_phdr *phdr;
> > @@ -513,7 +589,17 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> >               if (!phdr->p_filesz)
> >                       continue;
> >
> > -             memcpy(ptr, elf_data + phdr->p_offset, filesz);
> > +             if (pru->data->is_k3 && is_iram) {
> > +                     ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
> > +                                            filesz);
> > +                     if (ret) {
> > +                             dev_err(dev, "PRU memory copy failed for da 0x%x memsz 0x%x\n",
> > +                                     da, memsz);
> > +                             break;
> > +                     }
> > +             } else {
> > +                     memcpy(ptr, elf_data + phdr->p_offset, filesz);
> > +             }
> >       }
> >
> >       return ret;
> > @@ -617,9 +703,17 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
> >       int ret = 0;
> >
> >       switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
> > +     case TX_PRU0_IRAM_ADDR_MASK:
> > +             fallthrough;
> > +     case RTU0_IRAM_ADDR_MASK:
> > +             fallthrough;
> >       case PRU0_IRAM_ADDR_MASK:
> >               pru->id = 0;
> >               break;
> > +     case TX_PRU1_IRAM_ADDR_MASK:
> > +             fallthrough;
> > +     case RTU1_IRAM_ADDR_MASK:
> > +             fallthrough;
> >       case PRU1_IRAM_ADDR_MASK:
> >               pru->id = 1;
> >               break;
> > @@ -640,8 +734,13 @@ static int pru_rproc_probe(struct platform_device *pdev)
> >       struct rproc *rproc = NULL;
> >       struct resource *res;
> >       int i, ret;
> > +     const struct pru_private_data *data;
> >       const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
> >
> > +     data = of_device_get_match_data(&pdev->dev);
> > +     if (!data)
> > +             return -ENODEV;
> > +
> >       ret = of_property_read_string(np, "firmware-name", &fw_name);
> >       if (ret) {
> >               dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
> > @@ -674,6 +773,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
> >
> >       pru = rproc->priv;
> >       pru->dev = dev;
> > +     pru->data = data;
> >       pru->pruss = platform_get_drvdata(ppdev);
> >       pru->rproc = rproc;
> >       pru->fw_name = fw_name;
> > @@ -725,11 +825,33 @@ static int pru_rproc_remove(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +static const struct pru_private_data pru_data = {
> > +     .type = PRU_TYPE_PRU,
> > +};
> > +
> > +static const struct pru_private_data k3_pru_data = {
> > +     .type = PRU_TYPE_PRU,
> > +     .is_k3 = 1,
> > +};
> > +
> > +static const struct pru_private_data k3_rtu_data = {
> > +     .type = PRU_TYPE_RTU,
> > +     .is_k3 = 1,
> > +};
> > +
> > +static const struct pru_private_data k3_tx_pru_data = {
> > +     .type = PRU_TYPE_TX_PRU,
> > +     .is_k3 = 1,
> > +};
> > +
> >  static const struct of_device_id pru_rproc_match[] = {
> > -     { .compatible = "ti,am3356-pru", },
> > -     { .compatible = "ti,am4376-pru", },
> > -     { .compatible = "ti,am5728-pru", },
> > -     { .compatible = "ti,k2g-pru",    },
> > +     { .compatible = "ti,am3356-pru",        .data = &pru_data },
> > +     { .compatible = "ti,am4376-pru",        .data = &pru_data },
> > +     { .compatible = "ti,am5728-pru",        .data = &pru_data },
> > +     { .compatible = "ti,k2g-pru",           .data = &pru_data },
> > +     { .compatible = "ti,am654-pru",         .data = &k3_pru_data },
> > +     { .compatible = "ti,am654-rtu",         .data = &k3_rtu_data },
> > +     { .compatible = "ti,am654-tx-pru",      .data = &k3_tx_pru_data },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, pru_rproc_match);
> > --
> > 2.29.0
> >
