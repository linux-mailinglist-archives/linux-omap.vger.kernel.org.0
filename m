Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07A212720D
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 01:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfLTAMk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 19:12:40 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:37494 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfLTAMk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 19:12:40 -0500
Received: by mail-il1-f195.google.com with SMTP id t8so6421438iln.4
        for <linux-omap@vger.kernel.org>; Thu, 19 Dec 2019 16:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qs+Sa1+sjdzty0pSCITj5traxewzN9G4gEr6T5j5V9o=;
        b=AB1vxyAhSPg1F6ndqplSaA8FVhn2Lc5356ua92meLm6LyrQ23o1YyQLCVWsOCjkemv
         0RzNk6LZKO//2H5SpazVTDR1nQ66iwWrxj/n56XZZ0+HKXmPQe8/REQkeA1U0pW/bafh
         KzYHlz0UMZ7b0Tx5VoRAm/y1jB8VpibJim9lYR+cHLkWmg4NRR01a0WLTvMXQF+4vgo1
         D4idV7lc60ZDKjrXJfmRsmWCbvnPzLpES3ak6A4m+4xf+ACIyK73384Qn5ERdlwQ6IIm
         /huR3RcIWvtvM+IL7Imwkyev4MyOX2iczJH0B4XTBc0xLsbb4Wzc64qb/9eLgiRSAbxL
         Tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qs+Sa1+sjdzty0pSCITj5traxewzN9G4gEr6T5j5V9o=;
        b=ZXrPko2oMMTk4YocPnIFk4EID+DLTGn+KEFXuqwvnLP8/KN9+tAkxydZnYDBy3Baqo
         gbkOb70SigiyGlXkZmw3TgApEtiTxSGQOZvJzl3h3BNpFzIVtRIR/mfDFZdZSosIhH0r
         25sivDgFYSDAzZ0YHVhPMeiczgSVTJCeYg0uTMDAsTQHpHxz2nUECpd6KMOQw44RKctN
         Z9aHG7iBMA6+4XEnlsVrjnpoKSJVy3ojco23RgYVmr74wugZDBc9IWjDVgF4uAh64WkW
         25L4LiYxu2bFxo+oYtMa7xFNs0hG9fKEBQErJ3quNXQsTQftA1QkM55fODNI5vO5csHk
         eh8w==
X-Gm-Message-State: APjAAAWX88X7f5AD7SA5bYDg8P/wY5ZjTSA+R8DIKFmqchQ6prNwJCCg
        QcjJOIGEAkhKnHgST/eywO67b9Pbf4mL5gsnQCbXmw==
X-Google-Smtp-Source: APXvYqwVkT3CPJ6BN3SwzlEKH987cMoOerm9iYmX3wpm0k/KDXdLWFripwK1aX2mpwPSzcGFK+Y/d/WLoT1WAt/xby8=
X-Received: by 2002:a92:1711:: with SMTP id u17mr9937804ill.72.1576800759377;
 Thu, 19 Dec 2019 16:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20191213125537.11509-1-t-kristo@ti.com> <20191213125537.11509-6-t-kristo@ti.com>
 <20191218003815.GC16271@xps15> <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
In-Reply-To: <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 19 Dec 2019 17:12:28 -0700
Message-ID: <CANLsYkz=ZV-AABXq2mSdwKkcdkQgFwStepteFnMBc4j=ahe4Dw@mail.gmail.com>
Subject: Re: [PATCHv3 05/15] remoteproc/omap: Add the rproc ops .da_to_va() implementation
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 19 Dec 2019 at 06:18, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 18/12/2019 02:38, Mathieu Poirier wrote:
> > On Fri, Dec 13, 2019 at 02:55:27PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> An implementation for the rproc ops .da_to_va() has been added
> >> that provides the address translation between device addresses
> >> to kernel virtual addresses for internal RAMs present on that
> >> particular remote processor device. The implementation provides
> >> the translations based on the addresses parsed and stored during
> >> the probe.
> >>
> >> This ops gets invoked by the exported rproc_da_to_va() function
> >> and allows the remoteproc core's ELF loader to be able to load
> >> program data directly into the internal memories.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>   drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
> >>   1 file changed, 39 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >> index 844703507a74..28f14e24b389 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.c
> >> +++ b/drivers/remoteproc/omap_remoteproc.c
> >> @@ -232,10 +232,49 @@ static int omap_rproc_stop(struct rproc *rproc)
> >>      return 0;
> >>   }
> >>
> >> +/**
> >> + * omap_rproc_da_to_va() - internal memory translation helper
> >> + * @rproc: remote processor to apply the address translation for
> >> + * @da: device address to translate
> >> + * @len: length of the memory buffer
> >> + *
> >> + * Custom function implementing the rproc .da_to_va ops to provide address
> >> + * translation (device address to kernel virtual address) for internal RAMs
> >> + * present in a DSP or IPU device). The translated addresses can be used
> >> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
> >> + * Returns the translated virtual address in kernel memory space, or NULL
> >> + * in failure.
> >> + */
> >> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> >> +{
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    int i;
> >> +    u32 offset;
> >> +
> >> +    if (len <= 0)
> >> +            return NULL;
> >> +
> >> +    if (!oproc->num_mems)
> >> +            return NULL;
> >> +
> >> +    for (i = 0; i < oproc->num_mems; i++) {
> >> +            if (da >= oproc->mem[i].dev_addr && da + len <=
> >
> > Shouldn't this be '<' rather than '<=' ?
>
> No, I think <= is correct. You need to consider the initial byte in the
> range also. Consider a simple case where you provide the exact da + len
> corresponding to a specific memory range.

For that specific case you are correct.  On the flip side if @da falls
somewhere after @mem[i].dev_addr, there is a possibility to clobber
the first byte of the next range if <= is used.

Thanks,
Mathieu

>
> >
> >> +                oproc->mem[i].dev_addr +  oproc->mem[i].size) {
> >
> > One space too many after the '+' .
>
> True, I wonder why checkpatch did not catch this.
>
> >
> >> +                    offset = da -  oproc->mem[i].dev_addr;
> >
> > One space too many after then '-' .
>
> Same, will fix these two.
>
> -Tero
>
> >
> >> +                    /* __force to make sparse happy with type conversion */
> >> +                    return (__force void *)(oproc->mem[i].cpu_addr +
> >> +                                            offset);
> >> +            }
> >> +    }
> >> +
> >> +    return NULL;
> >> +}
> >> +
> >>   static const struct rproc_ops omap_rproc_ops = {
> >>      .start          = omap_rproc_start,
> >>      .stop           = omap_rproc_stop,
> >>      .kick           = omap_rproc_kick,
> >> +    .da_to_va       = omap_rproc_da_to_va,
> >>   };
> >>
> >>   static const char * const ipu_mem_names[] = {
> >> --
> >> 2.17.1
> >>
> >> --
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
